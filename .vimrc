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
  au! BufRead,BufNewFile *.ll set filetype=llvm
augroup END

let mapleader=" "

call plug#begin()
Plug 'ctrlpvim/ctrlp.vim'
Plug 'lyuts/vim-rtags'
Plug 'justmao945/vim-clang'
Plug 'chiel92/vim-autoformat'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'eagletmt/ghcmod-vim'
Plug 'tpope/vim-fugitive'
Plug 'shougo/neocomplete.vim'
Plug 'eagletmt/neco-ghc'
Plug 'rust-lang/rust.vim'
call plug#end()

" ctrlp config
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" ghc-mod.vim config
noremap <leader>gt :GhcModType<CR>
noremap <leader>gn :GhcModTypeClear<CR>
noremap <leader>gc :GhcModCheckAndLintAsync<CR>
noremap <leader>gi :GhcModInfo<CR>
" neco-ghc
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
autocmd FileType haskell setl sw=2 sts=2
autocmd FileType haskell :NeoCompleteEnable
autocmd FileType haskell setlocal formatprg=hindent
" vim-clang
let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'
let g:clang_compilation_database = './b'
