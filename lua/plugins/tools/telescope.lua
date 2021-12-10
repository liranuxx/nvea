local present, telescope = pcall(require, "telescope")
if not present then
  return print("Telescope not present!!!")
end

if not packer_plugins["plenary.nvim"].loaded then
  vim.cmd [[packadd plenary.nvim]]
  vim.cmd [[packadd popup.nvim]]
end

telescope.load_extension("project")
local project = {
  base_dirs = {
    "~/workstation",
    "~/.config/nvim"
  },
  hidden_files = true -- default: false
}

-- local actions = require("telescope.actions")
telescope.setup {
  defaults = {
    prompt_prefix = '🔭 ',
    prompt_position = 'top',
    selection_caret = " ",
    sorting_strategy = 'ascending',
    results_width = 0.6,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
  },
  pickers = {
  },
  extensions = {
    project = project,
  }
}
