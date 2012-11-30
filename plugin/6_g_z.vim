" ========================================================================
" Vim global plugin for remapping commands from Colemak to QWERTY.
"
" Part 6 - Commands starting with 'g' or 'z'.
"
" Last Change: 2012 Nov 30
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

let s:mapping_g_z = {}

" g
call extend(s:mapping_g_z, {
            \ 'g<C-G>': 'd<C-D>',
            \ 'g?g?': 'd?d?',
            \ 'gD': 'dS',
            \ 'gE': 'dF',
            \ 'gI': 'dU',
            \ 'gJ': 'dN',
            \ 'gP': 'd:',
            \ 'gR': 'dP',
            \ 'gU': 'dL',
            \ 'gd': 'ds',
            \ 'ge': 'df',
            \ 'gf': 'dt',
            \ 'gF': 'dT',
            \ 'gg': 'dd',
            \ 'gi': 'du',
            \ 'gj': 'dn',
            \ 'gk': 'de',
            \ 'go': 'dy',
            \ 'gp': 'd;',
            \ 'gr': 'dp',
            \ 'gs': 'dr',
            \ 'gu': 'dl',
            \ })

" z
call extend(s:mapping_g_z, {
            \ 'zD': 'zS',
            \ 'zE': 'zF',
            \ 'zF': 'zT',
            \ 'zG': 'zD',
            \ 'zN': 'zK',
            \ 'zO': 'zY',
            \ 'zR': 'zP',
            \ 'zd': 'zs',
            \ 'ze': 'zf',
            \ 'zf': 'zt',
            \ 'zg': 'zd',
            \ 'zi': 'zu',
            \ 'zj': 'zn',
            \ 'zk': 'ze',
            \ 'zl': 'zi',
            \ 'zn': 'zk',
            \ 'zo': 'zy',
            \ 'zr': 'zp',
            \ 'zs': 'zr',
            \ 'zt': 'zg',
            \ })

for [rhs, lhs] in items(s:mapping_g_z)
    execute "noremap" lhs rhs
endfor

unlet s:mapping_g_z
