local M = {}

M.project = function()
  require("project_nvim").setup {}
end

M.markdown_preview = function()
  vim.cmd("let g:mkdp_browser = 'C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe'")
end

M.glow = function()
  vim.g.glow_binary_path = vim.env.HOME .. "/.local/bin"
  vim.g.glow_border = "rounded"
end

return M
