let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plugged')
  Plug 'neovim/nvim-lspconfig'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'tweekmonster/django-plus.vim' 
  Plug 'honza/vim-snippets'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'folke/tokyonight.nvim'
  Plug 'mkitt/tabline.vim'
  Plug 'Yggdroot/indentLine'
"  Plug 'nvim-lua/popup.nvim'
call plug#end()
"aslso need coc-snippets coc-jedi


autocmd CursorHold * silent call CocActionAsync('highlight')


"general settings
let g:python3_host_prog='/usr/bin/python3'
let mapleader = ","
set laststatus=2
set completeopt-=preview
set equalalways
set path+=**
set number
set signcolumn=number
let g:Hexokinase_highlighters = [ 'signcolumn' ]
set guicursor=
let g:indentLine_setColors = 0
colorscheme tokyonight

"keybindings 
imap <C-l> <Plug>(coc-snippets-expand)
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <Leader>q :wqa<CR>
nnoremap <Leader>v <c-w>v 
nnoremap <Leader>c <c-w>c
nnoremap <Leader>s <c-w>s
nnoremap <Leader>t :tabe<CR>
nnoremap <c-l> <c-w>l 
nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h
nnoremap <c-k> <c-w>k


"netrw config 
let g:netrw_altv = 1 
let g:netrw_winsize = 30
let g:netrw_banner = 0
let g:netrw_liststyle = 3
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'Lex' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
nnoremap <Leader>da :Lexplore<CR>


"treesitter config
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
    }
}
EOF

"lua <<EOF
"require'lspconfig'.jedi_language_server.setup{}
"EOF
