require('nvim-rooter').setup {
  rooter_patterns = { '*.go', '*.py', '.git', '.hg', '.svn' },
  trigger_patterns = { '*' },
  manual = false,
  fallback_to_parent = false,
}
