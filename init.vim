set number
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
set cursorline
set clipboard=unnamedplus
set hidden
set hlsearch
set backspace=indent,eol,start
syntax on



" spell languages
set spelllang=en_gb

call plug#begin('~/.config/nvim/plugged')

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'preservim/nerdtree' " gives file manager vscode aesthetic
Plug 'neoclide/coc.nvim', {'branch': 'release'} " autocomlete
Plug 'tc50cal/vim-terminal' " terminal in vim
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tpope/vim-commentary' " For Commenting gcc & gc
Plug 'jiangmiao/auto-pairs' " auto completes brackets etc
Plug 'airblade/vim-gitgutter' " Shows git changes
Plug 'ianks/vim-tsx' "Apparently used for colouring Typescript correctly
Plug 'pangloss/vim-javascript'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
Plug 'honza/vim-snippets'
Plug 'leafgarland/typescript-vim'
Plug 'elzr/vim-json'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/goyo.vim' " Distraction-free writing
Plug 'masukomi/vim-markdown-folding' " Fold by secttion headings
Plug 'alvan/vim-closetag'
Plug 'SirVer/ultisnips'
Plug 'MaxMEllon/vim-jsx-pretty' "Syntax highlighting and indenting for jsx
Plug 'lervag/vimtex'

" appearance/themes
Plug 'ryanoasis/vim-devicons' " icons
Plug 'morhetz/gruvbox' " colour theme
Plug 'EdenEast/nightfox.nvim' " colour theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'haishanh/night-owl.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'savq/melange'
Plug 'kyazdani42/nvim-palenight.lua'
Plug 'chriskempson/base16-vim'
Plug 'joshdick/onedark.vim'
Plug 'Mofiqul/dracula.nvim'
Plug 'rmehri01/onenord.nvim'
Plug 'fratajczak/one-monokai-vim'
Plug 'vim-python/python-syntax'
Plug 'Rigellute/rigel'
Plug 'dikiaap/minimalist'
Plug 'sainnhe/everforest'

" main one
" Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" 9000+ Snippets
" Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

" lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
" Need to **configure separately**
" Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}


call plug#end()

set termguicolors
colorscheme gruvbox-material

let g:airline_theme='gruvbox_material'

" vim multi cursor 
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-d>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-d>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-d>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

let python_highlight_all = 1
let python_highlight_space_errors = 0

" For minimap plugin
let g:minimap_width = 10
let g:minimap_auto_start = 1


let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'

"snippets files directory
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

let g:UltiSnipsExpandTrigger="<C-e>"               
let g:UltiSnipsJumpForwardTrigger="<C-e>"

set splitright
set splitbelow

"vimtex settings
filetype plugin indent on
let g:vimtex_view_method = 'skim'



let minimap_auto_start = 0


tnoremap <Esc> <C-\><C-n>

" move split panes to left/bottom/top/right
nnoremap <A-h> <C-W>H
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <A-l> <C-W>L

" move between panes to left/bottom/top/right
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFocus<CR>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

inoremap jk <esc>:w<CR>

" A shitty attempt at replicatoing Alt Backspace using Ctrl b instead
" inoremap <C-b> <C-o>db

" Vim seems to think that Alt is escape, so this gives Alt + Backspace
" functionality! Yay!
imap <Esc><BS> <C-w>

" Clear screen clears search highlighting.
nnoremap <C-q> :nohl<CR><C-L>

" to open and close 

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python

function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~ '\s'
    endfunction

    inoremap <silent><expr> <TAB>
                  \ pumvisible() ? "\<C-n>" :
                  \ <SID>check_back_space() ? "\<TAB>" :
                  \ coc#refresh()



imap jj <Esc>


" Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif


" Markdown Stuff
" do not close the preview tab when switching to other buffers (for markdown)
let g:mkdp_auto_close = 0


nnoremap <M-m> :MarkdownPreview<CR>

" disable header folding
let g:vim_markdown_folding_disabled = 1

" au BufRead * normal zR

" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0

" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1

let mapleader = ","

"For note-taking

let s:wrapenabled = 0
function! ToggleWrap()
  set wrap nolist
  if s:wrapenabled
    set nolinebreak
	set nospell 
    unmap j
    unmap k
    unmap 0
    unmap ^
    unmap $
    let s:wrapenabled = 0
  else
    set linebreak
	set spell 
    nnoremap j gj
    nnoremap k gk
    nnoremap 0 g0
    nnoremap ^ g^
    nnoremap $ g$
    vnoremap j gj
    vnoremap k gk
    vnoremap 0 g0
    vnoremap ^ g^
    vnoremap $ g$
    let s:wrapenabled = 1
  endif
endfunction
map <leader>w :call ToggleWrap()<CR>


nnoremap <leader>o :below 15sp term://$SHELL<cr>
nnoremap <leader>s :xall<CR>


" For Goyo
nnoremap <leader>g :Goyo<CR>

" autocmd! User GoyoEnter Limelight
" autocmd! User GoyoLeave Limelight!
