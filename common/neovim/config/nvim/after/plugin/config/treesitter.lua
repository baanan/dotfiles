require('nvim-treesitter.configs').setup {
  ensure_installed = { "rust", "toml", "regex", "vim", "lua", "java", "json", "python", "yaml", "bash" },
  hightlight = { enable = true },
  sync_install = true,
}
