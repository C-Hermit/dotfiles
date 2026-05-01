return {
  -- 1. 先确保 Copilot 存在并配置好
  {
    "zbirenbaum/copilot.lua",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
        },
      })
    end,
  },

  -- 2. 配置 Avante
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- 建议使用最新开发版
    opts = {
      provider = "copilot",
    },
    -- 关键：确保 dependencies 包含 copilot.lua
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- 核心依赖
      "zbirenbaum/copilot.lua",
      "nvim-tree/nvim-web-devicons",
    },
    build = "make", -- 如果是 Windows，请改为 "powershell -ExecutionPolicy Bypass -File Build.ps1"
  },
}
