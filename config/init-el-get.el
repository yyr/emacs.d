(when (not (load "~/.emacs.d/el-get/el-get/el-get.el" t)) ;;from steves emacs.d git http://git.sanityinc.com/
  (error "Please bootstrap el-get using the instructions here: http://github.com/dimitri/el-get/, then restart Emacs"))


(setq el-get-sources
      '(
	;; Basics
	package

        hl-sexp

	(:name smex
	       :type git
	       :url "http://github.com/nonsequitur/smex.git")

	(:name dired-plus
	       :type git
	       :url "git://github.com/emacsmirror/dired-plus.git")

	
	;; help typing
        auto-complete
	highlight-parentheses

	(:name autopair
	       :type git-svn
	       :url "http://autopair.googlecode.com/svn/trunk/")

	(:name yasnippet
	       :type git-svn
	       :url "http://yasnippet.googlecode.com/svn/trunk/")

        ;; Cosmetics

        ;; Org
	(:name org-mode
	       :type git
	       :url "git://repo.or.cz/org-mode.git"
	       :info "doc"
	       :build ("make clean" "make" "make doc/org")
	       :after (lambda () 
			(setq load-path (remove "~/local/emacs-git/share/emacs/24.0.50/lisp/org" load-path)))
	       :load-path ("lisp" "contrib/lisp")
	       :features org-install)

        ;; Version control
	(:name magit
               :after (lambda () (global-set-key (kbd "C-x C-z") 'magit-status)))

        ;; Lisps
        (:name paredit :type http :url "http://mumble.net/~campbell/emacs/paredit.el")

	;; latex
	(:name auctex
	       :type cvs
	       :module "auctex"
	       :url ":pserver:anonymous@cvs.sv.gnu.org:/sources/auctex"
	       :build ("./autogen.sh" "./configure" "make")
	       :load  ("auctex.el" "preview/preview-latex.el")
	       :info "doc")

	;; web & mail
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
	      :features "w3m-load")

	;; extras
	(:name boxquote
	       :type git
	       :url "https://github.com/davep/boxquote.el.git"
	       :after (lambda () (require 'boxquote)))

	(:name el-get
	       :type git
	       :url "git://github.com/dimitri/el-get.git"
	       :features el-get
	       :load    "el-get.el")

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
