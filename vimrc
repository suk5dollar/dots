set nocompatible
set guicursor=
syntax on
filetype on
set number
set relativenumber
set expandtab
set shiftwidth=4
set tabstop=4
set nowrap
set hlsearch
set incsearch
set ignorecase
set smartcase
set autoindent
set backspace=indent,eol,start
set textwidth=80
set formatoptions-=t
set nostartofline
set ruler
set title
set clipboard="unamedplus"
set nobackup
set noswapfile
set scrolloff=10
set showcmd
set noshowmode
set history=1000
set colorcolumn=0
set timeoutlen=1000 ttimeoutlen=0
set wildmenu
set wildmode=longest:full,full

let g:netrw_liststyle = 3
let g:netrw_banner = 0

set encoding=utf-8
set spelllang=en_gb
set spellfile=~/.vim/spell/en.utf-8.add
hi clear SpellBad
hi SpellBad term=standout cterm=underline ctermfg=red
hi clear SpellCap
hi SpellCap term=underline cterm=underline
hi clear SpellRare
hi SpellRare term=underline cterm=underline
hi clear SpellLocal
hi SpellLocal term=underline cterm=underline

let g:currentmode={
            \ 'n'       : 'Normal ',
            \ 'no'      : 'N-Operator Pending ',
            \ 'v'       : 'Visual ',
            \ 'V'       : 'V-Line ',
            \ "\<C-V>"  : 'V-Block ',
            \ 's'       : 'Select ',
            \ 'S'       : 'S-Line ',
            \ "\<C-S>"  : 'S-Block ',
            \ 'i'       : 'Insert ',
            \ 'R'       : 'Replace ',
            \ 'Rv'      : 'V-Replace ',
            \ 'c'       : 'Command ',
            \ 'cv'      : 'Vim Ex ',
            \ 'ce'      : 'Ex ',
            \ 'r'       : 'Prompt ',
            \ 'rm'      : 'More ',
            \ 'r?'      : 'Confirm ',
            \ '!'       : 'Shell ',
            \ 't'       : 'Terminal '
            \}

set termguicolors
colorscheme habamax
set background=light
hi Normal guibg=#1e2127
hi Comment guifg=#646f75

augroup CustomStatuslineColors
    autocmd!
    autocmd ColorScheme * call ApplyStatuslineHighlights()
augroup END

function! ApplyStatuslineHighlights()
    hi StatusLine ctermbg=235 ctermfg=245 guibg=#282c34 guifg=#646f75 gui=NONE

    hi User7 ctermbg=236 ctermfg=6 guibg=#282c34 guifg=#56b6c2
    hi User8 ctermbg=236 ctermfg=7 guibg=#282c34 guifg=#646f75
    hi User9 ctermbg=236 ctermfg=7 guibg=#282c34 guifg=#646f75

    hi StNormal  ctermbg=2   ctermfg=0 guibg=#98c379 guifg=#2E3440
    hi StInsert  ctermbg=4   ctermfg=0 guibg=#81A1C1 guifg=#2E3440
    hi StInsert  ctermbg=4   ctermfg=0 guibg=#56b6c2 guifg=#2E3440
    hi StVisual  ctermbg=5   ctermfg=0 guibg=#c678dd guifg=#2E3440
    hi StReplace ctermbg=1   ctermfg=0 guibg=#BF616A guifg=#2E3440
    hi StCommand ctermbg=3   ctermfg=0 guibg=#EBCB8B guifg=#2E3440
    hi StOther   ctermbg=8   ctermfg=0 guibg=#4C566A guifg=#2E3440

    if exists('*ChangeModeColor')
        call ChangeModeColor(mode())
    endif
endfunction

call ApplyStatuslineHighlights()

function! ChangeModeColor(mode)
    if a:mode ==# 'n'
        hi link User1 StNormal
    elseif a:mode ==# 'i'
        hi link User1 StInsert
    elseif a:mode =~# '\v(v|V|\<C-V>)'
        hi link User1 StVisual
   elseif a:mode =~# '\v(R|Rv)'
        hi link User1 StReplace
    elseif a:mode ==# 'c'
        hi link User1 StCommand
    else
        hi link User1 StOther
    endif
endfunction

function! UpdateStatusline()
    call ChangeModeColor(mode())

    set laststatus=2
    let &statusline = '%1* %{toupper(get(g:currentmode, mode(), "Unknown "))}'
    let &statusline .= '%8* [%n]'
    let &statusline .= '%8* %F'
    let &statusline .= '%9* %='
    let &statusline .= '%8* %y'
    let &statusline .= '%7* %{&fileencoding?&fileencoding:&encoding}'
    let &statusline .= '%8*[%{&fileformat}]'
    let &statusline .= '%8* %p%%'
    let &statusline .= '%8* %l:%c'
endfunction

augroup StatusLineModeColor
    autocmd!
    autocmd ModeChanged * call UpdateStatusline()
augroup END
call UpdateStatusline()

hi RedundantWhiteSpace ctermbg=green guibg=green
match RedundantWhiteSpace /\s\+$\| \+ze\t/
autocmd BufWinEnter * match RedundantWhiteSpace /\s\+$\| \+ze\t/

filetype plugin indent on

autocmd BufNewFile,BufReadPre,FileReadPre *.json setlocal filetype=json
autocmd FileType json setlocal sw=2 sts=2 et

autocmd BufNewFile,BufReadPre,FileReadPre *.py setlocal filetype=python
autocmd FileType python setlocal sw=4 sts=4 et

autocmd BufNewFile,BufReadPre,FileReadPre *.md setlocal filetype=markdown
autocmd FileType markdown setlocal sw=4 sts=4 et spell

autocmd BufNewFile,BufReadPre,FileReadPre *.toml setlocal filetype=toml
autocmd FileType toml setlocal sw=2 sts=2 et

autocmd BufNewFile,BufReadPre,FileReadPre *.yaml setlocal filetype=yaml
autocmd FileType yaml setlocal sw=2 sts=2 et

autocmd FileType text setlocal sw=4 sts=4 et spell

noremap <TAB> :bnext<CR>
noremap <S-TAB> :bprevious<CR>




