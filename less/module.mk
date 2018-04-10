less_generated_files := less/_zsh/less.colemakerel.zshrc \
                        less/_less.colemakerel
less_files := $(less_generated_files)

less/_less.colemakerel: less/lesskey
	lesskey --output=$@ $<
