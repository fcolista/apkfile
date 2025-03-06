NAME = apkfile
VERSION = $(shell git describe --tags --abbrev=0 2>/dev/null || echo "0.08")

PREFIX?=/usr
DESTDIR?=$(PREFIX)/bin
DOC_DIR=$(PREFIX)/share/doc/$(NAME)
DOC_FILES = *.md
BIN=apkfile

all: install docs

test:

install:
	mkdir -p $(DESTDIR)
	cp $(BIN) $(DESTDIR)

docs:
	mkdir -p $(DOC_DIR)
	cp -r $(DOC_FILES) $(DOC_DIR)/

uninstall:
	rm -f $(DESTDIR)/$(BIN)
	rm -rf $(DOC_DIR)
