local M = {}
M.basic, M.ui, M.mappings, M.plugins = {}, {}, {}, {}

M.basic = {
  copy_cut = true,
  copy_del = true,
  insert_nav = true,
  cmd_nav = true,
  window_nav = true
}

M.ui = {
  theme = "onedark",
  toggle_theme = {
    "onedark",
    "one-light",
  },
  italic_comment = true,
  transparency = false
}

M.mappings = {
  close_buffer = "<leader>x",
  copy_whole_file = "<C-a>", -- copy all contents of the current buffer
  line_number_toggle = "<F2>", -- show or hide line number
  new_buffer = "<S-t>", -- open a new buffer
  new_tab = "<C-t>b", -- open a new vim tab
  save_file = "<leader>w", -- save file using :w
  quit_file = "<leader>q", -- quite file using :q!
  -- save_quit_file = "<leader>wq", -- quite file using :wq!
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

M.plugins = {
  -- enable and disable plugins (false for disable)
  status = {
    blankline = true, -- show code scope with symbols
    bufferline = true, -- list open buffers up the top, easy switching too
    colorizer = true, -- color RGB, HEX, CSS, NAME color codes
    comment = true, -- easily (un)comment code, language aware
    dashboard = false, -- NeoVim 'home screen' on open
    esc_insertmode = true, -- map to <ESC> with no lag
    feline = true, -- statusline
    gitsigns = true, -- gitsigns in statusline
    lspsignature = true, -- lsp enhancements
    cmp = true,
    nvimtree = true,
    autopairs = true,
    cursorword = true
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
    toggle = "<C-n>",
    focus = "<leader>e"
  },
  -- multitool for finding & picking things
  telescope = {
    builtin = "<leader>bb",
    buffers = "<leader>fb",
    find_files = "<leader>ff",
    find_hiddenfiles = "<leader>fa",
    search_char = "<leader>/",
    live_grep = "<leader>fw",
    oldfiles = "<leader>fo",
    com_history = "<leader>ch",
    git_commits = "<leader>cm",
    git_status = "<leader>gt",
    help_tags = "<F1>",
    themes = "<leader>th" -- theme picker
  },
  lspsaga = {
    rename = "gr",
    code_cation = "gx",
    hover_doc = "K",
    lsp_finder = "gh",
    signaturehelp = "gs",
    preview_def = "gd",
    show_line_diag = "gsd",
    open_terminal = "<A-d>",
    close_terminal = "<A-d>",
    diag_jump_next = "gj",
    diag_jump_prev = "gk"
  }
}

return M
