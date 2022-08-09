if !exists('g:loaded_nerd_comments') | finish | endif

"change leader
let mapleader = ";"

" change delimiters of html
let g:NERDCustomDelimiters = { 'html': { 'left': '<!-- ','right': ' -->' } }
let g:NERDCustomDelimiters = { 'htmldjango': { 'left': '<!-- ','right': ' -->' } }
