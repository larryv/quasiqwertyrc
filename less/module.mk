less_generated_files := less/_zsh/less.colemakrc.zshrc \
                        less/_less.colemakrc
less_files := $(less_generated_files)

less/_less.colemakrc: less/lesskey
	lesskey --output=$@ $<
