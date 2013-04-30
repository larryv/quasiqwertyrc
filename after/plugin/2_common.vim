" ========================================================================
" Vim global plugin for remapping commands from Colemak to QWERTY.
"
" Part 2 - All modes.
"
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

let s:mapping_common = {}

" CTRL
call extend(s:mapping_common, {
            \ '<C-;>': '<C-O>',
            \ '<C-D>': '<C-S>',
            \ '<C-E>': '<C-F>',
            \ '<C-F>': '<C-T>',
            \ '<C-G>': '<C-D>',
            \ '<C-I>': '<C-U>',
            \ '<C-J>': '<C-N>',
            \ '<C-K>': '<C-E>',
            \ '<C-L>': '<Leader>i',
            \ '<C-N>': '<C-K>',
            \ '<C-O>': '<C-Y>',
            \ '<C-P>': '<Leader>;',
            \ '<C-R>': '<C-P>',
            \ '<C-S>': '<C-R>',
            \ '<C-T>': '<C-G>',
            \ '<C-U>': '<C-L>',
            \ '<C-Y>': '<C-J>',
            \ })

" CTRL-\
call extend(s:mapping_common, {
            \ '<C-\><C-N>': '<C-\><C-K>',
            \ '<C-\><C-G>': '<C-\><C-D>',
            \ '<C-\>d': '<C-\>s',
            \ '<C-\>e': '<C-\>f',
            \ '<C-\>f': '<C-\>t',
            \ '<C-\>g': '<C-\>d',
            \ '<C-\>i': '<C-\>u',
            \ '<C-\>j': '<C-\>n',
            \ '<C-\>k': '<C-\>e',
            \ '<C-\>l': '<C-\>i',
            \ '<C-\>n': '<C-\>k',
            \ '<C-\>o': '<C-\>y',
            \ '<C-\>p': '<C-\>;',
            \ '<C-\>r': '<C-\>p',
            \ '<C-\>s': '<C-\>r',
            \ '<C-\>t': '<C-\>g',
            \ '<C-\>u': '<C-\>l',
            \ '<C-\>y': '<C-\>j',
            \ })

for [rhs, lhs] in items(s:mapping_common)
    execute "noremap" lhs rhs
    execute "noremap!" lhs rhs
endfor

unlet s:mapping_common
