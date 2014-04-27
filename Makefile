EMACS ?= emacs
EVAL  := $(EMACS) -Q --batch --eval
BATCH := $(EMACS) -Q --batch

all: cleansite

clean:
	rm -f *.html
	rm -rf ~/.org-timestamps
	rm -f *~

site:
	$(BATCH) -l build-site.el --visit index.org --eval '(emchat-org-publish-project "emchat" t)'

cleansite: clean site

.PHONY: site
