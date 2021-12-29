-- This is where your custom modules and plugins go.
-- See the wiki for a guide on how to extend NvChad

local hooks = require "core.hooks"

-- NOTE: To use this, make a copy with `cp example_init.lua init.lua`

--------------------------------------------------------------------

-- To modify packaged plugin configs, use the overrides functionality
-- if the override does not exist in the plugin config, make or request a PR,
-- or you can override the whole plugin config with 'chadrc' -> M.plugins.default_plugin_config_replace{}
-- this will run your config instead of the NvChad config for the given plugin

-- hooks.override("lsp", "publish_diagnostics", function(current)
--   current.virtual_text = false;
--   return current;
-- end)

-- To add new mappings, use the "setup_mappings" hook,
-- you can set one or many mappings
-- example below:

-- hooks.add("setup_mappings", function(map)
--    map("n", "<leader>cc", "gg0vG$d", opt) -- example to delete the buffer
--    .... many more mappings ....
-- end)

-- To add new plugins, use the "install_plugin" hook,
-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event' field)
-- see: https://github.com/wbthomason/packer.nvim
-- examples below:

hooks.add("install_plugins", function(use)
  -- 平滑滚动
  use {
    "karb94/neoscroll.nvim",
     opt = true,
     config = function()
        require("neoscroll").setup()
     end,

     -- lazy loading
     setup = function()
       require("core.utils").packer_lazy_load "neoscroll.nvim"
     end,
  }

  -- 自动打开上次浏览位置
  use {
    "farmergreg/vim-lastplace"
  }

  -- 历史修改记录
  use {
        "mbbill/undotree",
        opt = true,
        cmd = "UndotreeToggle",
  }

  -- 多光标
  use {
    "mg979/vim-visual-multi",
    keys = {"<C-n>"},
  }

  -- 增删改引号
  use {
    "tpope/vim-surround",
    keys = {"c", "d"},
  }

  -- 快速选中
  use {
    "gcmt/wildfire.vim",
    keys = "<CR>",
  }

  -- 代码格式化
  -- use {
  --     "jose-elias-alvarez/null-ls.nvim",
  --     after = "nvim-lspconfig",
  --     config = function()
  --        require("custom.configs.null-ls").setup()
  --     end,
  --  }
  use {
    "Chiel92/vim-autoformat",
    cmd = "Autoformat",
  }
  -- use {
  --   "mhartington/formatter.nvim",
  --   opt = true,
  --   ft = "cpp",
  --   config = function ()
  --     require("custom.configs.format")
  --   end,
  -- }

  -- 快速分析启动时间
  use {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  }

  -- 编辑只读文件
  use {
    "lambdalisue/suda.vim",
    cmd = "SudaWrite",
  }

  -- 现代任务系统
  use {
    "skywind3000/asynctasks.vim",
    requires = "skywind3000/asyncrun.vim",
    cmd = {"AsyncTask", "AsyncTaskEdit"},
  }

  -- 函数列表
  use {
    "liuchengxu/vista.vim",
    cmd = "Vista",
  }

  -- markdown预览
  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && yarn install",
    ft = "markdown",
  }

  -- 制作markdown表格
  use {
    "dhruvasagar/vim-table-mode",
    cmd = "TableModeToggle",
  }

  -- 管理笔记插件
  use {
    "vimwiki/vimwiki",
    ft = "markdown",
  }
  -- 透明背景
  use {
    "xiyaowong/nvim-transparent",
  }
  -- 单词下划线
  use {
    "itchyny/vim-cursorword",
  }
  -- 快捷注释
  use {
    "preservim/nerdcommenter",
  }
  -- python 单词高亮
  use {
    "numirias/semshi",
  }
  -- you complete met
  use {
    "ycm-core/YouCompleteMe",
  }
end)

-- alternatively, put this in a sub-folder like "lua/custom/plugins/mkdir"
-- then source it with

-- 添加一些init配置
require "custom.custom_init"
-- 按键映射
require "custom.custom_mappings"
