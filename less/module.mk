less_files := less/_less.colemakerel \
              less/_zsh/less.colemakerel.zshrc

less/_less.colemakerel: less/lesskey
	lesskey --output=$@ $<
