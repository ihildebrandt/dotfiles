call pathogen#infect()
call pathogen#helptags()

let mapleader="'"
imap jj <Esc>

set nocompatible
set nu
set hidden
set nobackup
set hlsearch
set incsearch

map <up> <C-W>+
map <down> <C-W>-
map <left> <C-W><
map <right> <C-W>>

set history=1000
set undolevels=1000
set title
set visualbell
set noerrorbells

set modeline
set ls=2
set scrolloff=3

set nowrap

set colorcolumn=80
set ts=2
set sts=2
set sw=2
set ai

set filetype=on
filetype plugin on
filetype indent on

autocmd Filetype nim setlocal ts=2 sts=2 sw=2 et
autocmd Filetype py setlocal ts=4 sts=4 sw=4 et

syntax enable

hi ColorColumn ctermbg=lightred guibg=lightred

map <Leader>w <C-W>w
map <Leader>j <C-W>w
map <Leader>s <C-W>s
map <Leader>v <C-W>v
map <Leader>o <C-W>o

"""""""""""""""""""
" NeoComplete setup
"""""""""""""""""""
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_min_keyword_length = 3

" CR completion
inoremap <silent> <CR> <C-r>=<SID>_cr()<CR>
	function! s:_cr()
		return neocomplcache#smart_close_popup() . "\<CR>"
	endfunction

" Tab completion
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()

inoremap <expr><C-k> pumvisible() ? "\<up>" : "\<C-k>"
inoremap <expr><C-j> pumvisible() ? "\<down>" : "\<C-j>"
" inoremap <expr><TAB> pumvisible() ? neocomplcache#close_popup() : "\<TAB>"

""""""""""""""""""
" NeoSnippet setup 
""""""""""""""""""
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/snippets'

imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
	\"\<Plug>(neosnippet_expand_or_jump)"
	\: pumvisible() ? neocomplcache#close_popup() : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
	\"\<Plug>(neosnippet_expand_or_jump)"
	\: pumvisible() ? neocomplcache#close_popup() : "\<TAB>"

if has('conceal')
	set conceallevel=0 concealcursor=i
endif

" Global variables
let g:snips_author="P. Isaac Hildebrandt"
let g:snips_email="isaac@pihimedia.com"

""""""""""""""""
" NERDTree setup
""""""""""""""""
map <Leader>t :NERDTreeToggle<CR>

"""""""""""""""""
" Syntastic setup
"""""""""""""""""
let g:syntastic_php_checkers=['php']

"""""""""""""""""""
" Local VIMRC setup
"""""""""""""""""""
let g:local_vimrc = {'names':['local.vimrc']}

""""""""""""""""""""""""""""
" Lookup function for nimrod
""""""""""""""""""""""""""""
fun! JumpToDef()
	if exists("*GotoDefinition_" . &filetype)
		call GotoDefinition_{&filetype}()
	else
		exe "norm! \<C-]>"
	endif
endf

nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i
