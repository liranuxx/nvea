local M = {}

M.treesitter = function()
  local present, ts_config = pcall(require, "nvim-treesitter.configs")
  if not present then
    return print("Treesitter not present!!!")
  end
  ts_config.setup {
    ensure_installed = {
      "lua","python","c","bash","cpp","java",
    },
    highlight = {
      enable = true,
      use_languagetree = true,
    },
    -- 增量选择
    incremental_selection = {
      enable = true,
      keymap = {
        init_selection = 'gnn',
        node_incremental = 'grn',
        node_decremental = 'grc',
        scope_incremental = 'grm',
      }
    },
    indent = {
      enable = true,
    },
    textobjects = {},
  }
  require("nvim-treesitter.install").prefer_git = true
  -- 折叠
  vim.wo.foldmethod = 'expr'
  vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
  vim.wo.foldlevel = 99
end

M.rainbow = function()
  local present, rainbow = pcall(require, "nvim-treesitter.configs")
  if not present then
    return print("Rainbow not present!!!")
  end
  rainbow.setup {
    highlight = {
        -- ...
    },
    -- ...
    rainbow = {
      enable = true,
      -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
      extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      max_file_lines = nil, -- Do not enable for files with more than n lines, int
      -- colors = {}, -- table of hex strings
      -- termcolors = {} -- table of colour name strings
    }
  }
end

return M
