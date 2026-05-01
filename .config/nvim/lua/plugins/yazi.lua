return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>-", -- 绑定一个你顺手的快捷键
      "<cmd>Yazi<cr>",
      desc = "Open yazi at current file",
    },
  },
  opts = {
    open_for_directories = true, -- 当打开目录时自动替代 netrw
  },
}
