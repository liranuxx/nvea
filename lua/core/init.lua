vim.cmd("colorscheme " .. require("core.config").ui.theme)
require("myplugin.notification")("Enjoy in your time!", {row = 5, col = 100})

local modules = {
  "core.options",
  "core.autocmds"
}

for _, module in ipairs(modules) do
  local ok, err = pcall(require, module)
  if not ok then
    print("Error loading " .. module .. "\n\n" .. err)
  end
end

-- set all the mappings
require("core.mappings").init()

vim.cmd("imap <C-\\> <Plug>(fzf-dictionary-open)")
