" Pathogen
execute pathogen#infect()

" Colorscheme
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif
try
    colorscheme space-vim-dark 
catch
endtry

" Common
syntax enable
set noswapfile        " Do not create swap files
set number
set relativenumber
set showcmd
set showmatch
set cmdheight=2
set cursorline 
set autoread          " Autoload file changes. You can undo by pressing u.

set backspace=indent,eol,start " Backspace through lines

" Search
set ignorecase
set smartcase
set incsearch         " Start searching before pressing enter

"Formatting
set autoindent        " Auto indentation. To paste use paste mode: :set paste
set wrap              " Wrap long lines
set shiftwidth=4      " Use indents of 4 spaces
set expandtab         " Tabs are spaces, not tabs
set tabstop=4         " An indentation every four columns
set nojoinspaces      " Prevents inserting two spaces after punctuation on a join (J)
set splitright        " Puts new vsplit windows to the right of the current
set splitbelow        " Puts new split windows to the bottom of the current

"Display all characters (use F3 to toggle)
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<

" Plugins settings
" Airline
set laststatus=2
" Gitgutter
set updatetime=250

" Mode toggle
" Toggle paste mode using F5 key
set pastetoggle=<F5> 
" Toggle list char using F3 key
nnoremap <F3> :set list!<CR>

" Custom 'macros'
" Common
inoremap ;f for(int i = 0; i < size; i++) {<Enter>}<Esc>ko<Tab>
inoremap ;i if() {<Enter>}<Esc>kf(ci)
inoremap ;c {<Enter>}<Esc>ko<Tab>

" Latex accented characters
autocmd Filetype tex inoremap è \`e
autocmd Filetype tex inoremap é \'e
autocmd Filetype tex inoremap ò \`o
autocmd Filetype tex inoremap à \`a
autocmd Filetype tex inoremap ù \`u
autocmd Filetype tex inoremap ì \`\i\

" C++ main
autocmd Filetype cpp inoremap ;m int main(int argc, char *argv[]) {<Enter><Enter><Tab>return 0;<Enter><Esc><<i}<Esc>kkko<Tab>

" Java printline
autocmd Filetype java inoremap ;p System.out.println();<Esc>hci) 
" Java exception
autocmd Filetype java inoremap ;e try {<Enter><Enter>} catch (Exception e) {<Enter>System.out.println( e );<Esc>>>o}<Esc><<

