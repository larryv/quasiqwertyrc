__header__

# -----
# Colemak keybindings for readline
# -----

$if mode=emacs

# Moving
"\C-f":     end-of-line
"\C-t":     forward-char
"\M-t":     forward-word

# History
"\C-k":     next-history
"\C-p":     reverse-search-history
"\C-r":     forward-search-history
"\M-;":     non-incremental-reverse-search-history
"\M-k":     non-incremental-forward-search-history
"\M-\C-j":  yank-nth-arg

# Editing
"\C-s":     delete-char
"\C-g":     transpose-chars
"\M-g":     transpose-words
"\M-l":     upcase-word
"\M-i":     downcase-word

# Killing and yanking
"\C-e":     kill-line
"\C-l":     unix-line-discard
"\M-s":     kill-word
"\C-j":     yank
"\M-j":     yank-pop

# Keyboard macros
"\C-xf":    call-last-kbd-macro

# Misc
"\C-x\C-p": re-read-init-file
"\C-d":     abort
"\C-x\C-l": undo
"\M-p":     revert-line
"\M-\C-n":  vi-editing-mode

# Bash
#
# TODO: Make these conditional somehow? The Scala interpreter throws
# warnings for these.
#
#"\M-\C-f":  shell-expand-line
#"\C-y":     operate-and-get-next
#"\C-x\C-f": edit-and-execute-command
#"\M-d":     glob-complete-word
#"\C-xd":    glob-list-expansions

$endif

# vim: set filetype=readline: