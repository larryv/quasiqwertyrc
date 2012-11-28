" ========================================================================
" Vim global plugin for remapping commands from Colemak to QWERTY.
"
" Part 0 - Preliminary setup.
"
" Version: 0.1.0
" Last Change: 2012 Nov 27
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

" Use Vim-default cpoptions for consistent behavior of line
" continuations and mappings. Will restore saved cpoptions in the
" epilogue.
let g:CDV_cpoptions_original = &cpoptions
set cpoptions&vim

" Don't let mappings time out, otherwise multi-key mappings have to be
" typed quickly.
set notimeout ttimeout
