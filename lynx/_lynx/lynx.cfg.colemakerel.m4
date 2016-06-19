__header__

# -----
# Lynx key remappings for Colemak.
# -----

KEYMAP:s:DOWNLOAD       # d
KEYMAP:f:EDIT           # e
KEYMAP:F:ELGOTO         # E
KEYMAP:t:DIRED_MENU     # f
KEYMAP:d:GOTO           # g
KEYMAP:D:ECGOTO         # G
KEYMAP:u:INDEX          # i
KEYMAP:n:JUMP           # j
KEYMAP:e:KEYMAP         # k
KEYMAP:i:LIST           # l
KEYMAP:k:NEXT           # n
KEYMAP:K:PREV           # N
KEYMAP:y:OPTIONS        # o
KEYMAP:;:PRINT          # p
KEYMAP:p:DEL_BOOKMARK   # r
KEYMAP:r:INDEX_SEARCH   # s
KEYMAP:g:TAG_LINK       # t
KEYMAP:l:PREV_DOC       # u
KEYMAP:^S:ABORT         # ^D
KEYMAP:^F:END           # ^E
KEYMAP:^T:NEXT_PAGE     # ^F
KEYMAP:^N:ACTIVATE      # ^J
KEYMAP:^E:COOKIE_JAR    # ^K
# Skipping ^L because remapping ^I for it would screw up Tab
KEYMAP:^K:DOWN_TWO      # ^N
# Skipping ^P because ^; doesn't send a control code
KEYMAP:^P:RELOAD        # ^R
KEYMAP:^R:TO_CLIPBOARD  # ^S
KEYMAP:^G:TRACE_TOGGLE  # ^T
KEYMAP:^L:NEXT_DOC      # ^U
KEYMAP:O:COMMAND        # :
KEYMAP:o:TRACE_LOG      # ;

m4_ifelse(« vim: set filetype=lynx:»)m4_dnl
