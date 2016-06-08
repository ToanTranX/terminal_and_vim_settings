
" vim-plug (https://github.com/junegunn/vim-plug) settings {{{
" Automatically install vim-plug and run PlugInstall if vim-plug not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'terryma/vim-smooth-scroll'
Plug 'matze/vim-move'
Plug 'tpope/vim-commentary'
Plug 'sickill/vim-pasta'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-vinegar'
Plug 'ervandew/supertab'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'bronson/vim-visual-star-search'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/goyo.vim'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-fugitive'
Plug 'tmhedberg/matchit'
" Plug 'AndrewRadev/splitjoin.vim'
" Plug 'nelstrom/vim-subrip'

Plug 'sts10/vim-mustard'
Plug 'junegunn/seoul256.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-ruby/vim-ruby',          { 'for': ['ruby', 'eruby'] }
Plug 'tpope/vim-rails',            { 'for': ['ruby', 'eruby'] }
Plug 'nelstrom/vim-markdown-folding',{ 'for': 'markdown' }
Plug 'tpope/vim-markdown',         { 'for': 'markdown' }
" Plug 'plasticboy/vim-markdown',    { 'for': 'markdown' }
Plug 'alvan/vim-closetag',         { 'for': ['html','xml', 'xhtml'] }

" not sure which of the following I prefer yet
" Plug 'pangloss/vim-javascript',    { 'for': 'javascript' }
Plug 'jelera/vim-javascript-syntax',    { 'for': 'javascript' }

Plug 'dhruvasagar/vim-table-mode', { 'for': ['csv', 'xls', 'xlsx'] }
Plug 'kana/vim-textobj-user'
Plug 'lucapette/vim-textobj-underscore' | Plug 'kana/vim-textobj-user'
Plug 'jceb/vim-textobj-uri'             | Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'          | Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'            | Plug 'kana/vim-textobj-user'

Plug 'sts10/vim-zipper'
" Plug '~/Documents/code/vim-zipper'

Plug 'sts10/vim-closed-captioning'
" Plug '~/Documents/code/vim-closed-caption'

" All of your Plugins must be added before the following line
call plug#end()
" Some vim-plug commands:
" :PlugInstall - Install plugins
" :PlugUpdate  - Install or update plugins
" :PlugUpgrade - Upgrade vim-plug itself
" }}}

" Set Leader {{{
let mapleader = "\<Space>"
" }}}

