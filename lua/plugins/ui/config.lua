local M = {}

M.context = function()
  local present, context = pcall(require, "treesitter-context")
  if not present then
    return print("Treesitter-context not present!!!")
  end
  context.setup {}
end

M.wilder = function ()
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
end

return M
