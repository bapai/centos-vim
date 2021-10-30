"https://www.cnblogs.com/XNQC1314/p/8692993.html
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin
"
"从不备份  
set nobackup  
set noswapfile  "禁止生成临时文件
" General setting {{{
set mouse=a
set nocompatible    " 不要使用vi的键盘模式，而是vim自己的
set history=1024
"set autochdir
set whichwrap=b,s,<,>,[,]
set nobomb
set backspace=indent,eol,start whichwrap+=<,>,[,]
"Vim default register and share with system
"共享剪贴板  
set clipboard+=unnamed
"set alt-key never mapping to Veg-tab-list
"
" 在处理未保存或只读文件的时候，弹出确认
set confirm
"搜索忽略大小写
set ignorecase
"搜索逐字符高亮
set hlsearch
set incsearch
"行内替换
set gdefault
"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
"}}}
"Format {{{
filetype on     " 侦测文件类型
"允许插件  
filetype plugin on
"filetype indent on     " 为特定文件类型载入相关缩进文件
syntax on       " 语法高亮
"set smartindent
set autoindent      " 自动缩进
set expandtab
set tabstop=4       " Tab键的宽度
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 不要用空格代替制表符
set noexpandtab
set showmatch
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
"}}}
"GUI setting{{{
colorscheme darkblue
"colorscheme desert
"colorscheme evening
"设置Gvim字体
set guifont=Monospace\ 13
set autowrite               "自动保存
"set ruler                   " 打开状态栏标尺
set cursorline              " 突出显示当前行
set magic                   " 设置魔术
"set guioptions-=T           " 隐藏工具栏
"set guioptions-=m           " 隐藏菜单栏
set hlsearch
set number
""""""""""""""""""""""""""""""""""""""""""""""""""
"set guifont=Courier\ New:h20
"set lines=35 columns=118
winpos 300 0
"set gcr=n-v-c:ver25-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor
"
"Gvim打开即进入全屏
"au GUIEnter * simalt ~x
"}}}
"alt-n
inoremap <M-j> <Down>
inoremap <M-k> <Up>
inoremap <M-h> <left>
inoremap <M-l> <Right>
imap <M-i> <ESC>
vmap <M-i> <ESC>


" Windows like custom setting{{{
"imap <C-v> <ESC>"+gpa
imap <C-v> "+gP
vmap <C-c> "+y
vnoremap <BS> d 
vnoremap <C-c> "+y
vmap <C-v> "+gP
map <S-Insert> "+gP
cmap <C-V>	<C-R>+
cmap <S-Insert> <C-R>+
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
nmap <M-a> ggVG


" CTRL-Z is Undo; not in cmdline though
noremap <C-Z> u
inoremap <C-Z> <C-O>u
"inoremap <C-z> <ESC>ua

" Use CTRL-S for saving, also in Insert mode (<C-O> doesn't work well when
" using completions).
noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<Esc>:update<CR>gi

"}}}

"Page 227 in Practical Vim PDF book. Written by Drew.
xnoremap * : <C-u> call  <SID>VSetSearch() <CR>/<C-R>=@/<CR><CR>
xnoremap # : <C-u> call  <SID>VSetSearch() <CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch()
let temp = @s
norm! gv"sy
let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
let @s = temp
endfunction

nnoremap <C-left> :bn<CR>
nnoremap <C-right> :bp<CR>
"use buffer list	:bpprev and :bnext
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

nnoremap <tab> V>
nnoremap <S-tab> V<
vnoremap <tab> >gv
vnoremap <S-tab> <gv
inoremap <s-tab> <ESC>V<

nnoremap ,, ,

"Ctrl + n :used to cancel the high-light of present searching char
map <C-n> :nohl<CR>

"quick align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

map <F2> :NERDTreeToggle<CR>
map <F4><F4> :set lines=35 columns=118<CR>
map <F3><F3> :call TitleDet()<cr>
function	AddTitle()
	call append(0,"/*========================================================================")
	call append(1,"* Author				: tao")
	call append(2,"* Work No.			: 21682168")
	call append(3,"* Mail				: tao@upsame.com")
	call append(4,"* Last modified		: ".strftime("%Y-%m-%d %H:%M"))
	call append(5,"========================================================================*/")
endfunction

