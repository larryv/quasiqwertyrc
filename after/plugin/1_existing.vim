" ========================================================================
" Vim global plugin for remapping commands from Colemak to QWERTY.
"
" Part 1 - Remap existing mappings.
"
" Maintainer: Lawrence Velázquez <larryv@alum.mit.edu>
" License: GNU General Public License
"
" Copyright © 2013 Lawrence Velázquez
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

if exists('g:loaded_colemakdotvim')
    finish
endif


function s:get_mappings()
    redir => map_output
    execute 'map | map!'
    redir END

    let mappings = filter(split(map_output, '\n'),
                            \ 'v:val != "No mapping found"')
    let all_lhs = map(mappings, 'split(v:val, "", 1)[:1]')
    return map(all_lhs, 'maparg(v:val[1], tr(v:val[0], "!", "i"), 0, 1)')
endfunction


function s:translate_special(special_keystring, fromstr, tostr)
    " TODO Translate special keys appropriately. Currently does not
    " bother, which is incorrect for things like "<C-n>".
    return a:special_keystring
endfunction

function s:translate(keystring, fromstr, tostr)
    " TODO Make more comprehensive.
    let special_pattern = '<.\{-1,}>'
    let atom_pattern = '\(.*\)\(' . special_pattern . '\)\?'

    let translated_str = ''
    for token in split(a:keystring, special_pattern . '\zs')
        let atoms = matchlist(token, atom_pattern)
        let translated_str .= tr(atoms[1], a:fromstr, a:tostr) .
                            \ s:translate_special(atoms[2], a:fromstr, a:tostr)
    endfor
    return translated_str
endfunction


function s:move_mapping(mapping, new_lhs)
    let map_prefix = a:mapping['mode'] == '!' ? '' : a:mapping['mode']
    let map_infix = a:mapping['noremap'] ? 'nore' : ''
    let map_suffix = a:mapping['mode'] == '!' ? '!' : ''
    let map_cmd = map_prefix . map_infix . 'map' . map_suffix

    let map_arg = {}
    let map_arg['silent'] = a:mapping['silent'] ? '<silent>' : ''
    let map_arg['expr'] = a:mapping['expr'] ? '<expr>' : ''
    let map_arg['buffer'] = a:mapping['buffer'] ? '<buffer>' : ''
    let map_arg['script'] = a:mapping['sid'] != 0 ? '<script>' : ''
    let map_args = join(values(map_arg), '')

    let lhs = a:mapping['lhs']
    let rhs = a:mapping['rhs']
endfunction


"let s:kbd_qwerty = ';defgijklnoprstuy'
"let s:kbd_colemak = 'osftduneiky;prglj'
"for s:mapping in s:get_mappings()
"    echo s:mapping
"    let s:new_lhs = s:translate(s:mapping['lhs'], s:kbd_qwerty, s:kbd_colemak)
"    call s:move_mapping(s:mapping, s:new_lhs)
"endfor
