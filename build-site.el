;; build site
(package-initialize)
(require 'ox-publish)
(require 'htmlize)

(setq-default buffer-file-coding-system 'utf-8)

(defvar emchat-html-head
"<link rel=\"stylesheet\" type=\"text/css\" href=\"http://sachachua.com/blog/wp-content/themes/sacha-v3/foundation/css/foundation.min.css\"></link>
<link rel=\"stylesheet\" type=\"text/css\" href=\"http://sachachua.com/org-export.css\"></link>
<link rel=\"stylesheet\" type=\"text/css\" href=\"http://sachachua.com/blog/wp-content/themes/sacha-v3/style.css\"></link>
<link rel=\"stylesheet\" type=\"text/css\" href=\"css/emchat.css\"></link>
<script src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js\"></script><script src=\"js/emchat.js\"></script>")

(defvar emchat-preamble
  "<div class=\"sticky contain-to-grid top-menu\"><nav class='top-bar'><ul class='links'>
      <li><a id='home' class='replace home-design' href='/emacs-chats/'>Home</a></li>
      <li><a id='index' class='replace show-for-medium-up home-design' href='/emacs-chats/theindex.html'>Index</a></li>
      <li><a id='contact' class='replace home-design' href='http://sachachua.com/blog/contact'>Contact</a></li>
      <li class=\"right\"><a href='/emacs-chats/sitemap.html'>Sitemap</a></li> 
      <li class=\"right\"><a href=\"https://github.com/sachac/emacs-chats\">Github</a></li>
    </ul></nav></div>")

(defvar emchat-postamble "<div class=\"back-to-top\"><a href=\"#top\">Back to top</a> | <a href=\"mailto:sacha@sachachua.com\">E-mail me</a></div>")
(defvar emchat-postamble-alternative "<div class='footer'>Copyright 2013-2014 %a (%v HTML) - Creative Commons Attribution License.<br>Last updated %C. <br>Built with %c.</div>")

(defvar emchat-directory (file-name-directory (or load-file-name buffer-file-name))
	"Location of files.")

(defun emchat-org-publish-project (project &optional force async)
	"Override some variables."
	(let ((buffer-file-coding-system 'utf-8)
				(select-safe-coding-system-accept-default-p t)
				org-confirm-babel-evaluate
				make-backup-files
				org-html-validation-link)
		(org-publish-project project force async)))

(defun emchat-org-html-publish-to-html (plist filename pub-dir)
	"Publish without saving backup files."
	(let ((buffer-file-coding-system 'utf-8)
				(select-safe-coding-system-accept-default-p t)
				org-confirm-babel-evaluate
				make-backup-files org-html-validation-link)
		(org-html-publish-to-html plist filename pub-dir)))

(add-to-list 'org-publish-project-alist
      `("orgfiles"
         :base-directory ,emchat-directory
         :base-extension "org"
         :exclude "tasks.org"       ; regexp
         :publishing-directory ,emchat-directory
         :publishing-function emchat-org-html-publish-to-html
         :recursive t
         :html-head-include-default-style nil
         :html-head-include-scripts nil
         :html-head ,emchat-html-head
         :html-preamble ,emchat-preamble
         :html-postamble ,emchat-postamble
         :auto-sitemap t                  ; Generate sitemap.org automagically...
         :sitemap-filename "sitemap.org"  ; Call it sitemap.org (it's the default)...
         :sitemap-title "Sitemap"         ; With title 'Sitemap'.
         :makeindex t
         :with-timestamp t
         :htmlized-source t
         ))
(add-to-list 'org-publish-project-alist '("emchat" :components ("orgfiles")))

