less_files := $(filter-out %lesskey,$(less_files))
less_files += $(prefix)/.less.colemakerel

$(prefix)/.less.colemakerel: lesskey
	$(quiet)mkdir -p -- "$$(dirname '$@')"
	$(quiet)lesskey --output='$@' '$<'
	@printf '$(if $(quiet),Wrote %s)\n' '$@' >&2
