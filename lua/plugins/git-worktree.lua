local parse_worktrees = function(output)
  local lines = vim.split(vim.trim(output or ""), "\n", { plain = true })
  local push_item = function(acc, entry)
    return entry.path and vim.list_extend(acc, {
      {
        path = entry.path,
        branch = entry.branch and entry.branch:gsub("^refs/heads/", "") or "(detached)",
        hash = entry.hash,
        current = entry.current or false,
      },
    }) or acc
  end

  local state = vim.iter(lines):fold({ items = {}, entry = {} }, function(acc, line)
    if line == "" then
      return { items = push_item(acc.items, acc.entry), entry = {} }
    end

    local key, value = line:match("^(%S+)%s+(.+)$")

    return key == "worktree" and {
        items = acc.items,
        entry = vim.tbl_extend("force", acc.entry, { path = value }),
      }
      or key == "branch" and {
        items = acc.items,
        entry = vim.tbl_extend("force", acc.entry, { branch = value }),
      }
      or key == "HEAD" and {
        items = acc.items,
        entry = vim.tbl_extend("force", acc.entry, { hash = value }),
      }
      or key == "bare" and {
        items = acc.items,
        entry = vim.tbl_extend("force", acc.entry, { branch = "(bare)" }),
      }
      or key == "detached" and {
        items = acc.items,
        entry = vim.tbl_extend("force", acc.entry, { branch = "(detached)" }),
      }
      or key == "current" and {
        items = acc.items,
        entry = vim.tbl_extend("force", acc.entry, { current = true }),
      }
      or acc
  end)

  return push_item(state.items, state.entry)
end

local run_git = function(args)
  return vim.system(vim.list_extend({ "git" }, args), { text = true }):wait()
end

local get_worktrees = function()
  local result = run_git({ "worktree", "list", "--porcelain" })

  if result.code ~= 0 then
    vim.notify(result.stderr ~= "" and result.stderr or "Not inside a git worktree", vim.log.levels.ERROR)
    return {}
  end

  return vim
    .iter(parse_worktrees(result.stdout))
    :map(function(worktree)
      return vim.tbl_extend("force", worktree, {
        file = worktree.path,
        text = string.format("%s%s", worktree.current and "● " or "  ", worktree.branch),
      })
    end)
    :totable()
end

local branch_exists = function(branch)
  return run_git({ "show-ref", "--verify", "--quiet", "refs/heads/" .. branch }).code == 0
end

local remote_branch_exists = function(branch)
  return run_git({ "show-ref", "--verify", "--quiet", "refs/remotes/origin/" .. branch }).code == 0
end

local current_branch = function()
  local result = run_git({ "branch", "--show-current" })
  return result.code == 0 and vim.trim(result.stdout) or ""
end

local resolve_path = function(path)
  if path == nil or path == "" then
    return nil
  end

  return vim.fs.normalize(vim.startswith(path, "/") and path or vim.fs.joinpath(vim.fn.getcwd(), path))
end

local repo_root = function()
  local common_dir_result = run_git({ "rev-parse", "--git-common-dir" })

  if common_dir_result.code == 0 then
    local common_dir = resolve_path(vim.trim(common_dir_result.stdout))

    if common_dir then
      return vim.fs.dirname(common_dir)
    end
  end

  local top_level_result = run_git({ "rev-parse", "--show-toplevel" })

  if top_level_result.code == 0 then
    return resolve_path(vim.trim(top_level_result.stdout))
  end

  vim.notify("Not inside a git repository", vim.log.levels.ERROR)
  return nil
end

local worktree_root = function()
  local root = repo_root()
  return root and vim.fs.joinpath(root, ".worktrees") or nil
end

local default_worktree_name = function(branch)
  return vim.trim((branch or ""):gsub("[/\\]+", "-"))
end

