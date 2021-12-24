local modules = {
  "core",
  "plugins",
  "myplugin"
}

for _, module in ipairs(modules) do
  local ok, err = pcall(require, module)
  if not ok then
    print("Error loading " .. module .. "\n\n" .. err)
  end
end

vim.cmd [[
call wilder#setup({'modes': [':', '/', '?']})
call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
\ 'highlighter': wilder#basic_highlighter(),
\ 'highlights': {
\   'border': 'FloatBorder',
\   'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#f4468f'}]),
\ },
\ 'left': [
\   ' ', wilder#popupmenu_devicons(),
\ ],
\ 'border': 'single',
\ })))
]]

local Job = require'plenary.job'

Job:new({
  command = 'rg',
  args = { '--files' },
  cwd = '/usr/bin',
  env = { ['a'] = 'b' },
  on_exit = function(j, return_val)
    print(return_val)
    print(j:result())
  end,
}):sync()
