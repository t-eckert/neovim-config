local env = vim.env
local g = vim.g
local fn = vim.fn
local api = vim.api
local o = vim.o
local utils = require("utils")
local nmap = utils.nmap
local xmap = utils.xmap
local omap = utils.omap
local imap = utils.imap

if (fn.isdirectory(".git")) then
  nmap("<leader>t", ":GitFiles --cached --others --exclude-standard<cr>")
else
  nmap("<leader>t", ":FZF<cr>")
end

nmap("<leader>p", ":GFiles?<cr>")
nmap("<leader>b", ":Buffers<cr>")
nmap("<leader>g", ":FZF<cr>")

nmap("<leader><tab>", "<plug>(fzf-maps-n)")
xmap("<leader><tab>", "<plug>(fzf-maps-x)")
omap("<leader><tab>", "<plug>(fzf-maps-o)")

-- Insert mode completion
imap("<c-x><c-k>", "<plug>(fzf-complete-word)")
imap("<c-x><c-f>", "<plug>(fzf-complete-path)")
imap("<c-x><c-j>", "<plug>(fzf-complete-file-ag)")
imap("<c-x><c-l>", "<plug>(fzf-complete-line)")

api.nvim_exec(
  [[
command! FZFMru call fzf#run({ 'source':  v:oldfiles, 'sink':    'e', 'options': '-m -x +s', 'down':    '40%'})
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --follow --color=always '.<q-args>.' || true', 1, <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)
command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=? -complete=dir GitFiles call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)
]],
  false
)

function FloatingFZF()
  local lines = o.lines
  local columns = o.columns
  local buf = api.nvim_create_buf(true, true)
  local height = fn.float2nr(lines * 0.5)
  local width = fn.float2nr(columns * 0.7)
  local horizontal = fn.float2nr((columns - width) / 2)
  local vertical = 0
  local opts = {
    relative = "editor",
    row = vertical,
    col = horizontal,
    width = width,
    height = height,
    style = "minimal"
  }
  vim.api.nvim_open_win(buf, true, opts)
end

local fzf_opts = {
  env.FZF_DEFAULT_OPTS or "",
  " --layout=reverse",
  ' --pointer=" "',
  " --info=hidden",
  " --border=rounded",
  " --bind å:select-all+accept"
}

env.FZF_DEFAULT_OPTS = table.concat(fzf_opts, "")

g.fzf_preview_window = {"right:50%:hidden", "?"}
g.fzf_layout = {window = "call v:lua.FloatingFZF()"}

--[[

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-f': 'split',
  \ 'ctrl-v': 'vsplit' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

map <C-f> :Files<CR>
map <leader>p :Files<CR>
map <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>


let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'


" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
--]]