local M = {}
M.basic, M.ui, M.mappings, M.plugins = {}, {}, {}, {}

M.basic = {
  copy_cut = true,
  copy_del = true,
  insert_nav = true,
  cmd_nav = true,
  window_nav = true,
}

M.ui = {
  theme = "onedark",
  -- theme = "onelight",
  italic_comment = true,
  transparency = false,
}

M.plugins = {
  -- enable and disable plugins (false for disable)
  status = {
    blankline = true,
    bufferline = true,
    nvimtree = true,
    lualine = true,
    colorizer = true,
    comment = true,
    dashboard = true,
    gitsigns = true,
    lspsignature = true,
    cmp = true,
    autopairs = true,
    cursorword = true,
    markdown_preview = true,
    telescope = true,
    whichkey = true,
  },
  lspconfig = {
    setup_lspconf = "plugins.lang.lspconfig",
  }
}

M.mappings = {
  close_buffer = "<leader>x",
  close_window = "<leader>k",
  copy_whole_file = "<C-a>", -- copy all contents of the current buffer
  line_number_toggle = "<F2>", -- show or hide line number
  new_buffer = "<leader>n", -- open a new buffer
  new_tab = "<C-t>b", -- open a new vim tab
  save_file = "<leader>w", -- save file using :w
  quit_file = "<leader>q", -- quite file using :q!
  -- save_quit_file = "<leader>wq", -- quite file using :wq!
  toggle_theme = "<leader>cs",
  nv = {
    insert_nav = {
      backward = "<C-h>",
      end_of_line = "<c-e>",
      forward = "<C-l>",
      next_line = "<C-k>",
      prev_line = "<C-j>",
      beginning_of_line = "<C-a>"
    },
    cmd_nav = {
      backward = "<C-j>",
      forward = "<C-k>",
      beginning_of_line = "<C-a>",
      endding_of_line = "<C-e>",
      sudow = "w!!"
    },
    window_nav = {
      moveLeft = "<C-h>",
      moveRight = "<C-l>",
      moveUp = "<C-k>",
      moveDown = "<C-j>",
      addHeight = "<A-k>",
      delHeight = "<A-j>",
      addWidth = "<A-h>",
      delWidth = "<A-l>"
    }
  }
}

M.mappings.plugins = {
  bufferline = {
    next_buffer = "<Tab>", -- next buffer
    prev_buffer = "<S-Tab>" -- previous buffer
  },
  -- NeoVim 'home screen' on open
  dashboard = {
    bookmarks = "<leader>bm",
    new_file = "<leader>fn", -- basically create a new buffer
    open = "<leader>db", -- open dashboard
    session_load = "<leader>l", -- load a saved session
    session_save = "<leader>s" -- save a session
  },
  -- file explorer/tree
  nvimtree = {
    toggle = "<leader>t",
    focus = "<leader>e"
  },
  -- multitool for finding & picking things
  telescope = {
    builtin = "<leader>fl",
    buffers = "<leader>fb",
    find_files = "<leader>ff",
    find_hiddenfiles = "<leader>fa",
    search_char = "<leader>/",
    live_grep = "<leader>fw",
    oldfiles = "<leader>fh",
    commands = "<leader>cc",
    comand_history = "<leader>ch",
    git_commits = "<leader>gm",
    git_status = "<leader>gt",
    help_tags = "<F1>",
  },
  formatter = {
    format = "<leader>fm",
  },
  lsp = {
    rename = "gr",
    code_cation = "gx",
    hover_doc = "K",
    declaration = "gh",
    signaturehelp = "gs",
    references = "gw",
    goto_definition = "gd",
    show_line_diag = "ge",
    list_line_diag = "gl",
    diag_jump_next = "gn",
    diag_jump_prev = "gp",
  }
}

return M
