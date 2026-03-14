PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin
TAG ?=

.PHONY: help install uninstall test formula-from-tag release-tag

help:
	@echo "Targets:"
	@echo "  make install      Install gsb to $(BINDIR)"
	@echo "  make uninstall    Remove gsb from $(BINDIR)"
	@echo "  make test         Run basic smoke checks"
	@echo "  make formula-from-tag TAG=vX.Y.Z   Update Formula with stable url+sha256"
	@echo "  make release-tag TAG=vX.Y.Z        Create local git tag"

install:
	install -d "$(DESTDIR)$(BINDIR)"
	install -m 0755 scripts/gsb "$(DESTDIR)$(BINDIR)/gsb"

uninstall:
	rm -f "$(DESTDIR)$(BINDIR)/gsb"

test:
	sh scripts/gsb --help >/dev/null

formula-from-tag:
	@if [ -z "$(TAG)" ]; then \
		echo "TAG is required, example: make formula-from-tag TAG=v0.1.0"; \
		exit 1; \
	fi
	sh tools/update-formula-from-tag.sh "$(TAG)"

release-tag:
	@if [ -z "$(TAG)" ]; then \
		echo "TAG is required, example: make release-tag TAG=v0.1.0"; \
		exit 1; \
	fi
	git tag "$(TAG)"
	@echo "Created tag $(TAG). Push with: git push origin $(TAG)"
