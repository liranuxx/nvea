vim.cmd("colorscheme onedark")

local modules = {
  "core",
  "plugins",
}

for _, module in ipairs(modules) do
  local ok, err = pcall(require, module)
  if not ok then
    print("Error loading "..module.."\n\n"..err)
  end
end

vim.cmd("let g:mkdp_browser = 'C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe'")
