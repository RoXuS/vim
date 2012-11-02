" Включаем мышку даже в текстовом режиме
set mouse=a
set mousehide "Спрятать курсор мыши когда набираем текст

"Вырубаем режим совместимости с VI:
set nocompatible

"Включаем распознавание типов файлов и типо-специфичные плагины:
filetype on
filetype plugin on

"Настройки табов для Python, согласно рекоммендациям
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab "Ставим табы пробелами
set softtabstop=4 "4 пробела в табе
"Автоотступ
set autoindent
"Подсвечиваем все что можно подсвечивать
let python_highlight_all = 1
"Включаем 256 цветов в терминале, мы ведь работаем из иксов?
"Нужно во многих терминалах, например в gnome-terminal
set t_Co=256
"Колоночка, чтобы показывать плюсики для скрытия блоков кода:
set foldcolumn=1

colorscheme desert256 "Цветовая схема

"Переносим на другую строчку, разрываем строки
set wrap
set linebreak

" Раскладка по умолчанию - английская
"set iminsert=0

set ru
set incsearch " инкруметный поиск по мере набора поисковой фразы regexp included!

"map :tabprevious
"map :tabnext
"map :tabnew
"map :tabclose

"map :mksession! ~/.vim/customSession.vim
"autocmd VimLeavePre * silent mksession! ~/.vim/lastSession.vim

"set nohlsearch
"set hlsearch!

"set si! si? " Быстрое отключение smartinsert на случай вставить из буфера большой текст - что б форматирование не съехало

"set completeopt+=longest " эти опции для автодополнения функций перменных по cntrl-space + создается маленькое окошко сверху для показа определения функции посл набора завершающейся скобки оно закрывается.

syntax on

" переключает кодировку буфера
 menu Encoding.koi8-r :e ++enc=8bit-koi8-r<CR>
 menu Encoding.windows-1251 :e ++enc=8bit-cp1251<CR>
 menu Encoding.ibm-866 :e ++enc=8bit-ibm866<CR>
 menu Encoding.utf-8 :e ++enc=2byte-utf-8 <CR>
 map <F8> :emenu Encoding.<TAB>

 " выбрать, в какой кодировке сохранить файл
 " menu FEnc.cp1251    :set fenc=cp1251<CR>
 " menu FEnc.koi8-r    :set fenc=koi8-r<CR>
 " menu FEnc.cp866     :set fenc=ibm866<CR>
 " menu FEnc.utf-8     :set fenc=utf-8<CR>
 " map  <S-F8> :emenu FEnc.<TAB>

" строка статуса
"set statusline=%<%f%h%m%r%=\ %{&encoding}\ %4lL\ %3cC\ %4P:%L
set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P


" Минимальная высота окна
set winminheight=0

" Минимальная ширина окна
set winminwidth=0

" Всегда отображать статусную строку для каждого окна
set laststatus=2

" Опции автодополнения - включаем только меню с доступными вариантами
" автодополнения (также, например, для omni completion может быть
" окно предварительного просмотра).
set completeopt=menu


set tabstop=4 " Размер табуляции
set autoindent " Копирует отступ от предыдущей строки
set smartindent " Включаем 'умную' автоматическую расстановку отступов
set wrap " Включаем перенос строк
set linebreak " Перенос строк по словам, а не по буквам


" Включаем отображение выполняемой в данный момент команды в правом нижнем
" углу экрана.
" " К примеру, если вы наберете 2d, то в правом нижнем углу экрана Vim
" отобразит строку 2d.
set showcmd

" Включаем подсветку выражения, которое ищется в тексте
set hlsearch
" При поиске перескакивать на найденный текст в процессе набора строки
set incsearch
" Останавливать поиск при достижении конца файла
set nowrapscan
" Игнорировать регистр букв при поиске
set ignorecase

" Отключаем создание бэкапов
set nobackup
" Отключаем создание swap файлов
set noswapfile

" Нумерация строк
set nu

" Список кодировок файлов для автоопределения
set fileencodings=utf-8,cp1251,koi8-r,cp866

"Авто комплит по табу
function InsertTabWrapper()
let col = col('.') - 1
if !col || getline('.')[col - 1] !~ '\k'
return "\"
else
return "\<c-p>"
endif
endfunction
imap <c-r>=InsertTabWrapper()"Показываем все полезные опции автокомплита сразу
set complete=""
set complete+=.
set complete+=k
set complete+=b
set complete+=t

"Перед сохранением вырезаем пробелы на концах (только в .py файлах)
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
"В .py файлах включаем умные отступы после ключевых слов
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
