syntax on " Enable syntax highlighting.
filetype plugin indent on " Enable file type based indentation.

" Map the leader key
let mapleader="\\"

set autoindent " Respect indentation when starting a new line.
set expandtab " Expands tabs to spaces. (Essential in languages like python).
set tabstop=4 " Number of spaces tab is counted for.
set shiftwidth=4 " Number of spaces to use for autoindent
set backspace=2 " Fix backspace behavior on most terminals

colorscheme desert " change a colorscheme
" Custom
set number " set line numbers
set textwidth=80
set wrapmargin=80
set cc=+1 " highlights column textwidth + 1
set cursorline " Highlight cursor line
" Always display a status line (it gets hidden sometimes otherwise)
set laststatus=2

" Show last command in the status line.
set showcmd

set foldmethod=indent " set the method to fold code
set wildmenu " Enable enhanced tab autocomplete
set wildmode=list:longest,full " Complete till longest string,
                               " then open the wildmenu.
set rtp+=/usr/bin/fzf

" Set up persistent undo across all files.
set undofile
if !isdirectory(expand("$HOME/.vim/undodir"))
    call mkdir(expand("$HOME/.vim/undodir"), "p")
endif
set undodir=$HOME/.vim/undodir

" Install vim-plug if it's not already installed.
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.github.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" [ Plugins ] --------------------------------------------------------------{{{1
" Manage plugins with vim-plug
call plug#begin()
    Plug 'tpope/vim-vinegar' " netrw in split
    Plug 'junegunn/fzf.vim'  " fzf vim commands
    Plug 'tpope/vim-fugitive' " git 
    let g:airline_powerline_fonts = 1 " use powerline fonts (installed)
    Plug 'vim-airline/vim-airline' " fancy status line

    let g:plug_timeout = 300 " Increase vim-plug timeout for coc
   Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Custom mappings
nnoremap <leader><C-p> :<C-u>FZF<CR>
"fzf open buffers
nnoremap <leader><C-b> :<C-u>Buffers<CR>
" fzf lines in the current buffer
nnoremap <leader>l :<C-u>BLines<CR>
" fzf lines in loaded buffers
nnoremap <leader><S-L> :<C-u>Lines<CR>
" fzf path completion
imap <leader><C-T> <plug>(fzf-complete-path)
" YouCompleteMe jump to fn def
noremap <leader>gd :YcmCompleter GoTo<cr>
