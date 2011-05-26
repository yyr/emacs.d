(when (not (load "~/.emacs.d/el-get/el-get/el-get.el" t)) ;;from steves emacs.d git http://git.sanityinc.com/
  (error "Please bootstrap el-get using the instructions here: http://github.com/dimitri/el-get/, then restart Emacs"))

(setq el-get-is-lazy 't)
(setq el-get-byte-compile-at-init 't) 	; compile at init if any source is not byte compiled 

(setq el-get-sources
      '(
;;;; Basics
	;; package24
        hl-sexp
	byte-code-cache
	
	smex
	dired-plus
		
;;;; help typing
        auto-complete
	highlight-parentheses

	(:name yasnippet
	       :type svn
	       :url "http://yasnippet.googlecode.com/svn/trunk/"
	       :features "yasnippet"
	       :autoloads t)

	(:name auto-complete-octave
	       :type emacswiki
	       :autoloads t)
	
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
	
	gnuplot-mode
	
;;;; web & mail
	bbdb
	
	(:name yaoddmuse
	       :type emacswiki
	       :autoloads t)
	
	
	emacs-w3m

	;; textile-mode
	textile-mode
	;; markdown-mode
	markdown-mode
	;; haml-mode
	haml-mode
	;; sass mode
	sass-mode
	
;;;; extras
	boxquote

	(:name multi-term
	       :type emacswiki
	       :autoloads t)
	

	(:name profile-dotemacs
	       :type http
	       :url "http://www.randomsample.de/profile-dotemacs.el"
	       :autoloads t)
	el-get))


(el-get 'sync)
(provide 'init-el-get)