local ensure_worktree_exclude = function()
  local root = repo_root()

  if not root then
    return
  end

  local exclude_path = vim.fs.joinpath(root, ".git", "info", "exclude")
  local exclude_lines = {}
  local existing = vim.fn.filereadable(exclude_path) == 1 and vim.fn.readfile(exclude_path) or {}
  local already_present = vim.iter(existing):any(function(line)
    return vim.trim(line) == ".worktrees/"
  end)

  if already_present then
    return
  end

  exclude_lines = vim.list_extend(vim.deepcopy(existing), { ".worktrees/" })

  local write_result = vim.system({ "mkdir", "-p", vim.fs.dirname(exclude_path) }, { text = true }):wait()

  if write_result.code ~= 0 then
    vim.notify(write_result.stderr ~= "" and write_result.stderr or "Failed to prepare .git/info", vim.log.levels.WARN)
    return
  end

  local ok, err = pcall(vim.fn.writefile, exclude_lines, exclude_path)

  if not ok then
    vim.notify(err, vim.log.levels.WARN)
    return
  end
end

local ensure_shared_node_modules = function(path)
  local root = repo_root()

  if not root then
    return
  end

  local repo_node_modules = vim.fs.joinpath(root, "node_modules")
  local worktree_node_modules = vim.fs.joinpath(path, "node_modules")

  if not vim.uv.fs_stat(repo_node_modules) or vim.uv.fs_stat(worktree_node_modules) then
    return
  end

  local link_target = vim.fs.relpath(path, repo_node_modules)

  if not link_target or link_target == "" then
    return
  end

  local link_result = vim.system({ "ln", "-s", link_target, worktree_node_modules }, { text = true }):wait()

  if link_result.code ~= 0 then
    vim.notify(link_result.stderr ~= "" and link_result.stderr or "Failed to link shared node_modules", vim.log.levels.WARN)
    return
  end

  vim.notify(string.format("Linked shared node_modules -> %s. If package.json or lockfiles change, run a local install in this worktree.", link_target), vim.log.levels.INFO)
end

local worktree_is_dirty = function(path)
  local result = vim.system({ "git", "-C", path, "status", "--porcelain" }, { text = true }):wait()
  return result.code == 0 and vim.trim(result.stdout) ~= ""
end

local switch_worktree = function(worktree)
  if not worktree or not worktree.path then
    return
  end

  vim.g.worktree_branch_for_statusline = worktree.branch
  vim.cmd.cd(vim.fn.fnameescape(worktree.path))

  vim.schedule(function()
    local statusline_ok, lualine = pcall(require, "lualine")

    if statusline_ok then
      lualine.refresh({ place = { "statusline" } })
    end

    vim.cmd("redrawstatus")
  end)

  vim.notify(string.format("Switched to %s", worktree.path), vim.log.levels.INFO)
end

local remove_worktree = function(worktree, on_done)
  if not worktree or not worktree.path then
    return
  end

  if worktree.current then
    vim.notify("Cannot remove the current worktree", vim.log.levels.ERROR)
    return
  end

  local confirm_choice = function(prompt, yes_label)
    local choice = vim.fn.confirm(prompt, string.format("&%s\n&Cancel", yes_label), 2)
    return choice == 1
  end

  local confirm_remove = function(force)
    local args = force and { "worktree", "remove", "--force", worktree.path } or { "worktree", "remove", worktree.path }
    local result = run_git(args)

    if result.code ~= 0 then
      vim.notify(result.stderr ~= "" and result.stderr or "Failed to remove worktree", vim.log.levels.ERROR)
      return
    end

    vim.notify(string.format("Removed worktree %s", worktree.path), vim.log.levels.INFO)

    if on_done then
      on_done()
    end
  end

  if worktree_is_dirty(worktree.path) then
    local force_confirmed = confirm_choice(
      string.format("Worktree has uncommitted changes.\n\nForce remove %s?", worktree.path),
      "Force Remove"
    )

    if force_confirmed then
      confirm_remove(true)
    end

    return
  end

  local remove_confirmed = confirm_choice(string.format("Remove worktree %s?", worktree.path), "Remove")

  if remove_confirmed then
    confirm_remove(false)
  end
end

