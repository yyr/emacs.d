(when (not (load "~/.emacs.d/el-get/el-get/el-get.el" t)) ;;from steves emacs.d git http://git.sanityinc.com/
  (error "Please bootstrap el-get using the instructions here: http://github.com/dimitri/el-get/, then restart Emacs"))


(setq el-get-sources
      '(

	package

;;	(:name fringe-helper :type elpa)
        (:name dired-plus :type git :url "git://github.com/emacsmirror/dired-plus.git")
		
	;; help typing
	highlight-parentheses

	(:name autopair
	       :type git-svn
	       :url "http://autopair.googlecode.com/svn/trunk/")

	(:name yasnippet
	       :type svn
	       :url "http://yasnippet.googlecode.com/svn/trunk/")

	(:name magit
               :after (lambda () (global-set-key (kbd "C-x C-z") 'magit-status)))

	(:name org-mode
	       :type git
	       :url "git://repo.or.cz/org-mode.git"
	       :info "doc"
	       :build ("make clean" "make" "make doc")
	       :after (lambda () 
			(setq load-path (remove "~/local/emacs-git/share/emacs/24.0.50/lisp/org" load-path)))
	       :load-path ("lisp" "contrib/lisp")
	       :features org-install)

	(:name smex
	       :type git
	       :url "http://github.com/nonsequitur/smex.git")

	(:name boxquote
	       :type git
	       :url "https://github.com/davep/boxquote.el.git")

	(:name el-get
	       :type git
	       :url "git://github.com/dimitri/el-get.git"
	       :features el-get
	       :load    "el-get.el")

	(:name bbdb
	       :type git
	       :url "git://github.com/barak/BBDB.git"
	       :load-path ("./lisp" "./bits")
	       :build ("./configure" "make autoloads" "make")
	       :build/darwin ("./configure --with-emacs=/Applications/Emacs.app/Contents/MacOS/Emacs" "make autoloads" "make")
	       :features bbdb
	       :after (lambda () (bbdb-initialize))
	       :info "texinfo")

	(:name emacs-w3m
	      :type cvs
	      :module "emacs-w3m"
	      :url ":pserver:anonymous@cvs.namazu.org:/storage/cvsroot"
	      :build ("autoconf" "./configure" "make")
	      :build/darwin ("autoconf" "./configure --with-emacs=/Applications/Emacs.app/Contents/MacOS/Emacs" "make")
	      :info "doc"
	      :features "w3m-load"))
      )

;
(el-get 'sync)
(provide 'init-el-get)
