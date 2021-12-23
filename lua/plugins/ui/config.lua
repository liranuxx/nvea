local M = {}

M.context = function()
  local present, context = pcall(require, "treesitter-context")
  if not present then
    return print("Treesitter-context not present!!!")
  end
  context.setup {}
end

return M
