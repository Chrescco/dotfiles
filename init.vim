
"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
" Neovim init file
" Version: 0.44.0 - 2022/01/21
" Maintainer: Chresco/Shy
" Website: https://github.com/Chrescco 


" REQUIRE{{{
syntax enable
set nocompatible
filetype off 
"}}}

" AUTOMATICALLY {{{

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"}}}

" PLUGINS {{{
call plug#begin('~/vimfiles/plugged')

Plug 'folke/which-key.nvim'
Plug 'tami5/lspsaga.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'sainnhe/gruvbox-material'
Plug 'onsails/lspkind-nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'akinsho/bufferline.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'glepnir/dashboard-nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()
"}}}

" PLUGIN REQUIRE CONFIG {{{
lua require('chresco/lualine')
lua require('chresco/bufferline')
lua require('chresco/treesitter')
lua require('chresco/lspinstaller')
lua require('chresco/keybindings')
lua require('chresco/diagnostics')
lua require('chresco/lspconfig')
lua require('chresco/cmp')
lua require('chresco/nvimtree')
lua require('chresco/lspsaga')
lua require('chresco/whichkey')

"}}}

"BASIC CONFIGURATION {{{

set nu          
set relativenumber
set path+=**
set wildmode=longest,list,full
set encoding=UTF-8
set cursorline
set showmatch                    " Showing matching brackets
set linebreak
set ignorecase                  " Do case insensitive matching
set smartcase                   " Do smart case matching
set mouse=a                     " Enable mouse
set foldenable
set foldmethod=marker 
set foldmarker={{{,}}
set tabstop=4
set shiftwidth=4
set softtabstop=4
set spelllang=en_us             " Default language for spell checker
set fillchars+=eob:\
set clipboard=unnamed
set backspace=2
set list 
set cursorcolumn
autocmd FileType c setlocal shiftwidth=8 tabstop=8


"}}}

" BASIC STYLING {{{

colorscheme gruvbox-material
highlight Normal ctermbg=NONE

highlight Comment cterm=italic
highlight Cursorline ctermbg=Grey cterm=NONE
highlight CursorLineNr ctermbg=Black cterm=bold ctermfg=Green
highlight LineNr ctermbg=Black  ctermfg=White 

highlight SpellBad ctermbg=Red ctermfg=White
highlight SpellCap cterm=NONE ctermbg=NONE
highlight SpellRare cterm=NONE ctermbg=NONE
highlight SpellLocal cterm=Underline ctermbg=NONE
highlight ColorColumn guibg=#Black


let g:neovide_fullscreen=v:false
let g:neovide_transparency=0.95
"}}}

" MISC {{{
set laststatus=2

set guioptions=Ace

set guifont=Liga\ SFMono\ Nerd\ Font:h14

set termguicolors

nnoremap T :Telescope find_files<CR>
nnoremap W :WhichKey<CR>

"}}}

" DASHBOARD {{{
let g:dashboard_default_executive ='telescope'
let g:dashboard_custom_header = [
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\]"}}}

" MAPLEADER {{{

let mapleader = "\<space>"
"}}}

" NVIMTREE CONFIG {{{

nnoremap <leader>b :NvimTreeFocus<CR>

"}}}

" AUTOMATICALLY CLOSE TAG {{{

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

" }}}

" TOKYONIGHT  {{{

" let g:tokyonight_style = "night"
" let g:tokyonight_italic_functions = 1
" let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]

" Change the "hint" color to the "orange" color, and make the "error" color bright red
" let g:tokyonight_colors = {
  "\ 'hint': 'orange',
  "\ 'error': '#ff0000'
"\ }

" Load the colorscheme
" colorscheme tokyonight

"}}}

" GRUVBOX MATERIAL {{{

let g:gruvbox_material_palette = "material"
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_enable_italic = 1

let g:gruvbox_material_statusline_style = "original"
let g:gruvbox_material_diagnostic_text_highlight = 1
let g:gruvbox_material_diagnostic_line_highlight = 1
let g:gruvbox_material_diagnostic_virtual_text = 'colored'

let g:gruvbox_material_better_performance = 1

"}}}

" LSPSAGA KEYMAPS {{{

nnoremap <silent> F :Lspsaga lsp_finder<CR> 
nnoremap <silent> A :Lspsaga code_action<CR> 

"}}}


