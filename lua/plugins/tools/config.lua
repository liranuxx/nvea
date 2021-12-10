local M = {}

M.whichkey = function ()
  local present, whichkey = pcall(require, "which-key")
  if not present then
    return print("Whichkey not present!!!")
  end
  whichkey.setup {
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
    },
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "+", -- symbol prepended to a group
    },
    window = {
      border = "single",
      position = "bottom",
    },
  }
end

M.glow = function ()
  vim.g.glow_binary_path = vim.env.HOME .. "/.local/bin"
  vim.g.glow_border = "rounded"
end

return M
