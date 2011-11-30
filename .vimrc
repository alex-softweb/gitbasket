colorscheme dark-ruby 
map <CR> O<Esc>
map <c-o> o<Esc>
map <c-p> a<Space><Esc>
map <C-b> i<CR><Esc>
map <C-z> :u<CR>
imap <C-z> <Esc>:u<CR>
noremap <c-e> :wa<CR>
inoremap <c-e> <esc>:wa<CR>
vmap <C-c> "+y
vmap <C-x> "+x
map <C-v> "+gP
nnoremap <insert> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p 
vnoremap <c-y> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR> 
vmap <c-g> :s/^/
vmap <s-h> :s/^/#/<cr>
map <s-h> :s/^/#/<cr>
vmap <s-k> :s/^/\/\/<cr>
map <s-l> :s/^\W//<CR>
vmap <c-l> :s/^\W\W//<cr>
map <Space> i<Space><Esc>
map <Tab> i<c-t><Esc>
map <c-f> :R
"map <C-f> :FuzzyFinderBuffer<CR>
"map <C-a> :FuzzyFinderFile<CR>
nmap <c-a> gt
map <F2> :NERDTreeToggle<CR>
set tabstop=2
set shiftwidth=2
set expandtab
set hidden
set ignorecase
set smartcase
set cursorline
nnoremap <C-F7> :vertical resize -5<cr>
nnoremap <C-F6> :resize +5<cr>
nnoremap <C-F5> :resize -5<cr>
nnoremap <C-F8> :vertical resize +5<cr>
map <C-d> :sh<CR>
