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
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'eagletmt/ghcmod-vim'
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

" youcompleteme
let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/.ycm_extra_conf.py'
let g:ycm_server_python_interpreter = 'python2'

" use ripgrep
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
    let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
    let g:ctrlp_use_caching = 0
endif
