local M = {}


M.glow = function ()
  vim.g.glow_binary_path = vim.env.HOME .. "/.local/bin"
  vim.g.glow_border = "rounded"
end

return M
