require'nvim-treesitter.configs'.setup {
  ensure_installed = {"markdown", "markdown_inline", "sql", "python", "lua", "javascript", "bash", "json", "sql", "yaml", "go"},

  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}

