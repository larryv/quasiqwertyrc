__header__

# The zsh documentation discourages setting environment variables in
# .zprofile or .zlogin (http://zsh.sourceforge.net/Intro/intro_3.html),
# so do it here.

if [[ -o LOGIN ]]
then
    export INPUTRC='__prefix__/__colemakerel__/inputrc'
fi

# vim: set filetype=zsh:
