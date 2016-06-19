ifeq ($(or $(VERBOSE),0),0)
    quiet := @
endif

# Template parameters.
prefix := $(wildcard ~)
macros := prefix

# Flotsam and jetsam.
SHELL := /bin/sh
.DELETE_ON_ERROR:
.NOTPARALLEL:       # mkdir -p may cause race conditions
.SECONDEXPANSION:
.SUFFIXES:

# Treat each child directory listed in VPATH as a "module". Generate
# per-module targets and prerequisites based on directory contents.
# For example:
# - "make vim" / "make vim-install": install Vim-related files
# - "make vim-uninstall": delete Vim-related files
# - "make install": install all files
# - "make uninstall": delete all files

VPATH := less lynx readline tmux vim zsh

.PHONY: install uninstall
install: $(addsuffix -install,$(VPATH))
uninstall: $(addsuffix -uninstall,$(VPATH))

define load_module
$(1)_FILES := $$(shell find $(1) -type f ! \( -name module.mk -o \
                                              -name '*.sw?' -o \
                                              -name '*~' \))
$(1)_FILES := $$(subst /_,/.,$$($(1)_FILES))
$(1)_FILES := $$(patsubst $(1)%.m4,$$(prefix)%,$$($(1)_FILES))

.PHONY: $(1) $(1)-install $(1)-uninstall
$(1) $(1)-install: $$$$($(1)_FILES)
$(1)-uninstall:
	rm -fR $$($(1)_FILES)
endef

$(foreach module,$(VPATH),$(eval $(call load_module,$(module))))

# Modules can use submakefiles to define their own macros and whatnot.
sinclude $(addsuffix /module.mk,$(VPATH))

# Generate the M4 command-line definitions.
defines := $(foreach macro,$(macros),-D __$(macro)__='$($(macro))')

src = $(patsubst .%,_%,$(subst /.,/_,$*)).m4
$(prefix)/% : $$(src) common.m4
	$(quiet)mkdir -p -- "$$(dirname '$@')"
	$(quiet)'$(or $(M4),m4)' -P $(defines) common.m4 '$<' > '$@'
	@printf '$(if $(quiet),Wrote %s)\n' '$@' >&2