"设置括号自动补全
"inoremap ' ''<ESC>i
"inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap < <><ESC>i
""inoremap { {<CR>}<ESC>O
inoremap { {}<ESC>i
" set for nerd-commenter
nmap <C-/> <leader>c<space>
vmap <C-/> <leader>c<space>
imap <C-/> <ESC><leader>c<space>$
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"indentline
let g:indentline_enabled = 1
"let g:autopep8_disable_show_diff = 1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

"bracket rainbow
 let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

"vim-cursorline
 set cursorline	"use this plugin
 "set nocursorline	"not use this plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plug airline 
let laststatus = 2
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#buffer_idx_mode = 0

nnoremap <leader>1 :buffer 1<cr>
nnoremap <leader>2 :buffer 2<cr>
nnoremap <leader>3 :buffer 3<cr>
nnoremap <leader>4 :buffer 4<cr>
nnoremap <leader>5 :buffer 5<cr>
nnoremap <leader>6 :buffer 6<cr>
nnoremap <leader>7 :buffer 7<cr>
nnoremap <leader>8 :buffer 8<cr>
nnoremap <leader>9 :buffer 9<cr>
"" tab or buf 1
"nnoremap <leader>1 :call Tab_buf_switch(1)<cr>
"" tab or buf 2
"nnoremap <leader>2 :call Tab_buf_switch(2)<cr>
"" tab or buf 3
"nnoremap  <leader>3 :call Tab_buf_switch(3)<cr>
"" tab or buf 4
"nnoremap  <leader>4 :call Tab_buf_switch(4)<cr>
"" tab or buf 5
"nnoremap  <leader>5 :call Tab_buf_switch(5)<cr>
"" tab or buf 6
"nnoremap  <leader>6 :call Tab_buf_switch(6)<cr>
"" tab or buf 7
"nnoremap  <leader>7 :call Tab_buf_switch(7)<cr>
"" tab or buf 8
"nnoremap  <leader>8 :call Tab_buf_switch(8)<cr>
"" tab or buf 9
"nnoremap  <leader>9 :call Tab_buf_switch(9)<cr>
function! Tab_buf_switch(num) abort
    if exists('g:feat_enable_airline') && g:feat_enable_airline == 1
        execute 'normal '."\<Plug>AirlineSelectTab".a:num
    else
        if exists( '*tabpagenr' ) && tabpagenr('$') != 1
            " Tab support && tabs open
            execute 'normal '.a:num.'gt'
        else
            let l:temp=a:num
            let l:buf_index=a:num
            let l:buf_count=len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
            if l:temp > l:buf_count
                return
            endif
            while l:buf_index != 0
                while !buflisted(l:temp)
                    let l:temp += 1
                endw
                let l:buf_index -= 1
                if l:buf_index != 0
                    let l:temp += 1
                endif
            endw
            execute ':'.l:temp.'b'
        endif
    endif
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.sv,*.v exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\#########################################################################") 
        call append(line("."), "\# File Name: ".expand("%")) 
        call append(line(".")+1, "\# Author: Justin") 
        call append(line(".")+2, "\# mail:formaltao@qq.com") 
        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+4, "\#########################################################################") 
        call append(line(".")+5, "\#!/bin/bash") 
        call append(line(".")+6, "") 
    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "    > Author: Justin") 
        call append(line(".")+2, "    > Mail: formaltao@qq.com")
        call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
    endif
 "   if &filetype == 'cpp'
 "       call append(line(".")+6, "#include<iostream>")
 "       call append(line(".")+7, "using namespace std;")
 "       call append(line(".")+8, "")
 "   endif
 "   if &filetype == 'c'
 "       call append(line(".")+6, "#include<stdio.h>")
 "       call append(line(".")+7, "")
 "   endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc 
"去空行  
nnoremap <F9> :g/^\s*$/d<CR>	
nnoremap <F10> <ESC>mm:%s/<C-r><C-w>//gn<CR>`m
nnoremap <S-F10> <ESC>mm:%s/<C-r><C-w>\>//gn<CR>`m
"C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'sh'
        :!./%
    endif
endfunc
"C,C++的调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""实用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置当文件被改动时自动载入
set autoread
" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
"代码补全 
set completeopt=preview,menu 
"set completeopt=longest,menu 
"make 运行
:set makeprg=g++\ -Wall\ \ %
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" self-define
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 字符间插入的像素行数目
set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=key
"set selectmode=mouse,key
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
" 为C程序提供自动缩进
set smartindent
" 高亮显示普通txt文件（需要txt.vim脚本）
au BufRead,BufNewFile *  setfiletype txt
""""""""""""""""============================================
" CTags的设定  
let Tlist_Sort_Type = "name"    " 按照名称排序  
let Tlist_Use_Right_Window = 1  " 在右侧显示窗口  
let Tlist_Compart_Format = 1    " 压缩方式  
let Tlist_Exist_OnlyWindow = 1  " 如果只有一个buffer，kill窗口也kill掉buffer  
let Tlist_File_Fold_Auto_Close = 0  " 不要关闭其他文件的tags  
let Tlist_Enable_Fold_Column = 0    " 不要显示折叠树  
autocmd FileType java set tags+=D:\tools\java\tags  
"autocmd FileType h,cpp,cc,c set tags+=D:\tools\cpp\tags  
"let Tlist_Show_One_File=1            "不同时显示多个文件的tag，只显示当前文件的
"设置tags  
set tags=tags  
"set autochdir 
"============================================================
"其他东东
"============================================================
"默认打开Taglist 
let Tlist_Auto_Open=1 
"""""""""""""""""""""""""""""" 
" Tag list (ctags) 
"""""""""""""""""""""""""""""""" 
let Tlist_Ctags_Cmd = '/usr/bin/ctags' 
let Tlist_Show_One_File = 1 "不同时显示多个文件的tag，只显示当前文件的 
let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim 
let Tlist_Use_Right_Window = 1 "在右侧窗口中显示taglist窗口
" minibufexpl插件的一般设置
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1
"END of -- self-define
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
