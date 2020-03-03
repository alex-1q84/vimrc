"使用中文帮助文档
set helplang=cn
"set ruler
"set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
" 我的状态行显示的内容（包括文件类型和解码）
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]

" set default encrypt function
set cm=blowfish

set number

" 总是显示状态行
set laststatus=2
"let g:Powerline_symbols='unicode'

set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

"if has('gui_running')
    "set background=light
"else
    set background=dark
"endif
colorscheme solarized8
"colorscheme mayansmoke

set guifont=Monaco:h15
" set guifont="fira code":h16

" set encoding=utf-8
set fenc=utf-8
set fencs=utf-8,gbk,gb18030,gb2312,cp936,usc-bom,euc-jp

" 命令行（在状态行下）的高度，默认为1，这里是2
"set cmdheight=2

" 高亮显示普通txt文件（需要txt.vim脚本）
au BufRead,BufNewFile *  setfiletype txt
" 支持编辑crontab文件
" au FileType crontab set backupcopy=yes
set nobackup

nnoremap <F5> "=strftime("%Y-%m-%d")<CR>P
iab <expr> dts strftime("%Y-%m-%d")

nnoremap tb :tabnew 

" set clipboard to default
set clipboard=
if has ("unix") && "Darwin" != system("echo -n \"$(uname)\"")
  " on Linux use + register for copy-paste
  nnoremap <leader>y "+y
  vmap <leader>y "+y
  nnoremap <leader>p "+gP
  vmap <leader>p "+gP
else
  " one mac and windows, use * register for copy-paste
  nnoremap <leader>y "*y
  vmap <leader>y "*y
  nnoremap <leader>p "*gP
  vmap <leader>p "*gP
endif

"map <C-h> <C-w>h
"map <C-j> <C-w>j
"map <C-k> <C-w>k
"map <C-l> <C-w>l

nnoremap <silent> <leader>l :nohlsearch<CR><C-l>

" tab switch
map <D-1> 1gt<CR>
map <D-2> 2gt<CR>
map <D-3> 3gt<CR>
map <D-4> 4gt<CR>
map <D-5> 5gt<CR>
map <D-6> 6gt<CR>
map <D-7> 7gt<CR>
map <D-8> 8gt<CR>
map <D-9> 9gt<CR>

" close current tab
map <D-w> :q<CR>

"防止 pymode 初始化导致 vim 僵死
let g:pymode_rope_lookup_project = 0

"clear some map
"unmap <space>
"unmap <c-space>
"unmap 0

"vim-snippet user snippets
let g:UltiSnipsSnippetDirectories=["UltiSnips","mysnippets"]
let g:ultisnips_python_style="GOOGLE"

function Sql2java()
"字符串替换
:%s/^\(\s*\)\(\w\+\)\s\+VARCHAR\d\?\s*(\(\d\+\).*/\1@Column(name="\2", length=\3)\r\1private String \L\2;
"数字替换
:%s/^\(\s*\)\(\w\+\)\s\+NUMBER\s*(\(\d\+\).*/\1@Column(name="\2", length=\3)\r\1private Long \L\2;
"timestamp transfer
:%s/^\(\s*\)\(\w\+\)\s\+TIMESTAMP\s*(\(\d\+\).*/\1@Column(name="\2", length=\3)\r\1private Timestamp \L\2;

let c = 0
while c < 5
    call _2Upper()
    let c += 1
endwhile
endfunction

function _2Upper()
"下划线后第一个字母转大写
:%s/_\(\w\)\(.*;\)/\u\1\2/g
endfunction

function ToOptUpdate()
  %s!\v(.*\{)([^,]+)(.*\}.*)!<if test="\2 \!= null">\r&\r</if>!g
endfunction
