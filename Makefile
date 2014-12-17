EMACS ?= emacs
EVAL  := $(EMACS) -q --batch --eval
BATCH := $(EMACS) -q --batch

all: site ebooks

clean:
	rm -f *.html
	rm -f *~

site:
	$(BATCH) -l build-site.el --visit index.org --eval '(emchat-org-publish-project "emchat" t)'

cleansite: clean site

epub.html: epub.org
	$(BATCH) -l build-site.el -f sacha/export-emacs-chat-epub

emacs-chats.epub: epub.html
	ebook-convert epub.html emacs-chats.epub --chapter "//h:h2" --level1-toc "//h:h2" --cover cover.png --authors "Sacha Chua" --language "English"

emacs-chats.mobi: emacs-chats.epub
	ebook-convert emacs-chats.epub emacs-chats.mobi

ebooks: emacs-chats.epub emacs-chats.mobi

.PHONY: site
