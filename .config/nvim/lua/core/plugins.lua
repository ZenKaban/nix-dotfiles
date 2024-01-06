local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.3',
        dependencies = {'nvim-lua/plenary.nvim'}
    }, 
    {'cooperuser/glowbeam.nvim'},
    {'nvim-treesitter/nvim-treesitter'}, 
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-buffer'}, 
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-cmdline'}, 
    {'hrsh7th/nvim-cmp'}, 
    {'lewis6991/gitsigns.nvim'},
    {'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons', 'linrongbin16/lsp-progress.nvim'
        }
    }, 
    {'nvim-tree/nvim-web-devicons'},
    {"williamboman/mason.nvim", build = ":MasonUpdate"},
    {'akinsho/toggleterm.nvim', version = "*", config = true},
    -- {'jose-elias-alvarez/null-ls.nvim'}, 
    {'windwp/nvim-autopairs'},
    {'terrortylor/nvim-comment'},
    {"hedyhli/outline.nvim",
        lazy = true,
        cmd = { "Outline", "OutlineOpen" },
        keys = { -- Example mapping to toggle outline
            { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
        },
        opts = {
            -- Your setup opts here
        },
    },
    {'windwp/nvim-ts-autotag'}, 
    {"nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim", "s1n7ax/nvim-window-picker"
        }
    },
    {"akinsho/bufferline.nvim", 
        dependencies = {'nvim-tree/nvim-web-devicons'}
    },
    {'hrsh7th/cmp-nvim-lsp-signature-help'}, 
    {'linrongbin16/lsp-progress.nvim',
        event = {'VimEnter'},
        dependencies = {'nvim-tree/nvim-web-devicons'},
        config = function() require('lsp-progress').setup() end
    }, 
    {"folke/which-key.nvim"},
    {'hrsh7th/vim-vsnip' },
    {'hrsh7th/vim-vsnip-integ'},
    {"kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
	},
    {'mikesmithgh/kitty-scrollback.nvim',
        enabled = true,
        lazy = true,
        cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth' },
        event = { 'User KittyScrollbackLaunch' },
        -- version = '*', -- latest stable version, may have breaking changes if major version changed
        -- version = '^2.0.0', -- pin major version, include fixes and features that do not have breaking changes
        config = function()
            require('kitty-scrollback').setup()
    end,
    },
    {"folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        keys = {
            {"s",
                mode = { "n", "x", "o" },
                function()
                    require("flash").jump({
                        search = {
                        mode = function(str)
                        return "\\<" .. str
                        end,
                        },
                    })
                end,
                desc = "Flash",
            },
            {"S",
                mode = { "n", "o", "x" },
                function()
                    require("flash").treesitter()
                end,
                desc = "Flash Treesitter",
            },
            {"r",
                mode = "o",
                function()
                    require("flash").remote()
                end,
                desc = "Remote Flash",
            },
            {"R",
                mode = { "o", "x" },
                function()
                    require("flash").treesitter_search()
                end,
                desc = "Flash Treesitter Search",
            },
            {"<c-s>",
                mode = { "c" },
                function()
                    require("flash").toggle()
                end,
                desc = "Toggle Flash Search",
            },
            },
    },
    -- Themes
    {'joshdick/onedark.vim'},
    {'rebelot/kanagawa.nvim'},
    {'shaunsingh/solarized.nvim'},
    {"shaunsingh/nord.nvim"},

});
