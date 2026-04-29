return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    -- In Neovim 0.12, we no longer need the massive setup block.
    -- This plugin is now just here to provide the :TSInstall commands.
  },
}
