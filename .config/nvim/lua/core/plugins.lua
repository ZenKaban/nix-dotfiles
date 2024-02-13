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
    {"epwalsh/obsidian.nvim",
        version = "*",  -- recommended, use latest release instead of latest commit
        lazy = true,
        ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
        dependencies = {
            -- Required.
            "nvim-lua/plenary.nvim",

            -- see below for full list of optional dependencies 👇
        },
        opts = {
        workspaces = {
            {
                name = "Main",
                path = "~/Main",
            },
            {
                name = "work",
                path = "~/vaults/work",
            },
        },

        follow_url_func = function(url)
            -- Open the URL in the default web browser.
            -- vim.fn.jobstart({"open", url})  -- Mac OS
            vim.fn.jobstart({"xdg-open", url})  -- linux
        end,

        completion = {
            -- Set to false to disable completion.
            nvim_cmp = true,

            -- Trigger completion at 2 chars.
            min_chars = 2,

            -- Where to put new notes created from completion. Valid options are
            --  * "current_dir" - put new notes in same directory as the current buffer.
            --  * "notes_subdir" - put new notes in the default notes subdirectory.
            new_notes_location = "current_dir",

            -- Either 'wiki' or 'markdown'.
            preferred_link_style = "wiki",

            -- Control how wiki links are completed with these (mutually exclusive) options:
            --
            -- 1. Whether to add the note ID during completion.
            -- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
            -- Mutually exclusive with 'prepend_note_path' and 'use_path_only'.
            prepend_note_id = true,
            -- 2. Whether to add the note path during completion.
            -- E.g. "[[Foo" completes to "[[notes/foo|Foo]]" assuming "notes/foo.md" is the path of the note.
            -- Mutually exclusive with 'prepend_note_id' and 'use_path_only'.
            prepend_note_path = false,
            -- 3. Whether to only use paths during completion.
            -- E.g. "[[Foo" completes to "[[notes/foo]]" assuming "notes/foo.md" is the path of the note.
            -- Mutually exclusive with 'prepend_note_id' and 'prepend_note_path'.
            use_path_only = false,
        },

        -- Optional, configure key mappings. These are the defaults. If you don't want to set any keymappings this
        -- way then set 'mappings = {}'.
        mappings = {
            -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
            ["gf"] = {
                action = function()
                    return require("obsidian").util.gf_passthrough()
                end,
                opts = { noremap = false, expr = true, buffer = true },
            },
            -- Toggle check-boxes.
            ["<leader>ch"] = {
                action = function()
                    return require("obsidian").util.toggle_checkbox()
                end,
                opts = { buffer = true },
            },
        }

    -- see below for full list of options 👇
	},
    },
    -- Themes
    {'joshdick/onedark.vim'},
    {'rebelot/kanagawa.nvim'},
    {'shaunsingh/solarized.nvim'},
    {"shaunsingh/nord.nvim"},

});
