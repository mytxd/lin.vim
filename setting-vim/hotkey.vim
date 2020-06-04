" Key Operations

" switch between C/C++ header source
nmap <F4> :CocCommand clangd.switchSourceHeader<CR>
" open terminal
nmap <F5> :terminal ++rows=20<CR>
" next color
nmap <F6> :NextColor<CR>
" open/close nerdtree file explorer
nmap <F7> :NERDTreeToggle<CR>
" open/close tagbar
nmap <F8> :TagbarToggle<CR>

" Command Operations

" copy visual selection to disk cache
vnoremap <Leader>y :w! ~/.cache/.lin.vim.copypaste<CR>
" copy disk cache to cursor
nnoremap <Leader>p :r ~/.cache/.lin.vim.copypaste<CR>

" Buffer

" go to next buffer
map <Leader>bn :bn<cr>

" go to previous buffer
map <Leader>bp :bp<cr>

" close current buffer
map <Leader>bd :bd<cr>
