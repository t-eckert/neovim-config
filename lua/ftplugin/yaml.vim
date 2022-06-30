set lcs+=space:·
set list

" Disable matching parens because it runs so slowly on YAML
function! g:DisableMatchParen ()
  if exists(":NoMatchParen")
    :NoMatchParen
  endif
endfunction

augroup plugin_initialize
  autocmd!
  autocmd VimEnter * call DisableMatchParen()
augroup END
