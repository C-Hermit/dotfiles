return{
    --自动补全引擎
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter", -- 进入插入模式时才加载，节省内存
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", -- 允许补全引擎读取 LSP 的数据
            "hrsh7th/cmp-buffer",   -- 允许补全当前文件里的词
            "hrsh7th/cmp-path",     -- 允许补全路径 (输入 ./ 时的提示)
            "L3MON4D3/LuaSnip",     -- 代码片段引擎
            "saadparwaiz1/cmp_luasnip", -- 桥接补全和代码片段
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(), -- 强制弹出提示
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- 回车确认补全
                    ["<Tab>"] = cmp.mapping.select_next_item(), -- Tab 下一个
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- Shift+Tab 上一个
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" }, -- 优先级最高：来自代码逻辑的补全
                    { name = "luasnip" },  -- 来自代码片段
                    { name = "buffer" },   -- 来自当前文字
                    { name = "path" },     -- 来自文件系统
                }),
            })
        end,
    },
    --自动补全括号
    {
        "nvim-mini/mini.pairs",
        opts = {
            modes = { insert = true, command = true, terminal = false },
            -- skip autopair when next character is one of these
            skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
            -- skip autopair when the cursor is inside these treesitter nodes
            skip_ts = { "string" },
            -- skip autopair when next character is closing pair
            -- and there are more closing pairs than opening pairs
            skip_unbalanced = true,
            -- better deal with markdown code blocks
            markdown = true,
        },
    },
    --智能注释
    {
        "folke/ts-comments.nvim",
        event = "VeryLazy",
        opts = {},
    },
}
