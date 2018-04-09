less_files := $(prefix)/.less.colemakerel \
              $(prefix)/.zsh/less.colemakerel.zshrc

$(prefix)/.less.colemakerel: lesskey
	mkdir -p -- "$$(dirname '$@')"
	lesskey --output='$@' '$<'
