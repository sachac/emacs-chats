# -*- mode: org; -*-

#+HTML: <hr>
Check out [[http://sachachua.com/blog/emacs-chat][Emacs Chat]] for more interviews like this. Got a story to tell about how you learned about or how you use Emacs? [[http://sachachua.com/blog/contact][Get in touch!]]

** Comments

#+name: disqus
#+begin_src emacs-lisp :results html :exports results
(when (org-entry-get (point) "DISQUS" t)
(concat "<div id=\"disqus_thread\"></div>
<script type=\"text/javascript\">
    /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
    var disqus_url = \"" (org-entry-get (point) "DISQUS" t) "\";
    var disqus_shortname = 'sachac'; // Required - Replace example with your forum shortname
    var disqus_container_id = 'disqus_thread';
    var disqus_domain = 'disqus.com';
    /* * * DON'T EDIT BELOW THIS LINE * * */
    (function() {
        var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
    })();
</script>
<noscript>Please enable JavaScript to view the <a href=\"http://disqus.com/?ref_noscript\">comments powered by Disqus.</a></noscript>
<a href=\"http://disqus.com\" class=\"dsq-brlink\">blog comments powered by <span class=\"logo-disqus\">Disqus</span></a>"))
#+end_src

