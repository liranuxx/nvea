local M = {}

M.telescope = function()
  local present, telescope = pcall(require, "telescope")
  if not present then
    return print("Telescope not present!!!")
  end

  if not packer_plugins['plenary.nvim'].loaded then
  vim.cmd [[packadd plenary.nvim]]
  vim.cmd [[packadd popup.nvim]]
  vim.cmd [[packadd telescope-fzy-native.nvim]]
  vim.cmd [['nvim-telescope/telescope-project.nvim']]
  vim.cmd [['nvim-telescope/telescope-file-browser.nvim']]
  end

  require('telescope').load_extension('project')
require('telescope').load_extension('file_browser')


local project = {
  base_dirs = {
    '~/AppData/Local/nvim',
    '~/Desktop/projects/',
  },
  hidden_files = true -- default: false
}

local file_browser = {
  theme = "catppuccin",
  mappings = {},
}

  telescope.setup {
   defaults = {
      vimgrep_arguments = {
         "rg",
         "--color=never",
         "--no-heading",
         "--with-filename",
         "--line-number",
         "--column",
         "--smart-case",
      },
      prompt_prefix = "  ",
      selection_caret = "  ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      layout_config = {
         horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
         },
         vertical = {
            mirror = false,
         },
         width = 0.87,
         height = 0.80,
         preview_cutoff = 120,
      },
      file_sorter = require("telescope.sorters").get_fuzzy_file,
      file_ignore_patterns = { "node_modules" },
      generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
      path_display = { "absolute" },
      winblend = 0,
      border = {},
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      color_devicons = true,
      use_less = true,
      set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
      file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
      -- Developer configurations: Not meant for general override
      buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
   },
   extensions = {
      fzf_native = {
         override_generic_sorter = false, -- override the generic sorter
         override_file_sorter = true, -- override the file sorter
      },
      project = project,
      file_browser = file_browser,
   },
 }
end

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
