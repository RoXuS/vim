"set completeopt+=longest  " эти опции для автодополнения функций перменных по cntrl-space + создается маленькое окошко сверху для показа определения функции послe набора завершающейся скобки оно закрывается.


set ts=4 " Табуляция равна 4-ем пробелам
set sts=4 " Двигать блоки в визуальном режиме на 4 пробела с помощью клавиш < и >
set sw=4 "
set et
set ai " Включаем автоотступ

" Делаем «умный» отступ в файлах содержащих Python-код после перечисленных
" ключевых слов
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

set t_Co=256
colorscheme desert256 " (Цветовая схема, работает у меня в rxvt-unicode с патчем для поддержки 256 цветов, увидеть её можно ниже на скриншоте)

let python_highlight_all = 1

syntax on " Включить подсветку синтаксиса
set nu " Включаем нумерацию строк

set mousehide " Спрятать курсор мыши когда набираем текст
set mouse=a " Включить поддержку мыши

set termencoding=utf-8 " Кодировка терминала
set novisualbell " Визуальный сигнал 
set t_vb=
set backspace=indent,eol,start whichwrap+=<,>,[,]
set nocompatible " Vim не vi
set showtabline=0
set modifiable
"set foldcolumn=4 "разобратся что за хрень
set smartindent "умный отступ
set wrap
set linebreak
set nobackup
set noswapfile
set encoding=utf-8 " Кодировка файлов по умолчанию
set fileencodings=utf8,cp1251 " Возможные кодировки файлов, если файл не в unicode кодировке, то будет использоваться cp1251

set helplang=en


autocmd BufWritePre *.py normal m`:%s/\s\+$//e `` 
fun! <SID>SetStatusLine()
	let l:s1="%-3.3n\\ %f\\ %h%m%r%w"
	let l:s2="[%{strlen(&filetype)?&filetype:'?'},%{&encoding},%{&fileformat}]"
	let l:s3="%=\\ 0x%-8B\\ \\ %-14.(%l,%c%V%)\\ %<%P"
	execute "set statusline=" . l:s1 . l:s2 . l:s3
endfun
set laststatus=2
call <SID>SetStatusLine()

function InsertTabWrapper()
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
	return "\<tab>"
	else
	return "\<c-p>"
	endif
endfunction
imap <tab> <c-r>=InsertTabWrapper()<cr>

set wildmenu " дикое меню :3"

set completeopt=menu,menuone,longest,preview " всплывающая менюшка "
set complete=""
set complete+=.
set complete+=k
set complete+=b
set complete+=t


"  Настройка omnicomletion для Python (а так же для js, html и css)
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"""" добавление новых фич из github.com python-mode

" Disable pylint checking every save
let g:pymode_lint_write = 0

" Set key 'R' for run python code
let g:pymode_run_key = 'R'

" Load show documentation plugin
let g:pymode_doc = 1

" Key for show python documentation
let g:pymode_doc_key = 'K'


"Load rope plugin
let g:pymode_rope = 1

" Auto create and open ropeproject
let g:pymode_rope_auto_project = 1

" Enable autoimport
let g:pymode_rope_enable_autoimport = 1

" Auto generate global cache
let g:pymode_rope_autoimport_generate = 1

let g:pymode_rope_autoimport_underlineds = 0

let g:pymode_rope_codeassist_maxfixes = 10

let g:pymode_rope_sorted_completions = 1

let g:pymode_rope_extended_complete = 1

let g:pymode_rope_autoimport_modules = ["os","shutil","datetime"]

let g:pymode_rope_confirm_saving = 1

let g:pymode_rope_global_prefix = "<C-x>p"

let g:pymode_rope_local_prefix = "<C-c>r"

let g:pymode_rope_vim_completion = 1

let g:pymode_rope_guess_project = 1

let g:pymode_rope_goto_def_newwin = ""

let g:pymode_rope_always_show_complete_menu = 0

" Run python code
" Load run code plugin
let g:pymode_run = 1

" Key for run python code
let g:pymode_run_key = '<leader>r'

" Tabs
" Show Tab line
set showtabline=2
set tabpagemax=15

" NERDTree
" autostart NERDTree and vim - don't need now
"autocmd vimenter * NERDTree /home/evgen/git/

" NERDTree and vim close together
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" F11 - обозреватель файлов NERDTree
map <F11> :NERDTreeToggle<cr>
vmap <F11> <esc>:NERDTreeToggle<cr>i
imap <F11> <esc>:NERDTreeToggle<cr>i

" Posting to Wgetpaste -- need install wgetpaste or pastebin then
" s/wgetpaste/pastebin/ and s/wp/YourCommand(ex. pb)/
:map wp :exec "w !wgetpaste -l Python"<CR>
:vmap wp <ESC>:exec "'<,'>w !wgetpaste -l Python<CR>

" Auto completion via ctrl-space (instead of the nasty ctrl-x ctrl-o)
set omnifunc=pythoncomplete#Complete

" Pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

