" ========================================================================
" Vim global plugin for remapping commands from Colemak to QWERTY.
"
" Part 8 - Insert and Command-line mode.
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

let s:mapping_insert = {
            \ '<C-G><C-J>': '<C-D><C-N>',
            \ '<C-G>j': '<C-D>n',
            \ '<C-G><C-K>': '<C-D><C-E>',
            \ '<C-G>k': '<C-D>e',
            \ '<C-G>u': '<C-D>l',
            \ '<C-R><C-R>': '<C-P><C-P>',
            \ '<C-R><C-O>': '<C-P><C-Y>',
            \ '<C-R><C-P>': '<C-P><Leader>;',
            \ }
for [rhs, lhs] in items(s:mapping_insert)
    execute "inoremap" lhs rhs
endfor

let s:mapping_cmdline = {
            \ '<C-R><C-F>': '<C-P><C-T>',
            \ '<C-R><C-P>': '<C-P><C-;>',
            \ '<C-R><C-R>': '<C-P><C-P>',
            \ '<C-R><C-R><C-F>': '<C-P><C-P><C-T>',
            \ '<C-R><C-R><C-P>': '<C-P><C-P><Leader>;',
            \ }
for [rhs, lhs] in items(s:mapping_cmdline)
    execute "cnoremap" lhs rhs
endfor

unlet s:mapping_insert
unlet s:mapping_cmdline
