"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|
" Author: @theniceboy 
" Checkout-list
" vim-esearch
" fmoralesc/worldslice
" SidOfc/mkdx


" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
	let has_machine_specific_file = 0
	silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
"source $XDG_CONFIG_HOME/nvim/_machine_specific.vim
source ~/.config/nvim/_machine_specific.vim


" ====================
" === Editor Setup ===
" ====================
" 新建python文件是添加开头注释
function HeaderPython()
call setline(1, "#!/usr/bin/env python")
call append(1, "#-*- coding:utf8 -*-")
call append(2, "# Power by SebasTian" . strftime('%Y-%m-%d %T', localtime()))
normal G
normal o
normal o
endf
function HeaderTex()
call setline(1,"%!TEX program = xelatex")
endf
autocmd bufnewfile *.py call HeaderPython()
autocmd bufnewfile *.tex call HeaderTex()

" ===
" === System
" ===
set clipboard=unnamedplus "共享剪切板
let &t_ut=''
set autochdir
" ===
" === Editor behavior
" ===
set number
set t_Co=256 
set relativenumber
set cursorline
set hidden
set noexpandtab

" matlab下用4，其他情况下设置2
set tabstop=4
set shiftwidth=4
set softtabstop=4

set autoindent
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=4
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set mouse=a
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
"silent !mkdir -p ~/.config/nvim/tmp/sessions
"set backupdir=~/.config/nvim/tmp/backup,.
"set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif
" set colorcolumn=100
set updatetime=100
set virtualedit=block

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ===
" === Terminal Behavior
" ===
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
let g:terminal_color_0   = '#000000'
let g:terminal_color_1   = '#FF5555'
let g:terminal_color_2   = '#50FA7B'
let g:terminal_color_3   = '#F1FA8C'
let g:terminal_color_4   = '#BD93F9'
let g:terminal_color_5   = '#FF79C6'
let g:terminal_color_6   = '#8BE9FD'
let g:terminal_color_7   = '#BFBFBF'
let g:terminal_color_8   = '#4D4D4D'
let g:terminal_color_9   = '#FF6E67'
let g:terminal_color_10  = '#5AF78E'
let g:terminal_color_11  = '#F4F99D'
let g:terminal_color_12  = '#CAA9FA'
let g:terminal_color_13  = '#FF92D0'
let g:terminal_color_14  = '#9AEDFE'
let g:terminal_color_14  = '#00FF03'



" ===
" === Basic Mappings 改建
" ===
" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
noremap ; :

" Save & quit
noremap Q :q!<CR>
noremap S :w!<CR>

" Open the vimrc file anytime
noremap <LEADER>in :e ~/.config/nvim/init.vim<CR>

" Open Startify打开初始界面
noremap <LEADER>st :Startify<CR>

" Better indenting
vnoremap < <gv
vnoremap > >gv

" I hate escape more than anything else
"inoremap jk <Esc>
"inoremap kj <Esc>

" Indentation
nnoremap < <<
nnoremap > >>

" Move selected line / block of text in visual mode
"
" shift + k to move up
" shift + j to move down
xnoremap <up> :move '<-2<CR>gv-gv
xnoremap <down> :move '>+1<CR>gv-gv

" Search 禁用搜索高亮，<CR>
noremap <LEADER><CR> :nohlsearch<CR>

"全局替换
noremap \s :%s//g<left><left>

"Folding "折叠代码
noremap <LEADER>o za

nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
nnoremap \b :bd<CR>
":bd退出当前buffer

" close F1 neovim help
nmap <F1> <Esc>

" ===
" === Cursor Movement
" ===

" Faster in-line navigation
noremap W 5w
noremap B 5b
noremap J 15j
noremap K 15k
noremap E $
noremap - N
"alignment noremap = n
" Easier line-wise movement
nnoremap gh g^
nnoremap gl g$
" Yank from cursor position to end-of-line
nnoremap Y y$
" Delete from cursor position to end-of-line
nnoremap D d$
" copy to system clipboard
vnoremap Y "+y
nnoremap P "+p
" === Window management 切换窗口
" ===

" 更方便窗口间移动
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
imap <C-h> <C-w>h
imap <C-j> <C-w>j
imap <C-k> <C-w>k
imap <C-l> <C-w>l
" 修正易错命令
command -bang -nargs=* Q q<bang>
command -bang -nargs=* Wa wa<bang>
command -bang -nargs=* WA wa<bang>
command -bang -nargs=* -complete=file W w<bang> <args>
command -bang -nargs=* -complete=file Wq wq<bang> <args>
command -bang -nargs=* -complete=file WQ wq<bang> <args>

