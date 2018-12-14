syntax on
set background=dark
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set smarttab
set shiftround
set nojoinspaces
set smartindent
set incsearch
filetype plugin on
augroup filetype
  au! BufNewFile,BufRead *.ll setlocal filetype=llvm
  au! BufNewFile,BufRead *.hsc setlocal filetype=haskell
augroup END


let mapleader=" "

call plug#begin()
Plug 'lyuts/vim-rtags'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'
Plug 'rust-lang/rust.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'lvht/fzf-mru'
Plug 'tpope/vim-unimpaired'
call plug#end()

" ghc-mod.vim config
noremap <leader>gt :GhcModType<CR>
noremap <leader>gn :GhcModTypeClear<CR>
noremap <leader>gc :GhcModCheckAndLintAsync<CR>
noremap <leader>gi :GhcModInfo<CR>

" youcompleteme
let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/.ycm_extra_conf.py'
let g:ycm_server_python_interpreter = 'python2'
" youcompleteme with neco-ghc
let g:ycm_semantic_triggers = {'haskell' : ['.']}

" use ripgrep
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

nmap <c-p> :Files<CR>

let g:fzf_mru_file_list_size = 50
