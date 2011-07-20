;;; Emacs Init 
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;; Licence: GPL v3 or later

;;; ---------------------------------------------------------------------------
(setq user-full-name '"Yagnesh Raghava Yakkala")
(setq user-mail-address '"yagnesh@live.com")

;;; for system specific
(setq *byte-code-cache-enabled* nil)

(defconst emacs-path "~/.emacs.d")             ; emacs path
(defconst my-emacs-config "~/.emacs.d/config") ; config path
(setq gnus-init-file
      (concat my-emacs-config "/init-gnus.el" )) ;gnus init file

(defvar *emacs-load-start* (current-time))
;;; ---------------------------------------------------------------------------

(require 'cl) 				 ; must have

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

;;; byte-compile-cache 
(when *byte-code-cache-enabled*
  (require 'init-byte-code-cache))

;;; look
(require 'init-font)
(require 'init-color-theme)

;;; initial setup, keybindings
(require 'init-general)
(require 'init-ess-minors)
(require 'init-custom-key-set)
(require 'init-time)
(require 'init-bbdb)

;;; help typing
(require 'init-autopair)
(require 'init-auto-fill)
(require 'init-auto-insert)
(require 'init-hippie-expand)
(require 'init-auto-complete)
;; (require 'init-diminish)
(require 'init-yasnip)

;;; help navigation
(require 'init-bookmarks)
(require 'init-imenu)

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
(require 'init-yaml)
(require 'init-common-lisp)


;;; subject
(require 'init-octave)  
(require 'init-latex)   
(require 'init-ncl)
(require 'init-grads)
(require 'init-gnuplot)

;;; DVC
(require 'init-git)

;;; org GTD 
(require 'init-diary)
(require 'init-org)
(require 'init-org-todo-state-tags)
(require 'init-org-agenda)
(require 'init-org-tags)
(require 'init-org-capture)
(require 'init-org-refile)
(require 'init-org-clock)
(require 'init-org-ob)
(require 'init-org-diary)

;;; org publish
(require 'init-org-html)
(require 'init-org-latex)
(require 'init-org-beamer)
(require 'init-org-publish)

;;; org misc
(require 'init-org-misc)

;;; Info,  help & Doc
(require 'init-info)
(require 'init-eldoc)

;;; 'make' help

;;; web
(require 'init-webjump)
(require 'init-w3m)
(require 'init-yaoddmuse)
(require 'init-sass-mode)

;;; utilities & misc
(require 'init-utils)
(require 'init-exec-path)
(require 'init-misc)
(require 'init-battery)

;;; server
(require 'init-server)
;;(require 'init-multi-term)

;; interactive customization
;;----------------------------------------------------------------------------
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)


(message "My .emacs loaded in %ds" (destructuring-bind (hi lo ms) (current-time)
				     (- (+ hi lo) (+ (first *emacs-load-start*) (second *emacs-load-start*)))))

;; init ends here
