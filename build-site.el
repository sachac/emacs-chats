;; build site
(require 'org)
(require 'ox-publish)

(setq make-backup-files nil) ;;rebuilding will crete backup-files otherwise

(setq emacs-chats-dir (file-name-directory (or load-file-name buffer-file-name)))

(setq org-html-validation-link nil)

(defvar emchat-html-head
"<link rel=\"stylesheet\" type=\"text/css\" href=\"http://sachachua.com/blog/wp-content/themes/sacha-v3/foundation/css/foundation.min.css\"></link>
<link rel=\"stylesheet\" type=\"text/css\" href=\"http://sachachua.com/org-export.css\"></link>
<link rel=\"stylesheet\" type=\"text/css\" href=\"http://sachachua.com/blog/wp-content/themes/sacha-v3/style.css\"></link>
<link rel=\"stylesheet\" type=\"text/css\" href=\"css/emchat.css\"></link>
<script src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js\"></script><script src=\"js/emchat.js\"></script>")

(defvar emchat-preamble
  "<nav class='top-bar'><ul class='links'>
      <li><a id='home' class='replace home-design' href='/emacs-chats/'>Home</a></li>
      <li><a id='about' class='replace home-design' href='http://sachachua.com/blog/about/'>About</a></li>
      <li><a id='resources' class='replace home-design' href='http://sachachua.com/blog/2014/04/emacs-beginner-resources/'>Resources</a></li>
      <li><a id='index' class='replace show-for-medium-up home-design' href='/emacs-chats/theindex.html'>Index</a></li>
      <li><a id='contact' class='replace home-design' href='http://sachachua.com/blog/contact'>Contact</a></li>
    </ul></nav>")

(defvar emchat-postamble "<div class=\"back-to-top\"><a href=\"#top\">Back to top</a> | <a href=\"mailto:sacha@sachachua.com\">E-mail me</a></div><hr>
<nav clas='links'><a href='/emacs-chats/sitemap.html'>Sitemap</a></nav>")

(defvar emchat-postamble-alternative "<div class='footer'>Copyright 2013 %a (%v HTML).<br>Last updated %C. <br>Built with %c.</div>")

(setq org-publish-project-alist
      `(("orgfiles"
         :base-directory "/Users/plovs/Documents/Chua/emacs-chats"
         :base-extension "org"
         :exclude "setup.inc"       ; regexp
         :publishing-directory "/Users/plovs/Documents/Chua/emacs-chats"
         :publishing-function org-html-publish-to-html
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
         )
        ("emchat" :components ("orgfiles"))
        ))
