" Save with CTRL+S
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" Write and quit shortcuts
nnoremap <leader>w :wq<CR>
nnoremap <leader>q :q<CR>

" Move panes with CTRL+direction
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" Change tabs with tab
nnoremap <TAB> gt
nnoremap <S-TAB> gt

" Split remaps
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>h :split<CR>

" Create new files
nnoremap <leader>c :!touch 

" Autocomplete
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" Goto tag
nnoremap <leader>o <C-]>

" Create task
nnoremap <leader>n o<esc>I- [ ] <esc>
