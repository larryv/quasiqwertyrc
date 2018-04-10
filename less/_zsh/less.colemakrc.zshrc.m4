[[ -o LOGIN ]] || return 0

# The zsh documentation discourages setting environment variables from
# .zprofile or .zlogin (http://zsh.sourceforge.net/Intro/intro_3.html),
# so do it here.

export LESSKEY='printenv(«quoted_prefix»)/.less.colemakrc'

# vim: set filetype=zsh:
