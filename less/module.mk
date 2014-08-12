less_FILES := $(subst lesskey,$(colemakerel)/less,$(less_FILES))

$(prefix)/$(colemakerel)/less: lesskey
	@mkdir -p -- "$(dir $@)"
	@-lesskey --output="$@" "$<" && printf "Wrote $@\n" >&2
