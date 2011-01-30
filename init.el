;;; EMACS INIT 

;; emacs path ~/.emacs.d/
;; config elisps are in ~/.emamcs.d/config
;; -----------------------------------------------------------------------------

(setq user-full-name '"yagnesh raghava yakkala")
(setq user-mail-address '"yagneshmsc@NOSPAMgmail.com")

(defconst emacs-path "~/.emacs.d")
(defconst my-emacs-config "~/.emacs.d/config")

(require 'cl)

(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
    (let* ((my-lisp-dir "~/.emacs.d/el-get/")
           (default-directory my-lisp-dir))
      (progn
        (setq load-path (cons my-lisp-dir load-path))
        (normal-top-level-add-subdirs-to-load-path))))
(setq load-path (cons (expand-file-name emacs-path) (cons my-emacs-config load-path)))

;; ----------------------------------------------------------------------------- 
;; load emacs individual configuration files
;; -----------------------------------------------------------------------------

;;; package managers
(require 'init-elpa)
(require 'init-el-get)

;;; initial setup, keybindings
(require 'init-ess-minors)
(require 'init-custom-key-set)
(require 'init-general)

;;; help typing
(require 'init-autopair)
(require 'init-auto-fill)
(require 'init-auto-insert)
(require 'init-hippie-expand)
(require 'init-auto-complete)
(require 'init-diminish)
(require 'init-yasnip)

;;; window , desktop & buffer
(require 'init-windows)
(require 'init-frame)
(require 'init-recentf)

;;; File management
(require 'init-dired)

;;; make friendly mini buffer 
(require 'init-ido)
(require 'init-smex)

;;; languages
(require 'init-perl)
(require 'init-fortran)
(require 'init-sh)
(require 'init-lisp)
(require 'init-html)

;;; subject
(require 'init-octave)  
(require 'init-latex)   

;;; git
(require 'init-git)

;;; org GTD & publishing
(require 'init-org)
(require 'init-org-tags)
(require 'init-org-capture)
(require 'init-org-clock)
(require 'init-org-ob)
(require 'init-org-beamer)


;;; Info,  help & Doc
(require 'init-info)

;;; 'make' help

;;; web
(require 'init-w3m)
(require 'init-yaoddmuse)

;;; utilities & misc
(require 'init-utils)
(require 'init-exec-path)
(require 'init-misc)


;;; server
(require 'init-server)


;; interactive customization
;;----------------------------------------------------------------------------
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; init ends here
