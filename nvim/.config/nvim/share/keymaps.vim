" Use space+D to delete without saving into register
nmap <leader>D "_d
vmap <leader>D "_d

" Use space+p/P/y/Y to copy-paste using system clipboard
nmap <leader>p "+p
vmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>P "+P
nmap <leader>y "+y
vmap <leader>y "+y
nmap <leader>Y "+Y
vmap <leader>Y "+Y

" Center cursor after moving with CTRL+D/U/F/B
nmap <C-d> <C-d>zz
vmap <C-d> <C-d>zz
nmap <C-u> <C-u>zz
vmap <C-u> <C-u>zz
nmap <C-f> <C-f>zz
vmap <C-f> <C-f>zz
nmap <C-b> <C-b>zz
vmap <C-b> <C-b>zz

" Clear search with <esc>
"nnoremap <Esc> <Cmd>noh<CR><Esc>
"inoremap <Esc> <Cmd>noh<CR><Esc>

" Move to window using the CTRL+H/J/K/L keys
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

