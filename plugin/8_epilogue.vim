" ========================================================================
" Vim global plugin for remapping commands from Colemak to QWERTY.
"
" Part 8 - Clean up.
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

" Fix bug with 'Select All' menu item
if exists("did_install_default_menus")
    function <SID>SelectAll()
        execute "normal! gg" . (&slm == "" ? "VG" : "gH\<C-O>G")
    endfunction

    noremenu <silent> &Edit.&Select\ All<Tab>ggVG :<C-U>call <SID>SelectAll()<CR>
    inoremenu <silent> &Edit.&Select\ All<Tab>ggVG <C-O>:call <SID>SelectAll()<CR>
    cnoremenu <silent> &Edit.&Select\ All<Tab>ggVG <C-U>call <SID>SelectAll()<CR>

    noremenu <silent> PopUp.Select\ &All :<C-U>call <SID>SelectAll()<CR>
    inoremenu <silent> PopUp.Select\ &All <C-O>:call <SID>SelectAll()<CR>
    cnoremenu <silent> PopUp.Select\ &All <C-U>call <SID>SelectAll()<CR>
endif

" Clean up after ourselves
unlet lhs rhs

let &cpoptions = g:CDV_cpoptions_original
unlet g:CDV_cpoptions_original

let g:loaded_colemakdotvim = 1
