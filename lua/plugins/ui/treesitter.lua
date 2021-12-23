local present, ts_config = pcall(require, "nvim-treesitter.configs")
if not present then
  return print("Treesitter not present!!!")
end
vim.cmd[[packadd nvim-treesitter-refactor]]
vim.cmd[[packadd nvim-treesitter-textobjects]]
vim.cmd[[packadd nvim-ts-rainbow]]

ts_config.setup {
  ensure_installed = {
    "lua",
    "python",
    "c",
    "bash",
    "cpp",
    "java"
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true
  },
  -- 增量选择
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<cr>",
      node_incremental = "<cr>",
      node_decremental = "<bs>",
      scope_incremental = ",s",
    },
  },
  -- Indentation based on treesitter for the = operator
  indent = {
    enable = true
  },
  refactor = {
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
  },
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",

        -- Or you can define your own textobjects like this
        ["iF"] = {
          python = "(function_definition) @function",
          cpp = "(function_definition) @function",
          c = "(function_definition) @function",
          java = "(method_declaration) @function",
        },
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
    -- disable = { "jsx", "cpp" }
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
}

require("nvim-treesitter.install").prefer_git = true

-- 折叠
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.wo.foldlevel = 99
