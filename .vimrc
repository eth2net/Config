"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"=>General
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

" Sets how many lines of history VIM has to remember
set history=300

" Set fileencodings
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" Set statusline
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

" Enable filetype plugin
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Fast editing of the .vimrc
map <leader>e :e! ~/.vim_runtime/vimrc<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

" Setting path
set path=.,/usr/include,,/usr/share/vim/vim72/**

" Setting seesionoptions
"set sessionoptions-=curdir
"set sessionoptions+=sesdir

"Switch FlieTab
function! SwitchToBuf(filename)
    "let fullfn = substitute(a:filename, "^\\~/", $HOME . "/", "")
    " find in current tab
    let bufwinnr = bufwinnr(a:filename)
    if bufwinnr != -1
        exec bufwinnr . "wincmd w"
        return
    else
        " find in each tab
        tabfirst
        let tab = 1
        while tab <= tabpagenr("$")
            let bufwinnr = bufwinnr(a:filename)
            if bufwinnr != -1
                exec "normal " . tab . "gt"
                exec bufwinnr . "wincmd w"
                return
            endif
            tabnext
            let tab = tab + 1
        endwhile
        " not exist, new tab
        exec "tabnew " . a:filename
    endif
endfunction

"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" => Files and backups
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"=>User Interface
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
syntax enable    "代码高亮
set showcmd
set showmatch    " 括号匹配 Show matching brackets.
set matchtime=5  " 匹配时间 time=0.1s
set smartcase	 " Do smart case matching
set mouse=a	 " Enable mouse usage (all modes)

set fdm=marker   " foldmethod代码折叠(manual,indent,expr,syntax,diff,maker)
set number       " 显示行号
set autoindent   " 自动缩进

"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"=>Tab and Tab related
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
set tabstop=4    "Tab宽度
set expandtab    "Tab转换为空格
set shiftwidth=4 "缩进宽度
set smarttab     "智能删除Tab

" PHP
autocmd FileType php set tabstop=8 | set expandtab | set shiftwidth=8 | set smarttab

"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"=>Omni Complete
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"set completeopt=longest,menu

" Mapping
inoremap <expr> <CR>       pumvisible()?"\<C-Y>":"\<CR>"
inoremap <expr> <C-J>      pumvisible()?"\<C-N>":"\<C-X><C-O>"
inoremap <expr> <C-K>      pumvisible()?"\<C-P>":"\<C-K>"
inoremap <expr> <C-U>      pumvisible()?"\<C-E>":"\<C-U>" 

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"=>Maps
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

"Fast reloading of the .vimrc
map <silent> <leader>ss :source ~/.vimrc<cr>

" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
map <leader>e :e! ~/.vimrc<cr>

" Tag List Open/Close
map <silent> <F9> :TlistToggle<cr>

" Netrw Open
nmap <silent> <leader>fe :Sexplore!<cr> 


"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"=>Ctags
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"set tags = tags


"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"=>Tag List
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
let Tlist_Ctags_Cmd = '/usr/bin/ctags' "设定linux系统中ctags程序的位置
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口 
let Tlist_File_Fold_Auto_Close = 1     "taglist只显示当前文件tag，其它文件的tag都被折叠起来
let Tlist_GainFocus_On_ToggleOpen = 1  "使用:TlistToggle打开taglist窗口时，输入焦点在taglist窗口中

"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"=>netrw setting 文件管理器
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
let g:netrw_winsize = 30
"nmap <silent> <leader>fe :Sexplore!<cr> 

"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"=>BufExplorer
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
autocmd BufWinEnter \[Buf\ List\] setl nonumber

"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"=>miniBufExpl
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 

"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
"=>winmanager
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
let g:winManagerWindowLayout = "BufExplorer,FileExplorer|TagList"
let g:winManagerWidth = 30
let g:defaultExplorer = 0
nmap <C-W><C-F> :FirstExplorerWindow<cr>
nmap <C-W><C-B> :BottomExplorerWindow<cr>
nmap <silent> <leader>wm :WMToggle<cr> 
