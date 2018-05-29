[[ -o LOGIN ]] || return 0

# ZLE configuration
# -----

bindkey -N emacs_colemak emacs
bindkey -A emacs_colemak main

# Movement
bindkey '^F' end-of-line            # ^E
bindkey '^T' forward-char           # ^F
bindkey '^X^T' vi-find-next-char    # ^X^F
bindkey '\eT' forward-word          # ESC-F
bindkey '\et' forward-word          # ESC-f

# History
bindkey '^K' down-line-or-history                   # ^N
bindkey '^P' history-incremental-search-backward    # ^R
bindkey '^Xp' history-incremental-search-backward   # ^Xr
bindkey '^R' history-incremental-search-forward     # ^S
bindkey '^Xr' history-incremental-search-forward    # ^Xs
bindkey '\e:' history-search-backward               # ESC-P
bindkey '\e;' history-search-backward               # ESC-p
bindkey '\eK' history-search-forward                # ESC-N
bindkey '\ek' history-search-forward                # ESC-n
bindkey '^X^K' infer-next-history                   # ^X^N

# Modifying
bindkey '\eI' down-case-word        # ESC-L
bindkey '\ei' down-case-word        # ESC-l
bindkey '\eS' kill-word             # ESC-D
bindkey '\es' kill-word             # ESC-d
bindkey '^X^N' vi-join              # ^X^J
bindkey '^E' kill-line              # ^K
bindkey '^X^E' kill-buffer          # ^X^K
bindkey '^L' kill-whole-line        # ^U
bindkey '^X^Y' overwrite-mode       # ^X^O
bindkey '\e^U' self-insert-unmeta   # ESC-^I
bindkey '\e^N' self-insert-unmeta   # ESC-^J
bindkey '^G' transpose-chars        # ^T
bindkey '\eG' transpose-words       # ESC-T
bindkey '\eg' transpose-words       # ESC-t
bindkey '\eL' up-case-word          # ESC-U
bindkey '\el' up-case-word          # ESC-u
bindkey '^J' yank                   # ^Y
bindkey '\ej' yank-pop              # ESC-y

# Completion
bindkey '^S' delete-char-or-list    # ^D
bindkey '\e^S' list-choices         # ESC-^D
bindkey '^Xd' list-expand           # ^Xg
bindkey '^XD' list-expand           # ^XG

# Miscellaneous
bindkey '^N' accept-line                    # ^J
bindkey '^Y' accept-line-and-down-history   # ^O
bindkey '\eD' get-line                      # ESC-G
bindkey '\ed' get-line                      # ESC-g
bindkey '^D' send-break                     # ^G
bindkey '\e^D' send-break                   # ESC-^G
bindkey '\eR' spell-word                    # ESC-S
bindkey '\er' spell-word                    # ESC-s
bindkey '^Xl' undo                          # ^Xu
bindkey '^X^L' undo                         # ^X^U
