return {
  {
    "echasnovski/mini.bufremove",
  -- stylua: ignore
  keys = {
    { "<leader>c", function() require("mini.bufremove").delete(0, false) end, desc = "Close Buffer" },
    -- { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
  },
  },
}
