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

func! s:transparent_background()
    highlight Normal guibg=None ctermbg=None
    highlight NonText guibg=None ctermbg=None
endf
autocmd ColorScheme * call s:transparent_background()
set termguicolors " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
hi NonText ctermfg=gray guifg=grey10
" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h
" matlab 
" 支持matlab语法检查 ls -s /usr/local/matlab/R2020a/bin/glnxa64/mlint /usr/bin/mlint
" 使用fish时，直接在~/.config/fish/config.fish中添加mlint环境变量(set -g -x PATH /usr/local/matlab/R2020a/bin/glnxa64/ $PATH)
autocmd BufEnter *.m compiler mlint

" matlab 缩进
autocmd FileType matlab set tabstop=4 
autocmd FileType matlab set shiftwidth=4 
autocmd FileType matlab set softtabstop=4
" 彩虹括号
" let g:rainbow_active = 1

" 除了matlab以外其他用coc补全
" autocmd WinEnter,BufEnter * if &filetype != "matlab"
"                             \ | let b:coc_suggest_disable=1
"                             \ | endif
"

" matlab path
let g:matlab_executable = '/usr/local/matlab/R2020a/bin/matlab'
let g:matlab_panel_size = 50
" 禁用matlab映射,冲突
let g:matlab_default_mappings = 0 " 1启用
let g:matlab_auto_start = 0 "禁止自动启动matlabserver
" 所有文件禁止拼写检查
autocmd BufEnter * set nospell
