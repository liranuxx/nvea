local actions = require("telescope.actions")
local actions_state = require("telescope.actions.state")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local sorters = require("telescope.sorters")
local dropdown = require("telescope.themes").get_dropdown()
local colors = vim.fn.getcompletion("", "color")
local function enter(prompt_bufnr)
  local selected = actions_state.get_selected_entry()
  local cmd = "colorscheme "..selected[1]
  vim.cmd(cmd)
  actions.close(prompt_bufnr)
end
local function next_theme(prompt_bufnr)
  actions.move_selection_next(prompt_bufnr)
  local selected = actions_state.get_selected_entry()
  local cmd = "colorscheme "..selected[1]
  vim.cmd(cmd)
end
local function prev_theme(prompt_bufnr)
  actions.move_selection_previous(prompt_bufnr)
  local selected = actions_state.get_selected_entry()
  local cmd = "colorscheme "..selected[1]
  vim.cmd(cmd)
end
local mini = {
  layout_strategy = "vertical",
  layout_config = {
    height = 20,
    width = 0.3,
    prompt_position = "top",
  },
  sorting_strategy = "ascending",
}
local opts = {
  finder = finders.new_table(colors),
  sorter = sorters.get_generic_fuzzy_sorter({}),

  attach_mappings = function (prompt_bufnr, map)
    map("i","<CR>",enter)
    map("i","<C-j>",next_theme)
    map("i","<C-k>",prev_theme)
    map("n","j",next_theme)
    map("n","k",prev_theme)
    return true
  end
}
local colors = pickers.new(mini, opts)
colors:find()