local pick_worktree = function()
  local worktrees = get_worktrees()

  if vim.tbl_isempty(worktrees) then
    return
  end

  Snacks.picker({
    title = "Git Worktrees  <CR>: switch  <C-d>: delete",
    items = worktrees,
    format = function(item)
      return {
        { item.current and "● " or "  ", item.current and "DiagnosticInfo" or "Comment" },
        { item.branch, item.current and "Function" or "Identifier" },
        { "  " .. item.path, "Comment" },
      }
    end,
    preview = "directory",
    actions = {
      remove_worktree = function(picker)
        local item = picker:selected({ fallback = true })[1]

        picker:close()
        remove_worktree(item, function()
          vim.defer_fn(function()
            local ok, err = pcall(pick_worktree)

            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end, 20)
        end)
      end,
    },
    confirm = function(picker, item)
      picker:close()
      switch_worktree(item)
    end,
    win = {
      input = {
        keys = {
          ["<CR>"] = { "confirm", mode = { "n", "i" } },
          ["<C-d>"] = { "remove_worktree", mode = { "n", "i" } },
        },
      },
      list = {
        keys = {
          ["dd"] = "remove_worktree",
          ["x"] = "remove_worktree",
          ["<C-d>"] = { "remove_worktree", mode = { "n", "i" } },
        },
      },
    },
  })
end

local create_worktree = function()
  local target_root = worktree_root()

  if not target_root then
    return
  end

  ensure_worktree_exclude()

  vim.ui.input({ prompt = "Branch name: ", default = current_branch() ~= "" and current_branch() or nil }, function(branch)
    local trimmed_branch = branch and vim.trim(branch) or ""

    if trimmed_branch == "" then
      return
    end

    local suggested_name = default_worktree_name(trimmed_branch)

    vim.ui.input({
      prompt = string.format("Worktree dir name (.worktrees/%s): ", suggested_name),
      default = suggested_name,
    }, function(name)
      local trimmed_name = name and vim.trim(name) or suggested_name

      if trimmed_name == "" then
        return
      end

      local path = vim.fs.joinpath(target_root, trimmed_name)

      if vim.uv.fs_stat(path) then
        vim.notify(string.format("Worktree path already exists: %s", path), vim.log.levels.ERROR)
        return
      end

      local mkdir_result = vim.system({ "mkdir", "-p", target_root }, { text = true }):wait()

      if mkdir_result.code ~= 0 then
        vim.notify(mkdir_result.stderr ~= "" and mkdir_result.stderr or "Failed to create worktree root", vim.log.levels.ERROR)
        return
      end

      local finish = function(add_result)
        if add_result.code ~= 0 then
          vim.notify(add_result.stderr ~= "" and add_result.stderr or "Failed to create worktree", vim.log.levels.ERROR)
          return
        end

        ensure_shared_node_modules(path)
        switch_worktree({ path = path, branch = trimmed_branch })
      end

      if branch_exists(trimmed_branch) then
        finish(run_git({ "worktree", "add", path, trimmed_branch }))
        return
      end

      if remote_branch_exists(trimmed_branch) then
        finish(run_git({ "worktree", "add", "-b", trimmed_branch, path, "origin/" .. trimmed_branch }))
        return
      end

      local base_branch = current_branch()

      vim.ui.input({
        prompt = "Base branch for new branch: ",
        default = base_branch ~= "" and base_branch or nil,
      }, function(base)
        local trimmed_base = vim.trim(base and base ~= "" and base or base_branch)

        if trimmed_base == "" then
          vim.notify("A base branch is required to create a new worktree branch", vim.log.levels.ERROR)
          return
        end

        finish(run_git({ "worktree", "add", "-b", trimmed_branch, path, trimmed_base }))
      end)
    end)
  end)
end

return {
  "polarmutex/git-worktree.nvim",
  enabled = true,
  keys = {
    {
      "<leader>gw",
      pick_worktree,
      desc = "Switch Worktree",
    },
    {
      "<leader>gW",
      create_worktree,
      desc = "Create Worktree",
    },
  },
  config = function()
    local ok, worktree = pcall(require, "git-worktree")

    if not ok then
      return
    end

    worktree.on_tree_change(function(op, metadata)
      if op == worktree.Operations.Switch then
        vim.schedule(function()
          vim.notify(string.format("Switched from %s to %s", metadata.prev_path, metadata.path), vim.log.levels.INFO)
        end)
      end
    end)
  end,
}
