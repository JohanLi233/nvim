local present, ts_config = pcall(require, "nvim-treesitter.configs")
-- ้บป็ฆ็ๆ
if not present then
   return
end

ts_config.setup {
   ensure_installed = {
      "lua",
      "vim",
      "go",
      "c",
      "cpp",
      "html",
   },
   highlight = {
      enable = true,
      use_languagetree = true,
   },
}