"""""""""""""""""""""""""""""""
" Plugin Settings             " {{{
"""""""""""""""""""""""""""""""

" Ctrl- P mapping and two custom split keymappings (https://github.com/kien/ctrlp.vim)
let g:ctrlp_map = '<c-p>'
nnoremap <Leader>s :split<CR><c-w>j<c-p>
nnoremap <Leader>v :vsplit<CR><c-w>l<c-p>

" map control + l to commentary toggle comment for one line or visual
" selection
nmap <C-l> gcc
vmap <C-l> gcgv
imap <C-l> <ESC>gcc

" vim-move set to <C-k> and <C-j>
let g:move_key_modifier = 'C'

" Easier page navigation
nnoremap <C-e> <C-u>
nnoremap <C-u> <C-e>

" git@github.com:terryma/vim-smooth-scroll.git
noremap <silent> <c-e> :call smooth_scroll#up(&scroll, 30, 2)<CR>
"noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 30, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 30, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 30, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 30, 4)<CR>

" https://github.com/justinmk/vim-sneak
" Map Sneak_s using nmap-- not nnoremap. That causes problems
" apparently
nmap <Tab> <Plug>Sneak_s
nmap <S-Tab> <Plug>Sneak_S
vmap <Tab> <Plug>Sneak_s
vmap <S-Tab> <Plug>Sneak_S
" nmap S <Plug>Sneak_S

" Goyo (distraction-free)
let g:goyo_width="80%"
nnoremap <Leader>g :Goyo<CR>
function! s:goyo_enter()
  set scrolloff=999
endfunction
function! s:goyo_leave()
  set scrolloff=5
endfunction


set statusline=%f
set statusline+=\ %h%w%m%r
" set statusline+=%y
set statusline+=%=
" set statusline+=%=%{exists('g:loaded_fugitive')?fugitive#statusline():''}
set statusline+=%-16(%{exists('g:loaded_fugitive')?fugitive#statusline():''}\%)
" set statusline+=%-16(\ %l/%L\%)%P   
set statusline+=\ %P/%L
set statusline+=\ 

" Convert Markdown to HTML 
autocmd FileType markdown nmap <leader>md :%!/usr/local/bin/Markdown.pl --html4tags <CR>

" vim-markdown: enable enable fenced code block syntax highlighting in markdown documents
let g:markdown_fenced_languages = ['html', 'css', 'javascript', 'ruby', 'python', 'bash=sh', 'yaml', 'json', 'vim']

" nmap gx to visually select a URI and then open it in default browser
" see: http://sts10.github.io/blog/2016/02/16/one-solution-to-a-problem-with-vims-gx-command/
nmap gx mxviugx<Esc>`x
" nmap go mxviugx<Esc>`x

" }}}

""""""""""""""""""""""""""""
" NeoVim Specific          " {{{
""""""""""""""""""""""""""""

if has("nvim")
  if $TERM_PROGRAM =~ "iTerm"
    set termguicolors
    " let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif

  " terminal mode remappings
  tnoremap <Space><Space> <C-\><C-n><C-w><C-p>
  tnoremap <Esc><Esc> <C-\><C-n>:q<CR>
  "nnoremap <c-t> <c-w><c-p>:term<CR>
  autocmd BufWinEnter,WinEnter term://* startinsert
  autocmd BufLeave term://* stopinsert

  " for fzf
  " imap <C-f> <plug>(fzf-complete-line)
endif
" }}}

"""""""""""""""""""""""""""""
" Standard Set Up           " {{{ 
"""""""""""""""""""""""""""""

" More colors
if !has('gui_running')
  "set t_Co=256
endif

" Turn syntax highlighting on 
syntax on
" start highlighting from 256 lines backwards
syntax sync minlines=256 

" set font for gui vim
set guifont=DejaVu\ Sans\ Mono:h20
colorscheme mustard
set background=dark

" Display relative line numbers
set relativenumber
" display the absolute line number at the line you're on
" set nu!
set number
" Keep the line number gutter narrow
set numberwidth=2

"autocmd FileType markdown setlocal norelativenumber
"autocmd FileType markdown setlocal nonumber

" Screen scrolls 5 lines in front of the cursor 
set scrolloff=5
set sidescrolloff=3

" show two status lines
set laststatus=2

" if file name is `.gitignore`, be sure to set filetype to text
autocmd BufNewFile,BufReadPost .gitignore set filetype=text

" Be sure to detect *.md files as markdown, rather than Modula-2
" via https://github.com/tpope/vim-markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" recognize files ending in .csv as csv files
autocmd BufNewFile,BufReadPost *.csv set filetype=csv

" if no filetype specified, set ft=markdown (alternative would be text)
autocmd BufEnter * if &filetype == "" | setlocal ft=markdown | endif

" Automatically equalize window sizes when Vim window is resized 
autocmd VimResized * wincmd =

" Open splits below and to the right, the same way you read a page
set splitbelow splitright

" By default don't wrap lines
set nowrap 

" But do wrap on these types of files...
autocmd FileType text setlocal wrap
autocmd FileType html setlocal wrap
autocmd FileType markdown setlocal wrap

" And when Vim does wrap lines, have it break the lines on spaces and punctuation only (http://vim.wikia.com/wiki/Word_wrap_without_line_breaks)
set linebreak

" Save temporary/backup files not in the local directory, but in your ~/.vim
" directory, to keep them out of git repos. 
" Pretty sure you need to mkdir backup, swap, and undo first to make this work
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" show commands as you type them
set sc

" make vim a little speedier
set lazyredraw
set ttyfast

" remember 1000 commands of your history
set history=1000

" specify backspace to work as you'd expect (http://vim.wikia.com/wiki/Backspace_and_delete_problems)
set backspace=2

" set tab as 2 spaces
set expandtab
set tabstop=2
set shiftwidth=2

" tabs are 4 spaces for python files, cuz lol python
autocmd FileType python setlocal tabstop=4
autocmd FileType python setlocal shiftwidth=4

" auto indent
set autoindent
set smartindent 

" turn on the wildmenu cuz everyone says to
set wildmenu
" search characters as they're entered
set incsearch
" don't highlight all search matches
set nohlsearch

" have vim re-load files when they're changed outside of vim
set autoread

" set search case to a good configuration http://vim.wikia.com/wiki/Searching 
set ignorecase
set smartcase

" turn off error bells/sounds
set visualbell

" turn on filetype detection
filetype on
filetype plugin on
filetype indent on

" Delete comment character when joining commented lines
set formatoptions+=j

" folding
" set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
autocmd FileType vim setlocal foldmethod=marker
" thanks to javascript plugin, syntax folding works nicely with javascript
autocmd FileType javascript setlocal foldmethod=syntax

" turn on spell check for markdown files
autocmd FileType markdown setlocal spell spelllang=en_us
" add the spelling dictionary to the end of the list of sources to check for
" auto completion
autocmd FileType markdown setlocal complete+=kspell 

" Turn on auto-complete for various languages
set omnifunc=syntaxcomplete#Complete
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

" }}}

"""""""""""""""""""""""""""""""""
" My Re-Mappings                " {{{
"""""""""""""""""""""""""""""""""

" Quickly open a vertical split of my VIMRC and source my VIMRC
nnoremap <silent> <leader>ev :vs ~/.vimrc<CR>
nnoremap <silent> <leader>sv :so ~/.vimrc<CR>

" Enter gives a new line when in command mode without entering insert mode. Likewise, shift+enter gives a new line
" above the cursor 
"nmap <CR> o<Esc>
nnoremap <S-Enter> o<Esc>

" j and k don't skip over wrapped lines in following FileTypes, unless given a
" count (helpful since I display relative line numbers in these file types)
" (https://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/cliuz1o)
autocmd FileType html nnoremap <expr> j v:count ? 'j' : 'gj'
autocmd FileType html nnoremap <expr> k v:count ? 'k' : 'gk'
autocmd FileType markdown nnoremap <expr> j v:count ? 'j' : 'gj'
autocmd FileType markdown nnoremap <expr> k v:count ? 'k' : 'gk'
autocmd FileType text nnoremap <expr> j v:count ? 'j' : 'gj'
autocmd FileType text nnoremap <expr> k v:count ? 'k' : 'gk'

" H to beginning of line, L to the end
nnoremap H ^
nnoremap L $

" Have the indent commands re-highlight the last visual selection to make
" multiple indentations easier
vnoremap > >gv
vnoremap < <gv

" Make the dot command work as expected in visual mode (via
" https://www.reddit.com/r/vim/comments/3y2mgt/do_you_have_any_minor_customizationsmappings_that/cya0x04)
vnoremap . :norm.<CR>

" allows you to visually select a section and then hit @ to run a macro on all lines
" https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db#.3dcn9prw6
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" In markdown files, Control + a surrounds highlighted text with square
" brackets, then dumps system clipboard contents into parenthesis
autocmd FileType markdown vnoremap <c-a> <Esc>`<i[<Esc>`>la](<Esc>"*]pa)<Esc>

" D deletes to the end of the line, and Y yanks to end of line
nnoremap D d$
nnoremap Y y$

" have x (removes single character) not go into the default registry
nnoremap x "_x
" Make X an operator that removes without placing text in the default registry
nmap X "_d
nmap XX "_dd
vmap X "_d
vmap x "_d

" when changing text, don't put the replaced text into the default registry
nnoremap c "_c
vnoremap c "_c

" 0 is the 'yank register', and the ] formats it to indent you're pasting into. This command does all that with control + p (from http://vimcasts.org/episodes/meet-the-yank-register/)
"nmap <c-p> "0]P

" use leader to interact with the system clipboard {{{
nnoremap <Leader>p "*]p
nnoremap <Leader>P "*]P

nnoremap <Leader>y ma^"*y$`a
nnoremap <Leader>c ^"*c$
nnoremap <Leader>d ^"*d$

vnoremap <Leader>y "*y
vnoremap <Leader>c "*c
vnoremap <Leader>d "*d

" }}}

" place whole file on the system clipboard (and return cursor to where it was)
nmap <Leader>a maggVG"*y`a

" Window management, plus some methods of expanding a window quickly
nnoremap <Leader><Leader> <C-w><C-w>
" nnoremap <Space> <C-w>
nnoremap <Right> <C-w>l
nnoremap <Left> <C-w>h
nnoremap <Up> <C-w>k
nnoremap <Down> <C-w>j
nnoremap <Space>t <C-w>5+
nnoremap <Space>f <C-w>5>

" Allow some of the emacs motions on the vim command line.
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-B> <Left>
cnoremap <C-F> <Right>

" }}}

" Simple re-format for minified Javascript
" command! UnMinify call UnMinify()
function! UnMinify()
    normal mj
    %s/{\ze[^\r\n]/{\r/ge
    " %s/){/) {/ge
    %s/};\?\ze[^\r\n]/\0\r/ge
    %s/;\ze[^\r\n]/;\r/ge
    " %s/[^\s]\zs[=&|]\+\ze[^\s]/ \0 /ge
    normal ggVG=`j
endfunction

autocmd FileType javascript nnoremap <Leader>j :call UnMinify()<CR>
autocmd FileType javascript nnoremap <Leader>k mjggvGJ<Esc>`j

" insert word of the line above
inoremap <C-Y> <C-C>:let @z = @"<CR>mz
      \:exec 'normal!' (col('.')==1 && col('$')==1 ? 'k' : 'kl')<CR>
      \:exec (col('.')==col('$') - 1 ? 'let @" = @_' : 'normal! yw')<CR>
      \`zp:let @" = @z<CR>a

" autocmd BufNewFile,BufReadPost *.srt nnoremap <Leader>J d1kk"_ddk"_ddkPkJT-dt-bxxjddpkJ
" autocmd BufNewFile,BufReadPost *.srt nnoremap <Leader>J 4jo<esc>kd1kk"_ddk"_ddkPkJT-dt-bxxjddpkJmsj"_dd`s
" autocmd BufNewFile,BufReadPost *.srt nnoremap <Leader>K i<cr><cr><esc>3kyy2jp4kyy3jp<C-a>j^2f:lct<space>
