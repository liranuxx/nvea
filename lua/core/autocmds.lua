local exec = vim.api.nvim_exec
local cmd = vim.cmd
-- Compile code
-- Get current filetype -> :echo &filetype or as variable &filetypes
-- [ Builds / Compiles / Interpretes  ]
exec([[
augroup bci
  autocmd FileType c nnoremap <buffer> <C-m> :!gcc % && ./a.exe <CR>
  autocmd FileType cpp nnoremap <buffer> <C-m> :!g++ % && ./a.exe <CR>
  autocmd FileType python nnoremap <buffer> <C-m> :!python % <CR>
  autocmd FileType sh nnoremap <buffer> <C-m> :!sh % <CR>
  autocmd FileType markdown nnoremap <buffer> <C-m> :Glow <CR>
  autocmd FileType vim,zsh,tmux,lua nnoremap <buffer> <C-m> :source % <CR>
augroup END
]], true)

-- File extension specific tabbing
cmd [[ autocmd Filetype lua setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2 ]]

-- auto format lua file
cmd [[autocmd Filetype lua FormatWrite]]

-- Open a file from its last left off position
cmd [[ autocmd BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]]