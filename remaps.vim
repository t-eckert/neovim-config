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
nnoremap <leader>h :hsplit<CR>

" Create new files
nnoremap <leader>c :!touch 
