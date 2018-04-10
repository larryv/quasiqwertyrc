# Flotsam and jetsam.
.DELETE_ON_ERROR:
.NOTPARALLEL:           # mkdir -p may cause race conditions.
.SECONDEXPANSION:
.SUFFIXES:

# External programs.
SHELL := /bin/sh

ifeq ($(or $(VERBOSE),0),0)
    quiet := @
endif

# Template parameters.
prefix := $(wildcard ~)
macros := prefix

# The repository's child directories are "modules", containing "slices"
# of the final directory tree. These are "layered" during installation.
VPATH := less lynx readline tmux vim zsh

# Generate per-module targets and prerequisites. For example:
#   - "make vim" / "make vim-install": install Vim-related files
#   - "make vim-uninstall": uninstall Vim-related files
#   - "make install": install all files
#   - "make uninstall": uninstall all files

.PHONY: install uninstall
install: $(addsuffix -install,$(VPATH))
uninstall: $(addsuffix -uninstall,$(VPATH))

define load_module
.PHONY: $(1) $(1)-install $(1)-uninstall
$(1) $(1)-install: $$$$($(1)_files)
$(1)-uninstall:
	rm -fR $$($(1)_files)
endef

$(foreach module,$(VPATH),$(eval $(call load_module,$(module))))

# Let modules alter the install process.
include $(addsuffix /module.mk,$(VPATH))

# Generate the command-line macro definitions.
defines := $(foreach macro,$(macros),-D __$(macro)__='$($(macro))')

src = $(patsubst .%,_%,$(subst /.,/_,$*)).m4
$(prefix)/% : $$(src) common.m4
	$(quiet)mkdir -p -- "$$(dirname '$@')"
	$(quiet)'$(or $(M4),m4)' -P $(defines) common.m4 '$<' > '$@'
	@printf '$(if $(quiet),Wrote %s)\n' '$@' >&2
