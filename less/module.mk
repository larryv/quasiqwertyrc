less_files := $(prefix)/.less.colemakerel \
              $(prefix)/.zsh/less.colemakerel.zshrc

$(prefix)/.less.colemakerel: lesskey
	$(quiet)mkdir -p -- "$$(dirname '$@')"
	$(quiet)lesskey --output='$@' '$<'
	@printf '$(if $(quiet),Wrote %s)\n' '$@' >&2
