PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin

.PHONY: help install uninstall test

help:
	@echo "Targets:"
	@echo "  make install      Install gsb to $(BINDIR)"
	@echo "  make uninstall    Remove gsb from $(BINDIR)"
	@echo "  make test         Run basic smoke checks"

install:
	install -d "$(DESTDIR)$(BINDIR)"
	install -m 0755 scripts/gsb "$(DESTDIR)$(BINDIR)/gsb"

uninstall:
	rm -f "$(DESTDIR)$(BINDIR)/gsb"

test:
	sh scripts/gsb --help >/dev/null
