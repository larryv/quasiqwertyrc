less_FILES := $(filter-out %lesskey,$(less_FILES))
less_FILES += $(prefix)/.less.colemakerel

$(prefix)/.less.colemakerel: lesskey
	$(quiet)mkdir -p -- "$$(dirname '$@')"
	$(quiet)lesskey --output='$@' '$<'
	@printf '$(if $(quiet),Wrote %s)\n' '$@' >&2
