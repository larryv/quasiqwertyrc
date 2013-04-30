" ========================================================================
" Vim global plugin for remapping commands from Colemak to QWERTY.
"
" Part 3 - Normal, Operator-pending, and Visual+Select modes.
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

let s:mapping_nov = {}

" Punctuation
call extend(s:mapping_nov, {
            \ ':': 'O',
            \ ';': 'o',
            \ '@:': '@O',
            \ })

" Uppercase letters
call extend(s:mapping_nov, {
            \ 'D': 'S',
            \ 'E': 'F',
            \ 'F': 'T',
            \ 'G': 'D',
            \ 'I': 'U',
            \ 'J': 'N',
            \ 'K': 'E',
            \ 'L': 'I',
            \ 'N': 'K',
            \ 'O': 'Y',
            \ 'P': ':',
            \ 'R': 'P',
            \ 'S': 'R',
            \ 'T': 'G',
            \ 'U': 'L',
            \ 'Y': 'J',
            \ })

" Lowercase letters
call extend(s:mapping_nov, {
            \ 'd': 's',
            \ 'dd': 'ss',
            \ 'do': 'sy',
            \ 'dp': 's;',
            \ 'e': 'f',
            \ 'f': 't',
            \ 'g': 'd',
            \ 'i': 'u',
            \ 'j': 'n',
            \ 'k': 'e',
            \ 'l': 'i',
            \ 'n': 'k',
            \ 'o': 'y',
            \ 'p': ';',
            \ 'q:': 'qo',
            \ 'r': 'p',
            \ 's': 'r',
            \ 't': 'g',
            \ 'u': 'l',
            \ 'y': 'j',
            \ 'yy': 'jj',
            \ })

for [rhs, lhs] in items(s:mapping_nov)
    execute "noremap" lhs rhs
    " TODO Figure out Select mode. Seriously, who uses Select mode?
endfor

" These keys map to commands that don't exist in Visual mode, and they
" cause ambiguity with the 's -> d' and 'j -> y' mappings.
let s:mapping_no_visual = ['ss', 'sy', 's;', 'jj']
for lhs in s:mapping_no_visual
    execute "vunmap" lhs
endfor

" There is no 'q:' in operator-pending mode, so this just interferes
" with commands like 'gqq'.
ounmap qo

unlet s:mapping_nov
unlet s:mapping_no_visual
