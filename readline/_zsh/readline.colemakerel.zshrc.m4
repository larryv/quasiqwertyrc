[[ -o LOGIN ]] || return 0

# The zsh documentation discourages setting environment variables from
# .zprofile or .zlogin (http://zsh.sourceforge.net/Intro/intro_3.html),
# so do it here.

export INPUTRC='printenv(«quoted_prefix»)/.inputrc.colemakerel'

# vim: set filetype=zsh:
