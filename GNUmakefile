# Flotsam and jetsam.
.DELETE_ON_ERROR:
.NOTPARALLEL:           # mkdir -p may cause race conditions.
.SECONDEXPANSION:
.SUFFIXES:

# External programs.
SHELL := /bin/sh
M4 := m4

# Quote strings for injection between POSIX shell single quotes
# (http://www.etalabs.net/sh_tricks.html, § "Shell-quoting arbitrary
# strings"). Variables should be passed using the "value" function to
# prevent '$' characters from being evaluated.
shellquote = $(subst ','\'',$(1))

# Template parameters.
prefix := $(wildcard ~)
quoted_prefix := $(call shellquote,$(value prefix))
macros := prefix

# The repository's child directories are "modules", containing "slices"
# of the final directory tree. These are "layered" during installation.
MODULES := less lynx readline tmux vim zsh

# Transform repository pathnames into installation pathnames by replacing
# leading underscores with dots and removing the prefixed module name.
installpath = $(foreach f,$(subst /_,/.,$(1)),$(patsubst $(firstword $(subst /, ,$(f)))/%,%,$(f)))

# The _*-install targets repeat this command once for each file. Store
# it in a variable to preserve the trailing newline, or else the
# repetition erroneously produces one very long command.
define installcmd
cp $(1) '$(quoted_prefix)/$(call installpath,$(1))'

endef

# Generate per-module targets and prerequisites. For example:
#   - "make vim": create Vim-related files
#   - "make vim-install": install Vim-related files
#   - "make vim-uninstall": uninstall Vim-related files
#   - "make" / "make all": create all files
#   - "make install": install all files
#   - "make uninstall": uninstall all files

define load_module
# Remove "./" so the installdirs targets don't try to create it.
$(1)_dirs = $$(filter-out ./,$$(sort $$(dir $$(call installpath,$$($(1)_files)))))

# Modules can augment these dummy targets.
.PHONY: $(1) $$(addprefix $(1)-,clean installdirs install uninstall)
$(1): $$$$($(1)_files)
$(1)-clean: _$(1)-clean
$(1)-installdirs: _$(1)-installdirs
$(1)-install: _$(1)-install
$(1)-uninstall: _$(1)-uninstall

# Helper targets that do the real work.
.PHONY: $$(addprefix _$(1)-,clean installdirs install uninstall)
_$(1)-clean:
	$$(if $$($(1)_generated_files),$$(RM) $$($(1)_generated_files))
# TODO: Remove unnecessary directories from installdirs.
_$(1)-installdirs:
	$$(if $$($(1)_dirs),cd -- '$$(quoted_prefix)' && mkdir -p $$($(1)_dirs))
_$(1)-install: $(1) $(1)-installdirs
	$$(foreach f,$$($(1)_files),$$(call installcmd,$$(f)))
_$(1)-uninstall:
	cd -- '$$(quoted_prefix)' && $$(RM) $$(call installpath,$$($(1)_files))
endef

$(foreach module,$(MODULES),$(eval $(call load_module,$(module))))

# Let modules alter the install process.
include $(addsuffix /module.mk,$(MODULES))

.PHONY: all clean installdirs install uninstall
.DEFAULT_GOAL := all
all: $(MODULES)
clean: $(addsuffix -clean,$(MODULES))
installdirs: $(addsuffix -installdirs,$(MODULES))
install: $(addsuffix -install,$(MODULES))
uninstall: $(addsuffix -uninstall,$(MODULES))

# Generate the command-line macro definitions.
defines := $(foreach macro,$(macros),-D __$(macro)__='$($(macro))')

% :: common.m4 $$@.m4
	$(M4) $(defines) $^ >$@
