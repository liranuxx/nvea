require("toggleterm").setup{
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<a-d>]],
  hide_numbers = true,
  start_in_insert = true,
  persist_size = true,
  direction = 'float',
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = 'single',
    width = math.floor(vim.api.nvim_win_get_width(0) * 0.8),
    height = math.floor(vim.api.nvim_win_get_height(0) * 0.8),
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}
