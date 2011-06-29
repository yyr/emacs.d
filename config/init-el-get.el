(when (not (load "~/.emacs.d/el-get/el-get/el-get.el" t)) ;;from steves emacs.d git http://git.sanityinc.com/
  (error "Please bootstrap el-get using the instructions here: http://github.com/dimitri/el-get/, then restart Emacs"))

(setq el-get-is-lazy 't)
(setq el-get-byte-compile-at-init 't) 	; compile at init if any source is not byte compiled 

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

	(:name ac-octave
	       :type emacswiki
	       :autoloads t)

;;; sub
	;; emacs-grads
	(:name emacs-grads
	       :type git
	       :url "git://github.com/yyr/emacs-grads.git"
	       :autoloads t)

	(:name ncl
	       :type http
	       :url "http://www.ncl.ucar.edu/Applications/Files/ncl.el"
	       :autoloads t)
	
	(:name yaoddmuse
	       :type emacswiki
	       :autoloads t)
	
	
	(:name boxquote
	       :type http
	       :url "http://www.davep.org/emacs/boxquote.el"
	       :autoloads t)

	(:name multi-term
	       :type emacswiki
	       :autoloads t)
	
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
	 ;; org publish
	 htmlize
	 
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
	 
;;;; web & mail
	 bbdb

	 emacs-w3m

	 ;; textile-mode
	 textile-mode
	 ;; markdown-mode
	 markdown-mode
	 ;; haml-mode
	 haml-mode
	 ;; sass mode
	 sass-mode

	 el-get)

       (loop
	for src in el-get-sources collect (el-get-source-name src))))

(el-get 'sync my-packages)

(provide 'init-el-get)
