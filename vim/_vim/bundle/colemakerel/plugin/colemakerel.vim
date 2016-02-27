" ######################################################################
" Vim global plugin for emulating QWERTY command keystrokes with
" a Colemak keyboard layout.
"
" Last Change: 25 February 2016
" Maintainer: Lawrence Velázquez <vq@larryv.me>
" License: BSD 3-Clause License
"
" Copyright © 2014–2016 Lawrence Velázquez
" All rights reserved.
"
" Redistribution and use in source and binary forms, with or without
" modification, are permitted provided that the following conditions are
" met:
"
" * Redistributions of source code must retain the above copyright
"   notice, this list of conditions and the following disclaimer.
"
" * Redistributions in binary form must reproduce the above copyright
"   notice, this list of conditions and the following disclaimer in the
"   documentation and/or other materials provided with the distribution.
"
" * Neither the name of Colemakerel nor the names of its contributors
"   may be used to endorse or promote products derived from this
"   software without specific prior written permission.
"
" THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
" 'AS IS' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
" LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
" A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
" HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
" SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
" LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
" DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
" THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
" (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
" OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
" ######################################################################


" Emulate the improved has() introduced by 7.4.237.
function s:has_patch(patchstr)
    let [major, minor, patch] = split(a:patchstr, '\.')
    let vers = major * 100 + minor
    return v:version > vers || v:version == vers && has('patch' . patch)
endfunction

" Patches 7.4.552 and 7.4.773 broke the interaction between langmap and
" mappings in Insert and Command-line modes. I'm not currently able to test
" a langmap-enabled Vim lacking these patches, so require them for now.
if !has("langmap") ||
            \ !s:has_patch('7.4.552') ||
            \ !s:has_patch('7.4.773') ||
            \ exists("g:loaded_colemakerel")
    finish
endif

let s:cpo_original = &cpoptions
set cpoptions&vim


" ##### KEYSTROKE EMULATION ############################################

" Keys are Colemak; values are QWERTY.
let s:conversion = {
            \ 's': 'd', 'S': 'D',
            \ 'f': 'e', 'F': 'E',
            \ 't': 'f', 'T': 'F',
            \ 'd': 'g', 'D': 'G',
            \ 'u': 'i', 'U': 'I',
            \ 'n': 'j', 'N': 'J',
            \ 'e': 'k', 'E': 'K',
            \ 'i': 'l', 'I': 'L',
            \ 'k': 'n', 'K': 'N',
            \ 'y': 'o', 'Y': 'O',
            \ ';': 'p', ':': 'P',
            \ 'p': 'r', 'P': 'R',
            \ 'r': 's', 'R': 'S',
            \ 'g': 't', 'G': 'T',
            \ 'l': 'u', 'L': 'U',
            \ 'j': 'y', 'J': 'Y',
            \ 'o': ';', 'O': ':'
            \ }


" ##### LANGMAP ########################################################

let s:langmap = copy(s:conversion)

" Langmap treats semicolons specially.
unlet s:langmap[';']
unlet s:langmap['o']
let s:langmap['\;'] = 'p'
let s:langmap['o'] = '\;'

" Add C0 control characters.
" TODO: Make CTRL-O (\u000F) do nothing.
let s:langmap["\u0013"] = "\u0004"    " CTRL-S -> CTRL-D
let s:langmap["\u0006"] = "\u0005"    " CTRL-F -> CTRL-E
let s:langmap["\u0014"] = "\u0006"    " CTRL-T -> CTRL-F
let s:langmap["\u0004"] = "\u0007"    " CTRL-D -> CTRL-G
let s:langmap["\u0015"] = "\u0009"    " CTRL-U -> CTRL-I
let s:langmap["\u000E"] = "\u000A"    " CTRL-N -> CTRL-J
let s:langmap["\u0005"] = "\u000B"    " CTRL-E -> CTRL-K
let s:langmap["\u000B"] = "\u000E"    " CTRL-K -> CTRL-N
let s:langmap["\u0019"] = "\u000F"    " CTRL-Y -> CTRL-O
let s:langmap["\u0010"] = "\u0012"    " CTRL-P -> CTRL-R
let s:langmap["\u0012"] = "\u0013"    " CTRL-R -> CTRL-S
let s:langmap["\u0007"] = "\u0014"    " CTRL-G -> CTRL-T
let s:langmap["\u000C"] = "\u0015"    " CTRL-L -> CTRL-U
let s:langmap["\u000A"] = "\u0019"    " CTRL-J -> CTRL-Y

" Construct langmap-appropriate string from the dictionary.
let &langmap = join(values(map(s:langmap, 'v:key . v:val')), ',')

unlet s:langmap


" ##### MAPPINGS #######################################################

" The langmap option doesn't apply in Insert and Command-line modes, but
" it should apply to the left-hand side of mappings in those modes, so
" mapping the desired target keys to themselves ought to work. And it
" almost does, except that Vim erroneously does NOT apply langmap to the
" first character of the left-hand side, thanks to patches 7.4.552 and
" 7.4.773.

let s:lowercase = filter(copy(s:conversion), 'v:key =~ ''^\l$''')
for [s:key, s:val] in items(s:lowercase)
    execute printf('inoremap <C-D>%S <C-G>%S', s:val, s:val) | " CTRL-G combos
    execute printf('cnoremap <C-\>%S <C-\>%S', s:val, s:val) | " CTRL-\ combos
endfor

let s:ctrl = {}
for [s:key, s:val] in items(s:lowercase)
    let s:ctrl['<C-' . s:key . '>'] = '<C-' . s:val . '>'
endfor

" Don't remap CTRL-I because doing so interferes with the Tab key.
unlet s:ctrl['<C-i>']

for [s:key, s:val] in items(s:ctrl)
    " Single-chord
    execute printf('inoremap %S %S', s:key, s:val)
    execute printf('cnoremap %S %S', s:key, s:val)
    " CTRL-G combos
    execute printf('inoremap <C-D>%S <C-G>%S', s:val, s:val)
    " CTRL-R combos
    execute printf('cnoremap <C-P>%S <C-R>%S', s:val, s:val)
    execute printf('cnoremap <C-P><C-R>%S <C-R><C-R>%S', s:val, s:val)
    " CTRL-\ combos
    execute printf('inoremap <C-\>%S <C-\>%S', s:val, s:val)
    execute printf('cnoremap <C-\>%S <C-\>%S', s:val, s:val)
endfor

" Approximate CTRL-L, sometimes.
" TODO: Emulate in other modes and in other key chords.
" NOTE: Don't bother doing this in Insert mode because it makes it
"   a pain to type '\i' (e.g., LaTeX's '\item').
nnoremap <Leader>l Oredraw!<CR>

" Replace CTRL-P with <Leader>p because there's no CTRL-; to remap.
noremap! <Leader>p <C-P>
noremap! <C-P><Leader>p <C-R><C-P>
cnoremap <C-P><C-R><Leader>p <C-R><C-R><C-P>

unlet s:lowercase
unlet s:ctrl
unlet s:key
unlet s:val


" ##### CLEANUP ########################################################

delfunction s:has_patch
unlet s:conversion

let &cpoptions = s:cpo_original
unlet s:cpo_original

" Disable menus because langmap breaks them by undesirably mapping ':'
" to 'P' in menu commands. Oops.
let did_install_default_menus = 1
let did_install_syntax_menu = 1

let g:loaded_colemakerel = 1
