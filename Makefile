EMACS ?= emacs
EVAL  := $(EMACS) -Q --batch --eval
BATCH := $(EMACS) -Q --batch

clean:
	rm *.html
	rm -rf ~/.org-timestamps
site:
	$(BATCH) -l build-site.el --visit index.org --eval '(org-publish-project "emchat" t)'

cleansite: clean
	site

.PHONY: site
