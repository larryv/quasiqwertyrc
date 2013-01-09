" ========================================================================
" Vim global plugin for remapping commands from Colemak to QWERTY.
"
" Part 3 - Text objects.
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

let s:mapping_textobj = {
            \ 'ap': 'a;',
            \ 'as': 'ar',
            \ 'at': 'ag',
            \ 'ip': 'u;',
            \ 'is': 'ur',
            \ 'it': 'ug',
            \ }

for [rhs, lhs] in items(s:mapping_textobj)
    execute "noremap" lhs rhs
    execute "nunmap" lhs
endfor

unlet s:mapping_textobj
