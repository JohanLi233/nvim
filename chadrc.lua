-- IMPORTANT NOTE : This is the user config, can be edited. Will be preserved if updated with internal updater
-- This file is for NvChad options & tools, custom settings are split between here and 'lua/custom/init.lua'

local M = {}
M.options, M.ui, M.mappings, M.plugins = {}, {}, {}, {}

-- NOTE: To use this, make a copy with `cp example_chadrc.lua chadrc.lua`

--------------------------------------------------------------------

-- To use this file, copy the structure of `core/default_config.lua`,
-- examples of setting relative number & changing theme:

M.options = {
   relativenumber = true,
   -- 取消同步到系统剪切板
    clipboard = "",
}

M.ui = {
  theme = "tokyonight"
}

-- NvChad included plugin options & overrides
M.plugins = {
   status = {
      dashboard = true,
   },
   options = {
      lspconfig = {
        setup_lspconf = "custom.configs.lspconfig",
      },
   },
   -- To change the Packer `config` of a plugin that comes with NvChad,
   -- add a table entry below matching the plugin github name
   --              '-' -> '_', remove any '.lua', '.nvim' extensions
   -- this string will be called in a `require`
   --              use "(custom.configs).my_func()" to call a function
   --              use "custom.blankline" to call a file
   default_plugin_config_replace = {
      -- autopairs = "custom.configs.autopairs"
      dashboard = "custom.configs.dashboard"
   },
}

return M
