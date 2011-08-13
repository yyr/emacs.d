(when (not (load "~/.emacs.d/el-get/el-get/el-get.el" t)) ;;from steves emacs.d git http://git.sanityinc.com/
  (error "Please bootstrap el-get using the instructions here: http://github.com/dimitri/el-get/, then restart Emacs"))

(setq el-get-is-lazy 't)
(setq el-get-byte-compile-at-init 't)   ; compile at init if any source is not byte compiled

(setq el-get-sources
      '(
;;;; help typing
        (:name auto-complete
               :type git
               :url "git://github.com/m2ym/auto-complete.git")

        (:name yasnippet
               :type svn
               :url "http://yasnippet.googlecode.com/svn/trunk/"
               :features "yasnippet"
               :autoloads t)

;;; sub
        ;; emacs-grads
        (:name emacs-grads
               :type git
               :url "git://github.com/yyr/emacs-grads.git"
               :autoloads t)

        (:name ncl
               :type git
               :url "git://github.com/yyr/ncl.el.git"
               :autoloads t)

;;; Misc

	(:name yaoddmuse
               :type emacswiki
               :autoloads t)

        (:name epresent
               :type git
               :url "git://github.com/eschulte/epresent.git")

        (:name boxquote
               :type http
               :url "http://www.davep.org/emacs/boxquote.el")

	(:name profile-dotemacs
               :type http
               :url "http://www.randomsample.de/profile-dotemacs.el"
               :autoloads t)
	))

(setq my-packages
      (append
       '(
         ;;;; Basics
         ;; package24
         hl-sexp
         byte-code-cache

         highlight-parentheses

         smex
         dired-plus
         autopair


;;;; Cosmetics
         diminish
         color-theme
         color-theme-zenburn

;;;; Org
         org-mode
	 calfw
	 
;;;; Version control
         magit

;;;; langs
         ;; html
         ;; nxhtml

         ;; lisp
         paredit

         ;; latex
         auctex

         ;;yaml-mode
         yaml-mode
         gnuplot-mode

	 ;; python
	 pymacs
	 ;; ropemacs

;;;; Sub
	 ac-octave 

;;;; web & mail
         bbdb
         emacs-w3m

         ;; textile
         textile-mode
         ;; markdown
         markdown-mode
         ;; haml
         haml-mode
         ;; sass
         sass-mode
	 

;;;; misc
	 emms
	 
         el-get)
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)
(provide 'init-el-get)
