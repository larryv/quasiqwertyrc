less_FILES := $(subst lesskey,$(colemakerel)/less,$(less_FILES))

$(prefix)/$(colemakerel)/less: lesskey
	$(quiet)mkdir -p -- "$$(dirname '$@')"
	$(quiet)lesskey --output='$@' '$<'
	@printf '$(if $(quiet),Wrote %s)\n' '$@' >&2
