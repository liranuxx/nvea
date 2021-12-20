local exec = vim.api.nvim_exec
local cmd = vim.cmd
-- Compile code
-- Get current filetype -> :echo &filetype or as variable &filetypes
-- [ Builds / Compiles / Interpretes  ]
exec([[
augroup bci
  autocmd FileType c nnoremap <buffer> <C-m> :5sp term://gcc % && ./a.out <CR>
  autocmd FileType cpp nnoremap <buffer> <C-m> :5sp term://g++ % && ./a.out <CR>
  autocmd FileType python nnoremap <buffer> <C-m> :5sp term://python % <CR>
  autocmd FileType sh nnoremap <buffer> <C-m> :5sp term://sh % <CR>
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

-- remove trailing whitespaces
vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])

-- remove trailing newline
vim.cmd([[autocmd BufWritePre * %s/\n\+\%$//e]])

vim.cmd([[autocmd TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=300})]])

-- vim.cmd([[autocmd CursorHold,CursorHoldI * Lspsaga show_line_diagnostics]])

-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor", border="single"})]]

-- Don't show status line on certain windows
vim.cmd [[ autocmd BufEnter,BufWinEnter,FileType,WinEnter * lua require("core.utils").hide_statusline() ]]
