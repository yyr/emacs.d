;;from steves emacs.d git http://git.sanityinc.com/
(when (not (load "~/.emacs.d/el-get/el-get/el-get.el" t))
  (error
   "Please bootstrap el-get using the instructions here:
   http://github.com/dimitri/el-get/, then restart Emacs"))

(setq el-get-is-lazy 't)
;; (setq el-get-byte-compile-at-init 't)   ; compile at init if any source is not byte compiled

;; local sources
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
               :autoloads t)))


;; provided sources
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

         ;; general
         dictem

;;;; Cosmetics
         diminish
         color-theme
         color-theme-zenburn

;;;; Org
         org-mode
         calfw

;;;; DVC
         magit
         epresent

;;;; langs
         ;; lisp
         paredit

         ;; python
         pymacs
         ;; ropemacs

;;;; Sub
	 auctex
         ac-math
         ac-octave

	 ncl
         emacs-grads

         gnuplot-mode
         
;;;; web & mail
         bbdb
         emacs-w3m
         yaoddmuse

         textile-mode
         markdown-mode
         haml-mode
         sass-mode
         yaml-mode

;;;; misc
         emms
         boxquote
         profile-dotemacs

         el-get)
       
       (mapcar 'el-get-source-name el-get-sources)))




(el-get 'sync my-packages)
(provide 'init-el-get)

;; init-el-get.el ends here
