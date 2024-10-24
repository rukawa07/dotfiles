" Description: Keymaps

" <Leader>
let mapleader = ' '

nnoremap <S-C-p> "0p Delete without yank
" nnoremap <leader>d "_d
nnoremap x "_x

" Increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>

" Select all
nnoremap <Leader>a gg<S-v>G

" Delete a word backwards
" nnoremap dw vb"_d

" jjをESCキーに対応
inoremap <silent> jj <ESC>

" Remove search highlight
nnoremap <Esc> :noh<CR>

" Search with extended regex
nnoremap / /\v

" Save with root permission
command! W w !sudo tee > /dev/null %

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" Save and Quit
nnoremap <Leader>s :w<Return>
nnoremap <Leader>q :wq<Return>
nnoremap <Leader>Q :q!<Return>
