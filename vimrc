autocmd! bufwritepost .vimrc source %

" Set custop map leader to ','
let mapleader = ","

" открыть кончиг .vimrc
map ,vv :tabnew $MYVIMRC<CR> 

" Drop hightlight search result
" noremap <leader><space> :nohls <CR>
noremap <C-h>  :nohls<CR>
vnoremap <C-h> :nohls<CR>
inoremap <C-h> :nohls<CR>


""" Tab navigation
" tabnext
"noremap <C-n>  :tabnext<CR>
"vnoremap <C-n> :tabnext<CR>
"inoremap <C-n> :tabnext<CR>
" tabprevious
"noremap <C-m>  :tabprevious<CR>
"vnoremap <C-m> :tabprevious<CR>
"inoremap <C-m> :tabprevious<CR>

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

set wildmenu " дикое меню :3"

"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menu,menuone,longest ",preview " всплывающая менюшка "
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

"""" Close tags
"""" Triggered when you type </
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1

autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim


"""" добавление новых фич из github.com python-mode

" Disable pylint checking every save
let g:pymode_lint_write = 0

" Set key 'R' for run python code
" let g:pymode_run_key = 'R'

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
let g:pymode_run = 0

" Key for run python code
let g:pymode_run_key = '<leader>r'

" SuperTab plugin
let g:SuperTabDefaultCompletionType = "context"

" VimTabs
" Show Tab line
set showtabline=2
set tabpagemax=15


""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""" NERDTree """"""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""

" autostart NERDTree and vim - don't need now
"autocmd vimenter * NERDTree /home/evgen/git/

" NERDTree and vim close together
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" F11 - обозреватель файлов NERDTree
map <F11> :NERDTreeToggle<cr>
vmap <F11> <esc>:NERDTreeToggle<cr>i
imap <F11> <esc>:NERDTreeToggle<cr>i

" F10 - TagBar
map <F10> :TagbarToggle<cr>
vmap <F10> <esc>:TagbarToggle<cr>
imap <F10> <esc>:TagbarToggle<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""

" End key == Ctrl+e
" for delimitMate
imap <C-e> <End>


""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""" WgetPaste """""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""

" Posting to Wgetpaste -- need install wgetpaste or pastebin then
" s/wgetpaste/pastebin/ and s/wp/YourCommand(ex. pb)/
:map wp :exec "w !wgetpaste -l Python"<CR>
:vmap wp <ESC>:exec "'<,'>w !wgetpaste -l Python<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""" Pathgen """""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
call pathogen#infect()
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""

" TagBar
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>

" For working Git plugin
set modifiable
set write

" Python Imports
let g:PythonAutoAddImports = 1

" Better copy & paste 
set pastetoggle=<F2>
"
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<cr>
"

""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""" VimWiki """""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""
" VimWiki
let g:vimwiki_folding = 1
let g:vimwiki_fold_lists = 1
let g:vimwiki_list = [
        \ {"path" : "~/Dropbox/wiki"},
\ ]

""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""

" Settings vim-powerline
set timeout timeoutlen=500 ttimeoutlen=50
set laststatus=2

" Easier switch tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" moving of code blocks
vnoremap < <gv
vnoremap > >gv

" Useful settings
set history=700
set undolevels=700


" Change color scheme by day time
" JUST FOR FUN
" let dayBegin = 10
" let dayScheme = "pyte" " day name scheme
" let nightBegin = 19
" let nightScheme = "rdark" " night name scheme
" let currentTime = str2nr(strftime("%H"))
"
" if currentTime < nightBegin && currentTime < dayBegin
"   silent execute "colorscheme " . nightScheme
" elseif currentTime > nightBegin && currentTime > dayBegin
"   silent execute "colorscheme " . nightScheme
" else
"   silent execute "colorscheme " . dayScheme
" endif"
"


"""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""" Indent-Guides """""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
set ts=4 sw=4 et
let g:indent_guides_start_level=1
let g:indent_guides_guide_size=1
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""" Tabular """""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""
if exists(":Tabularize")
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:<CR>
    vmap <Leader>a: :Tabularize /:<CR>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""
