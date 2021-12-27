" Leader Key
let mapleader = ","

inoremap jk <Esc>
inoremap kj <Esc>
nmap <c-x> :q<CR>

nnoremap <S-j> 5j
vnoremap <S-j> 5j
nnoremap <S-k> 5k
vnoremap <S-k> 5k

" j/k will move virtual lines (lines that wrap)
"noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
"noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Chose the word to change V-mode and Ctrl-r to replace with new word
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Tab Action
nmap <C-n> :tabnext<CR>
nmap <C-p> :tabprev<CR>

" Buffers Action
nmap `n  :bnext<CR>
nmap `p  :bprevious<CR>
nmap `d  :bdelete<CR>

" Move between split tab
nnoremap <C-j> <c-w>j
nnoremap <C-k> <c-w>k
nnoremap <C-h> <c-w>h
nnoremap <C-l> <c-w>l

" Change size split tab
noremap <C-up>    <c-w>-
noremap <C-down>  <c-w>+
noremap <C-left>  <c-w><
noremap <C-right> <c-w>>

nmap <leader>, :nohlsearch<CR>

" Nerd Tree
nmap <F5> :NERDTreeToggle<CR>

" fzf
nmap <F6> :Files<CR>
nmap <F7> :Buffers<CR>

" Open st terminal or alacritty terminal
"nmap <F4> :!st -c vim-terminal &<CR>
"nmap <F4> :!alacritty --class vim-terminal,vim-terminal &<CR>

" NerdCommenter
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" Vimspector
map <F8>           <Plug>VimspectorToggleBreakpoint
"map <leader><F8>   <Plug>VimspectorAddFunctionBreakpoint

map <F9>           <Plug>VimspectorContinue
map <leader><F9>   <Plug>VimspectorStop
map <leader>d<F9>  <Plug>VimspectorRestart

map <F12>          <Plug>VimspectorPause

map <F10>          <Plug>VimspectorStepOver
map <F11>          <Plug>VimspectorStepInto
map <leader><F11>  <Plug>VimspectorStepOut

nmap <leader>dx :VimspectorReset<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput


" Vim-Cmake
nmap <leader>gg :CMakeGenerate<CR>
nmap <leader>bb :CMakeBuild<CR>
nmap <leader>cx :CMakeClose<CR>

