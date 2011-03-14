(when (not (load "~/.emacs.d/el-get/el-get/el-get.el" t)) ;;from steves emacs.d git http://git.sanityinc.com/
  (error "Please bootstrap el-get using the instructions here: http://github.com/dimitri/el-get/, then restart Emacs"))


(setq el-get-sources
      '(

;;;; Basics
	package
        hl-sexp

	smex
	dired-plus
		
;;;; help typing
        auto-complete
	highlight-parentheses

	(:name auto-complete-octave
	       :type emacswiki)
	
	autopair
	
	(:name yasnippet
	       :type git-svn
	       :url "http://yasnippet.googlecode.com/svn/trunk/")

;;;; Cosmetics
	diminish

;;;; Org
	org-mode

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
	       :url "git://github.com/yyr/emacs-grads.git")
	
;;;; web & mail
	bbdb
	
	(:name yaoddmuse
	       :type emacswiki)
	
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
	       :type emacswiki)

	(:name profile-dotemacs
	       :type http
	       :url "http://www.randomsample.de/profile-dotemacs.el")

	el-get
	))





(defun el-get-update-all ()
  "Update all el-get packages"
  (interactive)
  (dolist (package (mapcar 'el-get-source-name el-get-sources))
    (unless (memq (plist-get (el-get-package-def package) :type) '(http-tar elpa))
      (el-get-update package))))


;;
(el-get 'sync)
(provide 'init-el-get)
