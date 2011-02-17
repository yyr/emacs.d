;;; EMACS INIT 

(setq user-full-name '"Yagnesh Raghava Yakkala")
(setq user-mail-address '"yagnesh@live.com")

(defconst emacs-path "~/.emacs.d")             ; emacs path
(defconst my-emacs-config "~/.emacs.d/config") ; config path
(setq gnus-init-file
      (concat my-emacs-config "/init-gnus.el" )) ;gnus init file

(require 'cl)

;;; load all subdirs of el-get 
(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
    (let* ((my-lisp-dir "~/.emacs.d/el-get/")
           (default-directory my-lisp-dir))
      (progn
        (setq load-path (cons my-lisp-dir load-path))
        (normal-top-level-add-subdirs-to-load-path))))
(setq load-path (cons (expand-file-name emacs-path) (cons my-emacs-config load-path)))


;;; load emacs individual configuration files
;; -----------------------------------------------------------------------------

;;; package managers
(require 'init-elpa)
(require 'init-el-get)

;;; initial setup, keybindings
(require 'init-general)
(require 'init-ess-minors)
(require 'init-custom-key-set)
(require 'init-time)

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
(require 'init-auto-save)

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

;;; DVC
(require 'init-git)

;;; org GTD 
(require 'init-dairy)
(require 'init-org)
(require 'init-org-agenda)
(require 'init-org-tags)
(require 'init-org-capture)
;(require 'init-org-clock)
(require 'init-org-ob)

;;; org publish
(require 'init-org-html)
(require 'init-org-latex)
(require 'init-org-beamer)


;;; Info,  help & Doc
(require 'init-info)
(require 'init-eldoc)

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
(require 'init-multi-term)

;; interactive customization
;;----------------------------------------------------------------------------
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; init ends here