" Disable the default s key
noremap s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>

" Rotate screens调整当前窗口水平垂直
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H


" Terminal window navigation
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
tnoremap <Esc> <C-\><C-n>

" Use alt + hjkl to resize windows
nnoremap <silent> <leader><down>    :resize -2<CR>
nnoremap <silent> <leader><up>    :resize +2<CR>
nnoremap <silent> <leader><left>    :vertical resize -2<CR>
nnoremap <silent> <leader><right>    :vertical resize +2<CR>
" Resize splits with arrow keys

" Press <SPACE> + q to close the window below the current window
noremap <LEADER>qj <C-w>j:q<CR>
noremap <LEADER>qk <C-w>k:q<CR>
noremap <LEADER>qh <C-w>h:q<CR>
noremap <LEADER>ql <C-w>l:q<CR>


" ===
" === Tab management 标签操作
" ===
" Create a new tab with tu
noremap tu :tabe<CR>
" Move around tabs with tn and ti
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tmh :-tabmove<CR>
noremap tml :+tabmove<CR>


" ===
" === Markdown Settings
" ===
" Snippets
source ~/.config/nvim/md-snippets.vim
" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell


" ===
" === Other useful stuff
" ===
" Press space twice to jump to the next '' and edit it
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" Spelling Check with <space>sc 拼写检查
noremap <LEADER>sc :set spell!<CR>

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h


" Call figlet 插入字符图画
noremap tx :r !figlet

"去空行  
nnoremap <F3> :g/^\s*$/d<CR> 

"比较文件  
nnoremap <F2> :vert diffsplit 

" 设置调试位置
" 使用方式：首先安装 ipdb: pip install ipdb,然后在需要调试开始的地方按<F5>插入
" 语句，运行代码自动开启调试模式
" 常用命令如下：
" h(help)：帮助命令
" s(step into)：进入函数内部
" n(next)：执行下一行
" b(break): b line_number 打断点
" cl(clear): 清除断点
" c(continue): 一直执行到断点
" r(return): 从当前函数返回
" j(jump): j line_number，跳过代码片段，直接执行指定行号所在的代码
" l(list): 列出上下文代码
" a(argument): 列出传入函数所有的参数值
" p/pp: print 和 pretty print 打印出变量值
" r(restart): 重启调试器
" q(quit): 推出调试，清除所有信息
autocmd Filetype python nnoremap <F5> Oimport ipdb; ipdb.set_trace() # BreakPoint<ESC>

"====
"=====格式化代码
"=====
map <F4> :call FormartSrc()<CR><CR>
"定义FormartSrc()
func FormartSrc()
    exec "w"
    if &filetype == 'c'
        exec "!astyle --style=ansi -a --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'hpp'
        exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'||&filetype == 'python'
        exec "r !black -i --aggressive %"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
    else
        exec "normal gg=G"
        return
    endif
    exec "e! %"
endfunc


" Compile function
noremap <Leader>R :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
"生成.out可执行文件
	" elseif &filetype == 'cpp'
	"   set splitbelow
	"   exec "!g++ -std=c++11 % -Wall -o %<"
	"   :sp
	"   :res -15
	"   :term ./%<
