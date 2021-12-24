-- vim.api.nvim_command("hi NotificationInfo guifg=#80ff95")
-- vim.api.nvim_command("hi NotificationWarning guifg=#fff454")
-- vim.api.nvim_command("hi NotificationError guifg=#c44323")

local actions = require("telescope.actions")
local actions_state = require("telescope.actions.state")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local sorters = require("telescope.sorters")
-- local dropdown = require("telescope.themes").get_dropdown()

local menu_cmd = {
  Format = "FormatWrite",
  Vsplit = "vs",
  Split = "sp",
  MarkdownPreview = "MarkdownPreview",
  SudoSave = "w !sudo tee% > /dev/null",
}
local function get_key()
  local c = {}
  for key, _ in pairs(menu_cmd) do
    table.insert(c, key)
  end
  return c
end
local menu = get_key()

local function enter(prompt_bufnr)
  local selected = actions_state.get_selected_entry()
  local cmd = menu_cmd[selected[1]]
  actions.close(prompt_bufnr)
  vim.cmd(cmd)
end
local function next_cmd(prompt_bufnr)
  actions.move_selection_next(prompt_bufnr)
  -- local selected = actions_state.get_selected_entry()
end
local function prev_cmd(prompt_bufnr)
  actions.move_selection_previous(prompt_bufnr)
  -- local selected = actions_state.get_selected_entry()
end
local mini = {
  layout_strategy = "vertical",
  layout_config = {
    height = 0.5,
    width = 0.3,
    prompt_position = "top"
  },
  sorting_strategy = "ascending"
}
local opts = {
  results_title = "menus",
  finder = finders.new_table(menu),
  sorter = sorters.get_generic_fuzzy_sorter({}),
  attach_mappings = function(_, map)
    map("i", "<CR>", enter)
    map("i", "<C-j>", next_cmd)
    map("i", "<C-k>", prev_cmd)
    map("n", "j", next_cmd)
    map("n", "k", prev_cmd)
    return true
  end
}
local select_cmd = pickers.new(mini, opts)
return select_cmd:find()
