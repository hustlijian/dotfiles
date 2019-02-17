" author: lijian

" 设置命令前缀{{{
" set Leader to <space>
let mapleader=" "
" }}}
" 编码设置 {{{
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
" }}}
" 空格和对齐 {{{
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
filetype plugin on
filetype plugin indent on
setf c
set bs=indent,eol,start     " allow backspacing over everything in insert mode
set ai         " always set autoindenting on
" }}}
" 界面样式 {{{
set number
set cursorline
set wildmenu
set wildmode=full "set the cmd complete mode
set laststatus=2
" }}}
" 查找 {{{
set incsearch
set showmatch
set hlsearch
set ignorecase smartcase
" }}}
" 启动鼠标{{{
set mouse=a  "enable the mouse,use shift+click to paste text
" }}}
" 存储信息{{{
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
set history=200     " keep 200 lines of command line history
setlocal noswapfile
" }}}
" 打开文件时重新定位到上次的位置{{{
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" }}}
" 多窗口管理{{{
" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" }}}
" Tab 补齐{{{
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-n>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-p>
"}}}

" 颜色主题{{{
" set the color scheme
"colorscheme elflord
"colorscheme evening
"colorscheme morning
colorscheme desert
" }}}
" cscope设置 {{{
if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

nnoremap <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>   
nnoremap <leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>   
nnoremap <leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>   
nnoremap <leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>   
nnoremap <leader>e :cs find e <C-R>=expand("<cword>")<CR><CR>   
nnoremap <leader>f :cs find f <C-R>=expand("<cfile>")<CR><CR>   
nnoremap <leader>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nnoremap <leader>d :cs find d <C-R>=expand("<cword>")<CR><CR> 
" }}}
" vundle 设置开头{{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'


" non github repos
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
"Plugin 'file:///Users/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required!

"
" Brief help
 " :PluginList          - list configured bundles
 " :PluginInstall(!)    - install(update) bundles
" :PluginSearch(!) foo - search(or refresh cache first) for foo
 " :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin command are not allowed..
"}}}
Plugin 'scrooloose/nerdtree' "{{{
    "Map for NERDTree,F2 open tree list
    nmap <F2> :NERDTreeToggle <CR>
    nmap <Leader>n :NERDTreeToggle <CR>
"}}}
Plugin 'Yggdroot/indentLine' "{{{
    "for indentLine
    let g:indentLine_noConcealCursor = 1
    let g:indentLine_color_term =239
    let g:indentLine_char = '|'

    autocmd FileType python setlocal et sta sw=4 sts=4
"}}}
""Plugin 'klen/python-mode' "{{{
""    let g:pymode_rope_lookup_project = 0
""    let g:pymode_rope=0
"}}}
Plugin 'kien/ctrlp.vim' "{{{
    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll|pyc)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }     " MacOSX/Linux"
    let g:ctrlp_use_caching = 0
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
    if executable('ag')
        set grepprg=ag\ --nogroup\ --nocolor
        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    else
      let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
      let g:ctrlp_prompt_mappings = {
        \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
        \ }
    endif
"}}}
Plugin 'justinmk/vim-sneak' "{{{
    ""let g:sneak#streak = 1
"}}}
Plugin 'taglist.vim' "{{{
    "Map for Taglist
    map <silent> <F9> :TlistToggle<CR>
    nmap <Leader>t :TlistToggle<CR>
"}}}
Plugin 'kien/rainbow_parentheses.vim' "{{{
    let g:rbpt_colorpairs = [
        \ ['brown',       'RoyalBlue3'],
        \ ['Darkblue',    'SeaGreen3'],
        \ ['darkgray',    'DarkOrchid3'],
        \ ['darkgreen',   'firebrick3'],
        \ ['darkcyan',    'RoyalBlue3'],
        \ ['darkred',     'SeaGreen3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['brown',       'firebrick3'],
        \ ['gray',        'RoyalBlue3'],
        \ ['black',       'SeaGreen3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['Darkblue',    'firebrick3'],
        \ ['darkgreen',   'RoyalBlue3'],
        \ ['darkcyan',    'SeaGreen3'],
        \ ['darkred',     'DarkOrchid3'],
        \ ['red',         'firebrick3'],
        \ ]
    let g:rbpt_max = 16
    let g:rbpt_loadcmd_toggle = 0
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
"}}}
"
Plugin 'scrooloose/syntastic' "{{{
    let g:syntastic_quiet_messages = {"level": "warnings"} 
"}}}

Plugin 'SirVer/ultisnips' "{{{
    let g:UltiSnipsExpandTrigger = "<c-j>"
    let g:UltiSnipsJumpForwardTrigger = "<tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"}}}
Plugin 'honza/vim-snippets'

Plugin 'Valloric/YouCompleteMe' "{{{
    set completeopt-=preview                                                                                                                                                                 
    let g:ycm_autoclose_preview_window_after_insertion = 1 
    let g:ycm_autoclose_preview_window_after_completion = 1 
    let g:ycm_add_preview_to_completeopt = 0 

    let g:ycm_complete_in_comments = 1 
    let g:ycm_confirm_extra_conf = 0 
    let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
    let g:ycm_min_num_of_chars_for_completion=1

    nnoremap <F4> :YcmDiags<CR>
    nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
    nnoremap <C-g> :YcmCompleter GoTo<CR>
    nnoremap <C-t> :YcmCompleter GetType<CR>
    nnoremap <leader>ycmd :YcmCompleter GetDoc<CR>
"}}}

Plugin 'tpope/vim-fugitive'
""Plugin 'Shougo/neosnippet'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'fatih/vim-go'
""Plugin 'rust-lang/rust.vim'
""Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'python.vim'
Plugin 'bling/vim-airline'
" vundle 配置结束{{{
" All of your Plugins must be added before the following line
" for vundle
call vundle#end()            " required
" }}}

" 其它配置{{{
"extra settings
set showcmd 
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
syntax on
" }}}

" Tmux 设置{{{
"insert cursor on tmux
if exists('$ITERM_PROFILE')
  if exists('$TMUX') 
    let &t_SI = "\<Esc>[3 q"
    let &t_EI = "\<Esc>[0 q"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
end
" }}}

" 自定义快捷map{{{
" Index ctags from any project
map <Leader>ct :!ctags -R .<CR>

" Easy open write and quit file
nnoremap <leader>o :CtrlP<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

"Remap VIM 0
map 0 ^

"Enter visual line mode with <leader><leader>
nmap <leader><leader> V

nnoremap <leader>p :set invpaste paste?<CR>
nnoremap <leader>n :set invnumber<CR>
nnoremap <leader>t :TlistToggle<CR>
nnoremap <leader>l :NERDTreeToggle<CR>
" }}}

" 放在最后，指定本文件的折叠方式
" vim:foldmethod=marker:foldlevel=0