"生成.exe中文不乱码可执行文件
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -finput-charset=gbk -std=c++11 % -Wall -o %<.exe"
		:sp
		:res -15
		:term ./%<.exe
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		" set splitbelow
		:sp "上下分割，vsp左右分割
        " :vsp
        :term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device
		CocCommand flutter.dev.openDevLog
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""实用设置
"回到上次打开位置
if has("autocmd")
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal g`\"" |
                \ endif
endif
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

"字体
set guifont=FiraCode\ Nerd\ Font\ Mono:h22
" set guifont=Hack\ Nerd\ Font:h22
" set guifont=Noto\ Color\ Emoji:h22


" ===
" === Install Plugins with Vim-Plug
" ===
call plug#begin('~/.config/nvim/plugged')
"Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'theniceboy/eleline.vim'
" let g:airline_powerline_fonts = 0
" Plug 'ojroques/vim-scrollstatus'
" let g:scrollstatus_size = 15

" Pretty Dress
Plug 'bling/vim-bufferline'
Plug 'flazz/vim-colorschemes'
Plug 'bpietravalle/vim-bolt'

" Treesitter
" Plug ' nvim-treesitter/nvim-treesitter ' , { ' do ' : ' :TSUpdate ' }

" Cool Icons
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

" Genreal Highlighter
" 显示颜色
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'RRethy/vim-illuminate'

" File navigation
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'} " 浮动窗口控制ranger
Plug 'airblade/vim-rooter' "将工作目录改为项目根目录

" Taglist
Plug 'liuchengxu/vista.vim' " 查看所有变量

" Auto Complete 自动补全插件
" coc补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'wellle/tmux-complete.vim'

" Snippets
Plug 'theniceboy/vim-snippets' "代码块

" Undo Tree
Plug 'mbbill/undotree' "历史记录

" Git
Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
Plug 'fszymanski/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'
Plug 'cohama/agit.vim'

" Python
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
Plug 'tweekmonster/braceless.vim', { 'for' :['python', 'vim-plug'] }

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim'

" Editor Enhancement
Plug 'jiangmiao/auto-pairs' "括号自动匹配
Plug 'mg979/vim-visual-multi' "多光标操作
Plug 'tpope/vim-commentary' "注释<leader>/
Plug 'preservim/nerdcommenter'

Plug 'gcmt/wildfire.vim' " <Enter>只能选择匹配符()，[],'',if else等内的内容
Plug 'tpope/vim-surround' " 命令行模式下，ds删除一个配对符号,cs更改一个配对符号,ys增加一个配对符号.可视化模式下，s增加一个配对符号。
"Plug 'godlygeek/tabular' " ta, or :Tabularize <regex> to align,对齐文本
Plug 'easymotion/vim-easymotion'
Plug 'AndrewRadev/splitjoin.vim' "gS将单行拆成多行，gJ将多行合并成一行

" Autoformat coc-setting.json中已经设置了python保存自动格式化
" Plug 'Chiel92/vim-autoformat'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'


" terminal
Plug 'voldikss/vim-floaterm' "浮动终端

" Find and replace
Plug 'ChristianChiarulli/far.vim'

" Bookmarks
Plug 'kshenoy/vim-signature' "书签操作

" Mini Vim-APP花式启动vim
Plug 'mhinz/vim-startify'

" Other visual enhancement
" 文件类型对应图标
Plug 'ryanoasis/vim-devicons'
Plug 'mg979/vim-xtabline'
"彩虹括号
Plug 'luochen1990/rainbow'
"代码对齐可视化
Plug 'yggdroot/indentline'

"snips
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'


" Matlab
Plug 'HaoHao-Ting/vim-matlab-formatter'  " Matlab格式化
" 远程启动matlab
" Plug 'daeyun/vim-matlab'
" 语法高亮，缩进
Plug 'yinflying/matlab.vim'
"匹配if/end
Plug 'tmhedberg/matchit'
"支持matlab语法检查 ls -s /usr/local/matlab/R2020a/bin/glnxa64/mlint /usr/bin/mlint
autocmd BufEnter *.m compiler mlint
Plug 'ebranlard/vim-matlab-behave'
call plug#end()


" experimental
set re=0
set lazyredraw
"set regexpengine=1
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
filetype plugin indent on     " required!

" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" c
" ===
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
    let has_machine_specific_file = 0
    silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source ~/.config/nvim/_machine_specific.vim


" ===
" === Dress up my vim
" ===
" 背景透明化
func! s:transparent_background()
    highlight Normal guibg=None ctermbg=None
    highlight NonText guibg=None ctermbg=None
endf
autocmd ColorScheme * call s:transparent_background()
set termguicolors " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" set background=dark
" let ayucolor="mirage"
" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1
" let g:one_allow_italics = 1
" colorscheme space-vim-dark
" colorscheme vorange
	 colorscheme deus
	 " colorscheme gruvbox
" colorscheme OceanicNext
hi NonText ctermfg=gray guifg=grey10
" hi SpecialKey ctermfg=blue guifg=grey70

" ===================== Start of Plugin Settings =====================

"===
"===floatterm浮动终端窗口
"===
" Opening a terminal window, crtl+N 切换终端为可选择窗口
let g:floaterm_keymap_new = '\/'
let g:floaterm_keymap_prev = '\-'
let g:floaterm_keymap_next = '\='
let g:floaterm_keymap_toggle = '\x' "打开或隐藏
let g:floaterm_keymap_kill = '\d' "关闭

let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1

"===
"===indentLine
"===
let g:indentLine_setColors = 1 "使用主题附带的indentline
 " let g:indentLine_color_gui = '#875fd7'
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_char_list = ['|']

"===
" === airline.vim
" ===
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
 " let g:airline_theme = 'violet'  " 主题
 " let g:airline_theme = 'monochrome'
 " let g:airline_theme = 'raven'
let g:airline_theme = 'serene'
let g:airline#extensions#tabline#buffer_nr_show = 1
let w:airline_skip_empty_sections              = 1
let g:airline_section_warning                  = ''
let g:airline#extensions#tabline#fnamemod      = ':~'
let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline#extensions#branch#displayed_head_limit = 10

" Disable tabline close button
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#fnamecollapse = 1

let g:airline_extensions = ['branch', 'hunks', 'coc']

let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#coc#enabled = 1

let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
			 \ '0': '0 ',
			 \ '1': '1 ',
			 \ '2': '2 ',
			 \ '3': '3 ',
			 \ '4': '4 ',
			 \ '5': '5 ',
			 \ '6': '6 ',
			 \ '7': '7 ',
			 \ '8': '8 ',
			 \ '9': '9 '
			 \}
" 设置切换tab的快捷键 <\> + <i> 切换到第i个 tab
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
"Just show the file name
let g:airline#extensions#tabline#fnamemod = ':t'
"
" enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" Switch to your current theme
 let g:airline_theme = 'deus'

" Always show tabs
set showtabline=2

" We don't need to see things like -- INSERT -- anymore
" set noshowmode

" ==
" == GitGutter
" ==
" let g:gitgutter_signs = 0
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '░'
let g:gitgutter_sign_removed = '▏'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▒'
" autocmd BufWritePost * GitGutter
nnoremap <LEADER>gf :GitGutterFold<CR>
nnoremap H :GitGutterPreviewHunk<CR>
nnoremap <LEADER>g- :GitGutterPrevHunk<CR>

" ===
" === FZF 快速查找文件
" ===
"打开文件
" noremap <C-p> :Files<CR>
noremap <C-p> :Leaderf file<CR>
noremap <C-f> :Rg<CR>
"打开文件历史
noremap <C-e> :History<CR>
"noremap <C-t> :BTags<CR>
noremap <C-t> :Lines<CR>
"选择buffer
noremap <C-w> :Buffers<CR> 
"选择关闭buffer
noremap <C-d> :BD<CR>
"命令历史
noremap <C-;> :History:<CR>

let g:fzf_preview_window = 'right:60%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }
"let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"===
"===Leaderf
"===
" let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewCode = 1
let g:Lf_ShowHidden = 1
let g:Lf_ShowDevIcons = 1
" let g:Lf_CommandMap = {
" \   '<C-k>': ['<C-u>'],
" \   '<C-j>': ['<C-e>'],
" \   '<C-]>': ['<C-v>'],
" \   '<C-p>': ['<C-n>'],
" \}
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_WildIgnore = {
        \ 'dir': ['.git', 'vendor', 'node_modules'],
        \ 'file': ['__vim_project_root']
        \}
let g:Lf_UseMemoryCache = 0
let g:Lf_UseCache = 0



" "===
" "===ncm2补全,帮助coc补全一些库
" "===
" " 不要自动插入补全结果，不要自动选中第一补全，只有一个补全项的时候也显示出来
" set completeopt=noinsert,menuone,noselect
" " 强制使用ncm2补全,当coc不能补全时使用
" autocmd BufEnter * call ncm2#enable_for_buffer()
" " noremap <Leader><Tab> :call ncm2#enable_for_buffer()<CR>
" inoremap <c-c> <ESC>
" " 延迟弹窗,这样提示更加流畅
" let ncm2#popup_delay = 5
" "输入几个字母开始提醒:[[最小优先级,最小长度]]
" "如果是输入的是[[1,3],[7,2]],那么优先级在1-6之间,会在3个字符弹出,如果大于等于7,则2个字符抬出----优先级概念请参考文档中 ncm2-priority 
" let ncm2#complete_length = [[1, 1]]
" "模糊匹配模式,详情请输入:help ncm2查看相关文档
" let g:ncm2#matcher = 'substrfuzzy'
" "使用tab键向下选择弹框菜单
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>" 
" "使用shift+tab键向上选择弹窗菜单,这里不设置因为笔记本比较难操作.如果向下太多我通常习惯使用Backspace键再重新操作一遍
" "inoremap <expr> <S> pumvisible() ? "\<C-p>" : "\<S>"   
" " 退出补全的时候自动关闭补全菜单
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" " 有补全菜单的时候回车时，不仅关闭补全菜单，再加上一个回车（默认行为是吃掉这个回车，很多时候代码写快了，一个回车按下去没有反应还是很烦心的）
" inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")


" ===
" === coc补全
"silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
" autocmd FileType vim,tex :call coc#config("suggest.autoTrigger", "always") "使用coc补全
" autocmd FileType cpp,python,hpp,h,c :call coc#config("suggest.autoTrigger", "none") "当文件为python时禁用coc补全，用ncm2补全
" autocmd FileType python let b:coc_suggest_disable = 1
  "\ 'coc-pyright',
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-actions',
  \ 'coc-sh',
  \ 'coc-java-debug',
  \ 'coc-java',
  \ 'coc-lists',
  \ 'coc-emmet',
  \ 'coc-tasks',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-floaterm',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-cssmodules',
  \ 'coc-stylelintplus',
  \ 'coc-emoji',
  \ 'coc-yaml',
  \ 'coc-explorer',
  \ 'coc-svg',
  \ 'coc-prettier',
	\ 'coc-pyright',
  \ 'coc-vimlsp',
	\ 'coc-vimtex',
  \ 'coc-xml',
  \ 'coc-yank',
  \ 'coc-json',
  \ 'coc-marketplace',
  \ 'coc-diagnostic',
  \ 'coc-flutter-tools',
  \ 'coc-gitignore',
  \ 'coc-json',
  \ 'coc-sourcekit',
  \ 'coc-translator',
  \ 'coc-cmake',
  \ 'coc-clangd',
  \ ]
  " \ 'coc-tabnine',
  " \ 'coc-highlight',
  "\ 'coc-python',
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"nmap <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]	=~ '\s'
endfunction
"<TAB>选择补充词
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>":
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <c-o> coc#refresh()
function! Show_documentation()
	call CocActionAsync('highlight')
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" 查看文档
nnoremap <leader>k :call Show_documentation()<CR>
"autocmd CursorHold * silent call CocActionAsync('highlight')

" Open up coc-commands
nnoremap <c-c> :CocCommand<CR>
" Text Objects
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap If <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
" Useful commands
" 剪切板历史
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
"跳转值函数定义出gd，跳转函数引用出gr,ctrl+o返回
nmap <silent>gd <Plug>(coc-definition)
"跳转到类型定义
nmap <silent>gy <Plug>(coc-type-definition)
"跳转到实现位置
nmap <silent>gi <Plug>(coc-implementation)
"跳转到引用位置
nmap <silent>gr <Plug>(coc-references)
"替换变量函数等名字
nmap <leader>rn <Plug>(coc-rename)
"coc的文件目录显示
nmap tt :CocCommand explorer<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
" coc-translator翻译
nmap ts <Plug>(coc-translator-p)
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
" coctodolist
nnoremap <leader>tn :CocCommand todolist.create<CR>
nnoremap <leader>tl :CocList todolist<CR>
nnoremap <leader>tu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR>
" coc-tasks
noremap <silent> <leader>ts :CocList tasks<CR>
" coc-snippets
" 打开代码片段，如输入ifmain+<c-s>自动出现if __name__ == '__main__'
" 补全后面为[LS]的是代码补全，[S]的是代码块补全
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-h> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-l>' "转到下一个要改的地方
let g:coc_snippet_prev = '<c-h>' "转到下一个要改的地方
imap <C-e> <Plug>(coc-snippets-expand-jump)
let g:snips_author = 'Sebastian'
" 错误信息
nmap <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <LEADER>= <Plug>(coc-diagnostic-next)
" 显示所有的诊断
nmap <LEADER>e  :<C-u>CocList diagnostics<cr>


" ===
" === markdownpreview
" ===
let g:mkdp_browser = ''
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
            \ 'mkit': {},
            \ 'katex': {},
            \ 'uml': {},
            \ 'maid': {},
            \ 'disable_sync_scroll': 0,
            \ 'sync_scroll_type': 'middle',
            \ 'hide_yaml_meta': 1
            \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'


" ===
" === Python-syntax
" ===
let g:python_highlight_all = 1
" let g:python_slow_sync = 0


" ===
" === vim-table-mode   markdown下打印表格格式插件
" ===
noremap <LEADER>tm :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 1
let g:table_mode_cell_text_object_i_map = 'k<Bar>'


" ===
" === vim-signature 书签插件,m/查看所有书签，mX删除当前行书签，mD删除所有书签
" ===
let g:SignatureMap = {
            \ 'Leader':"m",
            \ 'PlaceNextMark':"m,",
            \ 'ToggleMarkAtLine':"m.",
            \ 'PurgeMarksAtLine':"mX",
            \ 'DeleteMark':"",
            \ 'PurgeMarks':"mD",
            \ 'PurgeMarkers':"",
            \ 'GotoNextLineAlpha':"m=",
            \ 'GotoPrevLineAlpha':"m-",
            \ 'GotoNextSpotAlpha':"m=",
            \ 'GotoPrevSpotAlpha':"m-",
            \ 'GotoNextLineByPos':"",
            \ 'GotoPrevLineByPos':"",
            \ 'GotoNextSpotByPos':"",
            \ 'GotoPrevSpotByPos':"",
            \ 'GotoNextMarker':"",
            \ 'GotoPrevMarker':"",
            \ 'GotoNextMarkerAny':"",
            \ 'GotoPrevMarkerAny':"",
            \ 'ListLocalMarks':"m/",
            \ 'ListLocalMarkers':"m?"
            \ }


" ===
" === Undotree 修改的历史记录插件
" ===
noremap L :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
	nmap <buffer> k <plug>UndotreeNextState
	nmap <buffer> j <plug>UndotreePreviousState
	nmap <buffer> K 5<plug>UndotreeNextState
	nmap <buffer> J 5<plug>UndotreePreviousState
endfunc


" ===
" === vim-visual-multi 快速选中很多文本，添加很多光标
" alt+k选择文本，q取消当前文本选择,返回上一个，alt+n跳过当前，在alt+h/j/k/l等选择其他单词
"按[ or  ]选择下一个/上一个光标
"按下q可跳过当前并获得下一次出现
" ===
"let g:VM_theme             = 'iceblue'
"let g:VM_default_mappings = 0
let g:VM_leader                     = {'default': ',', 'visual': ',', 'buffer': ','}
let g:VM_maps                       = {}
let g:VM_maps['i']                  = 'i'
let g:VM_maps['I']                  = 'I'
let g:VM_maps['Find Under']         = '<M-m>'
let g:VM_maps['Find Subword Under'] = '<M-m>'
let g:VM_maps['Find Next']          = '<M-]>'
let g:VM_maps['Find Prev']          = '<M-[>'
let g:VM_maps['Remove Region']      = 'q'
let g:VM_maps['Skip Region']        = '<M-n>'
let g:VM_maps["Undo"]               = 'u'
let g:VM_maps["Redo"]               = '<M-r>'

"===
"===vim-hexokinase
"===
let g:Hexokinase_highlighters = [ 'virtual' ]
" Patterns to match for all filetypes
" Can be a comma separated string or a list of strings
" Default value:
let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla,colour_names'

" All possible values
let g:Hexokinase_optInPatterns = [
\     'full_hex',
\     'triple_hex',
\     'rgb',
\     'rgba',
\     'hsl',
\     'hsla',
\     'colour_names'
\ ]
" Filetype specific patterns to match
" entry value must be comma seperated list
let g:Hexokinase_ftOptInPatterns = {
\     'css': 'full_hex,rgb,rgba,hsl,hsla,colour_names',
\     'html': 'full_hex,rgb,rgba,hsl,hsla,colour_names'
\ }


" ===
" === Bullets.vim
" ===
" let g:bullets_set_mappings = 0
let g:bullets_enabled_file_types = [
			\ 'markdown',
			\ 'text',
			\ 'gitcommit',
			\ 'scratch'
			\]


" ===
" === Vista.vim
" 查看所有变量
noremap <LEADER>v :Vista coc<CR>
" \v 搜索函数，类，变量查看窗口
noremap \v :silent! Vista finder coc<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }


" ===
" === fzf-gitignore fzf接口，用于.gitignore使用gitignore.io API 创建文件
" ===
noremap <LEADER>gi :FzfGitignore<CR>


" ===
" === vim-easymotion
" ===
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_do_shade = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_prompt = '🔎 '



"===
"===vim-latex
"===
"Type help vimtex for detailed information
let g:tex_flavor='latex'
let g:vimtex_view_method='skim' "Use Skim as the pdf viewer
" let g:vimtex_view_method='zathura'
let g:vimtex_view_automatic=1
let g:vimtex_quickfix_mode=2
let g:vimtex_quickfix_autoclose_after_keystrokes=1
set conceallevel=2
let g:tex_conceal='abdmg'
let g:vimtex_quickfix_autojump=1
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-xelatex',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

let g:vimtex_complete_ignore_case=1
let g:vimtex_complete_close_braces=1

"In insert mode show the details, show the math equations othewise
" autocmd FileType tex inoremap jk <esc>:set conceallevel=2<cr>
" autocmd FileType tex nnoremap i :set conceallevel=0<cr>i
" autocmd FileType tex nnoremap s :set conceallevel=0<cr>s
" autocmd FileType tex nnoremap a :set conceallevel=0<cr>a
" autocmd Filetype tex setlocal nofoldenable

"-------set the shortcuts for compiling, viewing, and cleaning .tex files
autocmd FileType tex nmap <leader>b  \ll
autocmd FileType tex nmap <leader>v \lv
autocmd FileType tex  nmap <leader>c \lc
autocmd FileType tex nmap <leader>t \lt

"----------Settings for xuhdev/vim-latex-live-preview
autocmd Filetype tex setl updatetime=15 "To set the update time for live view
let g:livepreview_previewer='open -a skim'
" let g:livepreview_previewer='open -a zathura'


" ===
" === Colorizer 着色插件
" ===
let g:colorizer_syntax = 1

" ===
" === jsx
" ===
let g:vim_jsx_pretty_colorful_config = 1

" ===
" === tabular 对齐文本"/"后跟要对其的文本
" ===
"vmap ta :Tabularize /


" ===
" === rainbow
" ===
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
let g:rainbow_conf = {'guis': ['bold']}
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
\   'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\   'ctermfgs': ['lightyellow', 'lightcyan','lightblue', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}


" ===
" === xtabline
" ===
noremap to :XTabCycleMode<CR>
"noremap /p :XTabInfo<CR>
noremap /p :echo expand('%:p')<CR>
let g:xtabline_settings = {}

let g:xtabline_settings.enable_mappings = 0

let g:xtabline_settings.tabline_modes = ['buffers', 'tabs']

let g:xtabline_settings.enable_persistance = 0

let g:xtabline_settings.last_open_first = 1
let g:xtabline_lazy = 1

let g:xtabline_settings.show_right_corner = 0

let g:xtabline_settings.indicators = {
      \ 'modified': '+',
      \ 'pinned': '[📌]',
      \}
      " \ 'modified': '●',

let g:xtabline_settings.icons = {
      \'pin': '📌',
      \'star': '*',
      \'book': '📖',
      \'lock': '🔒',
      \'hammer': '🔨',
      \'tick': '✔',
      \'cross': '✖',
      \'warning': '⚠',
      \'menu': '☰',
      \'apple': '🍎',
      \'linux': '🐧',
      \'windows': '⌘',
      \'git': '',
      \'palette': '🎨',
      \'lens': '🔍',
      \'flag': '🏁',
      \}

" ===
" === vim-markdown-toc
" ===
"let g:vmt_auto_update_on_save = 0
"let g:vmt_dont_insert_fence = 1
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'

" ===
" === vim-illuminate突出光标下相同单词
" ===
let g:Illuminate_delay = 750
hi illuminatedWord cterm=undercurl gui=undercurl

" ===
" === vim-rooter 将工作目录改为项目根目录
" ===
let g:rooter_patterns = ['__vim_project_root', '.git/']
let g:rooter_silent_chdir = 1

"===
"===far
"===
let g:far#source='rgnvim'
" let g:far#source='rg'
" let g:far#source='vimgrep'
" let g:far#source='ag'

set lazyredraw            " improve scrolling performance when navigating through large results

let g:far#window_width=50
" Use %:p with buffer option only
let g:far#file_mask_favorites=['%:p', '**/*.*', '**/*.js', '**/*.py', '**/*.java', '**/*.css', '**/*.html', '**/*.vim', '**/*.cpp', '**/*.c', '**/*.h', ]
let g:far#window_min_content_width=30
let g:far#enable_undo=1

" let g:far#ignore_files=['$HOME/.config/nvim/utils/farignore']
" let g:far#ignore_files=['node_modules/']

"     Below are the default mappings and corresponding variable names in

" x v_x   - Exclude item under the cursor.

" i v_i   - Include item under the cursor.

" t v_t   - Toggle item exclusion under the cursor.

" f v_f   - Smartly toggle item exclusion under the cursor: exclude all items when all are excluded, otherwise exclude all items.

" X       - Exclude all items.

" I       - Include all items.

" T       - Toggle exclusion for all items.

" F       - Smartly toggle exclusion for all items: include all items when all are excluded, otherwise exclude all items.

" <CR>    - Jump to the source code of the item under the cursor. See |far-jump|

" p       - Open preview window (if not) and scroll to the item under the cursor. See |far-preview|

" P       - Close preview window. See |far-preview|

" CTRL-K  - Scroll preview window up (if open). See |far-preview|, |g:far#preview_window_scroll_step|

" CTRL-J  - Scroll preview window down (if open). See |far-preview|, |g:far#preview_window_scroll_step|

" zo      - Expand node under the cursor.

" zc      - Collapse node under the cursor.

" za      - Toggle node expanding under the cursor.

" zs      - Smartly toggle exclusion for all nodes: expand all nodes when all are collapsed, otherwise collapse all nodes.

" zr v_zr - Expand all nodes.

" zm v_zm - Collapse all nodes.

" zA v_zA - Toggle exclusion for all nodes.

" zS v_zS - Smartly toggle exclusion for all nodes: expand all nodes when all are collapsed, otherwise collapse all nodes.

" s v_s   - Execute |:Fardo|<CR>, to replace all included items.

" u v_s   - Execute |:Farundo|<CR>, to undo the last replacement by |:Fardo|.

" U v_U   - Execute |:Farundo| --all=1<CR>, to undo all replacements by |:Fardo|. For param '--all=' see |farundo-params|.

" q v_q   - Close searching result buffer and its preview buffer (if exists)


"===
"===rnvimr
"===
" Make Ranger replace netrw and be the file explorer
let g:rnvimr_ex_enable = 1

let g:rnvimr_draw_border = 1

" Make Ranger to be hidden after picking a file
let g:rnvimr_pick_enable = 1

" Make Neovim to wipe the buffers corresponding to the files deleted by Ranger
let g:rnvimr_bw_enable = 1

" nmap <leader>r :RnvimrToggle<CR>

let g:rnvimr_ranger_cmd = 'ranger --cmd="set column_ratios 1,1"'
            " \ --cmd="set draw_borders separators"'

" let g:rnvimr_layout = { 'relative': 'editor',
"             \ 'width': float2nr(round(0.6 * &columns)),
"             \ 'height': float2nr(round(0.6 * &lines)),
"             \ 'col': float2nr(round(0.2 * &columns)),
"             \ 'row': float2nr(round(0.2 * &lines)),
"             \ 'style': 'minimal' }

let g:rnvimr_presets = [
            \ {'width': 0.800, 'height': 0.800}]


" ===
" === AsyncRun
" ===
noremap gp :AsyncRun git push<CR>


" ===
" === AsyncTasks
" ===
let g:asyncrun_open = 6


" ===
" === dart-vim-plugin
" ===
let g:dart_style_guide = 2
let g:dart_format_on_save = 1
let g:dartfmt_options = ["-l 100"]


" ===
" === vim-format
" ===
augroup autoformat_settings
autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END
noremap <leader>F :FormatCode<CR>

" noremap <leader>M : MatlabFormatter<CR>
noremap <leader>M :make<CR>

"===
"===nerdcommenter 默认leader+cc/cu 不会改变注释行
"===
nnoremap <silent> <space>/ :Commentary<CR>
vnoremap <silent> <space>/ :Commentary<CR>
"add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" python 自动的会多加一个空格
au FileType python let g:NERDSpaceDelims = 0
 
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
 
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
 
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
 
" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
 
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
 
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
 
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

"===
"===vim-commentary
"===
autocmd FileType apache setlocal commentstring=#\ %s
function! Comment()
  if (mode() == "n" )
    execute "Commentary"
  else    
    execute "'<,'>Commentary"
  endif
 endfunction
vnoremap <silent> <space>/ :call Comment()<CR>



" ===
" === typescript-vim
" ===
let g:typescript_ignore_browserwords = 1

" ===
" === Agit
" ===
nnoremap <LEADER>gl :Agit<CR>
let g:agit_no_default_mappings = 1


" ===
" === nvim-treesitter
" ===
" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"   ensure_installed = {cpp},     -- one of "all", "language", or a list of languages
"   highlight = {
"     enable = true,              -- false will disable the whole extension
"     disable = { "rust" },  -- list of language that will be disabled
"   },
" }
" EOF


"SirVer/ultisnips
" 防止与coc补全冲突
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" ===================== End of Plugin Settings ===================== 
" ===
" === Necessary Commands to Execute
" ===
exec "nohlsearch"

" Open the _machine_specific.vim file if it has just been created
if has_machine_specific_file == 0
    exec "e ~/.config/nvim/_machine_specific.vim"
endif
