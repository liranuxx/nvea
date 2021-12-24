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
    lsp = true,
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
  toggle_theme = "<leader>fs",
  select_cmd = "<leader>,",
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
  term = {
    node = "<leader>tn",
    ncdu = "<leader>tu",
    htop = "<leader>tt",
    lazygit = "<leader>tg",
    python = "<leader>tp",
    t_float = "<leader>tf",
    t_hori = "<leader>th",
    t_vert = "<leader>tv",
  },
  -- file explorer/tree
  nvimtree = {
    toggle = "<leader>e",
    focus = "<leader>o"
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
    commands = "<leader>fc",
    comand_history = "<leader>fC",
    help_tags = "<leader>fH",
    registers = "<leader>fR",
    keymaps = "<leader>fk",
  },
  formatter = {
    format = "<leader>fm",
  },
  lsp = {
    lspinfo = "<leader>li",
    lspinstall_info = "<leader>lI",
    code_cation = "<leader>la",
    hover_doc = "K",
    declaration = "gh",
    signaturehelp = "<leader>ls",
    references = "gw",
    goto_definition = "gd",
    show_line_diag = "<leader>le",
    show_docu_diag = "<leader>ld",
    show_work_diag = "<leader>lw",
    codelens_action = "<leader>lr",
    list_line_diag = "<leader>ll",
    diag_jump_next = "<leader>lj",
    diag_jump_prev = "<leader>lj",
  }
}

return M
