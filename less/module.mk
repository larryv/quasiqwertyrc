less_clean_files := less/_zsh/less.colemakrc.zshrc
less_maintclean_files := less/_less.colemakrc
less_files := $(less_clean_files) $(less_maintclean_files)

less/_less.colemakrc: less/lesskey
	lesskey --output=$@ $<
