__header__

# The zsh documentation discourages setting environment variables in
# .zprofile or .zlogin (http://zsh.sourceforge.net/Intro/intro_3.html),
# so do it here.

if [[ -o LOGIN ]]
then
    export LESSKEY='__prefix__/__colemakerel__/less'
fi

# vim: set filetype=zsh:
