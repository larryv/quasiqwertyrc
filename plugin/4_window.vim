" ========================================================================
" Vim global plugin for remapping commands from Colemak to QWERTY.
"
" Part 4 - Window commands.
"
" Last Change: 2012 Dec 6
" Maintainer: Lawrence Velázquez <larryv@alum.mit.edu>
" License: GNU General Public License
"
" Copyright © 2012 Lawrence Velázquez
"
" This file is part of Colemak.vim.
" 
" Colemak.vim is free software: you can redistribute it and/or modify it
" under the terms of the GNU General Public License as published by the
" Free Software Foundation, either version 3 of the License, or (at your
" option) any later version.
" 
" Colemak.vim is distributed in the hope that it will be useful, but
" WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
" General Public License for more details.
" 
" You should have received a copy of the GNU General Public License
" along with Colemak.vim.  If not, see <http://www.gnu.org/licenses/>.
" ========================================================================

if exists("g:loaded_colemakdotvim")
    finish
endif

let s:mapping_window = {}

" Double-CTRL
call extend(s:mapping_window, {
            \ '<C-W><C-D>': '<C-W><C-S>',
            \ '<C-W><C-F>': '<C-W><C-T>',
            \ '<C-W><C-G>': '<C-W><C-D>',
            \ '<C-W><C-I>': '<C-W><C-U>',
            \ '<C-W><C-J>': '<C-W><C-N>',
            \ '<C-W><C-K>': '<C-W><C-E>',
            \ '<C-W><C-L>': '<C-W><Leader>i',
            \ '<C-W><C-N>': '<C-W><C-K>',
            \ '<C-W><C-O>': '<C-W><C-Y>',
            \ '<C-W><C-P>': '<C-W><Leader>;',
            \ '<C-W><C-R>': '<C-W><C-P>',
            \ '<C-W><C-S>': '<C-W><C-R>',
            \ '<C-W><C-T>': '<C-W><C-G>',
            \ })

" Uppercase
call extend(s:mapping_window, {
            \ '<C-W>F': '<C-W>T',
            \ '<C-W>J': '<C-W>N',
            \ '<C-W>K': '<C-W>E',
            \ '<C-W>L': '<C-W>I',
            \ '<C-W>P': '<C-W>:',
            \ '<C-W>R': '<C-W>P',
            \ '<C-W>S': '<C-W>R',
            \ '<C-W>T': '<C-W>G',
            \ })

" Lowercase
call extend(s:mapping_window, {
            \ '<C-W>d': '<C-W>s',
            \ '<C-W>f': '<C-W>t',
            \ '<C-W>gF': '<C-W>dT',
            \ '<C-W>i': '<C-W>u',
            \ '<C-W>j': '<C-W>n',
            \ '<C-W>k': '<C-W>e',
            \ '<C-W>l': '<C-W>i',
            \ '<C-W>n': '<C-W>k',
            \ '<C-W>o': '<C-W>y',
            \ '<C-W>p': '<C-W>;',
            \ '<C-W>r': '<C-W>p',
            \ '<C-W>s': '<C-W>r',
            \ '<C-W>t': '<C-W>g',
            \ })

for [rhs, lhs] in items(s:mapping_window)
    execute "noremap" lhs rhs
endfor

unlet s:mapping_window
