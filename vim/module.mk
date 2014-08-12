VIM_HEADER := $(subst \#,\",$(HEADER))
$(prefix)/.vim/% : _vim/%
	@mkdir -p -- "$(dir $@)"
	@printf $(VIM_HEADER) > "$@"
	@sed -E $(SED_SCRIPTS) "$<" >> "$@"
	@printf "Wrote $@\n" >&2
