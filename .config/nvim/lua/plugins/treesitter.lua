require'nvim-treesitter.configs'.setup {
  ensure_installed = {"markdown", "markdown_inline", "sql", "python", "lua", "javascript", "bash", "go", "json", "sql", "yaml"},

  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}

