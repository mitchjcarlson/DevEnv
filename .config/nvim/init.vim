set mouse=a             " Allows mouse clicking in vim
set showmatch           " Show matching brackets
set noerrorbells        " No beeps
set ruler               " Show the line and column numbers of the cursor
set tabstop=4           " Render TABs using this many spaces
set shiftwidth=4        " Indentation amount for < and > commands
set expandtab           " Insert spaces when TAB is pressed
set smarttab            " Improves tabbing
set cindent
set number              " Show line numbers on left side
set hlsearch            " Highlight search results
set textwidth=80
set complete=.,w,b,u,t  " see help cpt

iabbrev //- //--------------------------------------------------------------------------

syntax enable


"------------------------------------------------------------------------------
" === Vim Plug ===
"------------------------------------------------------------------------------
call plug#begin('~/.local/share/nvim/site/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'
"Plug 'Rip-Rip/clang_complete'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'neovim/python-client'
call plug#end()


"------------------------------------------------------------------------------
" === Airline Globals ===
"------------------------------------------------------------------------------
let g:airline_theme='powerlineish'

" Powerline fonts were installed separately and configured via OS X terminal
let g:airline_powerline_fonts = 1


"------------------------------------------------------------------------------
" === Clang Complete Globals
"------------------------------------------------------------------------------

" path to directory where library can be found
let g:clang_library_path='/opt/local/libexec/llvm-4.0/lib'

" path to python binary where neovim client is installed
let g:python3_host_prog = '/Library/Frameworks/Python.framework/Versions/3.5/bin/python3'


"------------------------------------------------------------------------------
" === Vim Cpp Enhanced Highlight Globals ===
"------------------------------------------------------------------------------
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" Slower
"let g:cpp_experimental_simple_template_highlight = 1

" Faster with corner cases
let g:cpp_experimental_template_highlight = 1


"------------------------------------------------------------------------------
" === Syntastic ===
"------------------------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'
"let g:syntastic_cpp_compiler_options = '-std=c++1z -stdlib=libc++'
let g:syntastic_loc_list_height = 5
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "active_filetypes": [],
    \ "passive_filetypes": ["cpp"] }


"------------------------------------------------------------------------------
" === Other ===
"------------------------------------------------------------------------------
colorscheme onedark

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=13 guibg=13
match ExtraWhitespace /\s\+$\|\t/

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-l>', 'n') ==# ''
  nnoremap <silent> <C-l> :nohlsearch<CR><C-l>
endif

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Cannot convert tabs into spaces for MAKEFILE files
autocmd BufNewFile,BufRead \cMakefile*,*.mk set noexpandtab

" set path to current and recursive for tabfind
set path=.,**

" Set vim yank buffer to 1000 line max
set viminfo='50,<1000,s100,h

" vim next tab
nmap <C-n> gt

" vim previous tab
nmap <C-p> gT

" Perforce edit file
cmap <C-o> !p4 edit %<CR><CR>

" Perforce revert file
cmap <C-r> !p4 revert %<CR><CR>
