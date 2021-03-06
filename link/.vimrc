set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
Bundle 'gmarik/vundle'
Bundle 'wincent/Command-T'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-git'
Bundle 'chriskempson/base16-vim'
Bundle 'tpope/vim-surround'
Bundle 'bling/vim-airline'
Bundle "pangloss/vim-javascript"
Bundle "Raimondi/delimitMate"
Bundle 'scrooloose/nerdtree'
" Bundle 'jalcine/cmake.vim'
" Can only have either YouCompleteMe or supertab
" Bundle 'Valloric/YouCompleteMe'
"Bundle 'ervandew/supertab'
Bundle 'rking/ag.vim'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-dispatch'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'groenewege/vim-less'
Bundle 'elixir-lang/vim-elixir'
" Plugin 'Keithbsmiley/swift.vim'
"Bundle 'edkolev/tmuxline.vim'
" Rust completion plugin
" Plugin 'rust-lang/rust.vim'
" Plugin 'racer-rust/vim-racer'
call vundle#end()
filetype plugin indent on
syntax enable


" Omni complete (Ctrl-x, Ctrl-o in insert mode)
set omnifunc=syntaxcomplete#Complete
" Default indent formatting
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set expandtab

" Color scheme
set background=dark
colorscheme solarized
let g:solarized_termcolors=16

set number
set list
set listchars=tab:>.
autocmd FileType cpp set tabstop=2|set shiftwidth=2|set expandtab
" Add the virtualenv's site-packages to vim path
" py << EOF
" import os.path
" import sys
" import vim
" if 'VIRTUAL_ENV' in os.environ:
"     project_base_dir = os.environ['VIRTUAL_ENV']
"     sys.path.insert(0, project_base_dir)
"     activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"     execfile(activate_this, dict(__file__=activate_this))
" EOF

" Enforce not using insert mode for navigation
inoremap kj <Esc>
" inoremap <Left>  <NOP>
" inoremap <Right> <NOP>
" inoremap <Up>    <NOP>
" inoremap <Down>  <NOP>
set timeoutlen=200
:au FocusLost * :set number
:au FocusGained * :set relativenumber
:set relativenumber
let g:airline_powerline_fonts = 1
set laststatus=2

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Workaround
let g:CommandTTraverseSCM = 'pwd'
let g:clang_user_options='|| exit 0'
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']

" Key binding for moving between panes
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
:command WQ wq
:command Wq wq
:command W w
:command Q q

" Configuration for Rust completion
set hidden
let g:racer_cmd = "/Users/csmith/work/rust/external/racer/target/release/racer"
let $RUST_SRC_PATH="/Users/csmith/work/rust/rust/src"

" Auto complete with Tab key
" function! SuperCleverTab()
"     if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
"         return "\<Tab>"
"     else
"         if &omnifunc != ''
"             return "\<C-X>\<C-O>"
"         elseif &dictionary != ''
"             return "\<C-K>"
"         else
"             return "\<C-N>"
"         endif
"     endif
" endfunction
" 
" inoremap <Tab> <C-R>=SuperCleverTab()<cr>
"
let g:SuperTabDefaultCompletionType = "context"
