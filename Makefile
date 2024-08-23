#
# SPDX-License-Identifier: GPL-3.0-or-later

PREFIX ?= /usr/local
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/displayctl
DATA_DIR=$(DESTDIR)$(PREFIX)/share/displayctl
BIN_DIR=$(DESTDIR)$(PREFIX)/bin

DOC_FILES=$(wildcard *.rst)
SCRIPT_FILES=$(wildcard displayctl/*)

all:

check: shellcheck

shellcheck:
	shellcheck -s bash $(SCRIPT_FILES)

install: install-displayctl install-doc

install-doc:

	install -vDm 644 $(DOC_FILES) -t $(DOC_DIR)

install-displayctl:

	install -vdm 755 "$(BIN_DIR)"
	install -vDm 755 displayctl/displayctl "$(BIN_DIR)"

.PHONY: check install install-doc install-displayctl shellcheck
