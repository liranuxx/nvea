local M = {}
M.comment = function()
  local status, comment = pcall(require, "Comment")
  if not status then
    return print("Comment not found!")
  end
  comment.setup()
end
M.hop = function()
  local status, hop = pcall(require, "hop")
  if not status then
    return print("Hop not found!")
  end
  require("hop").setup({ keys = 'etovxqpdygfblzhckisuran' })
end

M.markdown_preview = function()
  vim.cmd("let g:mkdp_browser = 'C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe'")
end

M.glow = function()
  vim.g.glow_binary_path = vim.env.HOME .. "/.local/bin"
  vim.g.glow_border = "rounded"
end

return M
