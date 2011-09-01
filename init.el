;;; Emacs Init
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;; Licence: GPL v3 or later

;;; ---------------------------------------------------------------------------
(setq user-full-name '"Yagnesh Raghava Yakkala")
(setq user-mail-address '"yagnesh@live.com")

;;; Name the systems we have
(if (equal (system-name) "raghava-note")
    (setq *system* "laptop")
  (setq *system* "amur"))

(if (equal (system-name) "okhotsk19")
    (setq *system* "lubu"))

;;; ---------------------------------------------------------------------------

;;; for system specific
(setq *byte-code-cache-enabled* nil)

(defconst emacs-path "~/.emacs.d")             ; emacs path
(defconst my-emacs-config "~/.emacs.d/config") ; config path
(setq gnus-init-file
      (concat my-emacs-config "/init-gnus.el" )) ;gnus init file

(setq load-path (cons
                 (expand-file-name emacs-path)
                 (cons my-emacs-config load-path)))

;;; ---------------------------------------------------------------------------
(require 'cl)                            ; must have
;;; ---------------------------------------------------------------------------

;;; load emacs individual configuration files
;; ----------------------------------------------------------------------------

;;; package managers
(require 'init-elpa)
(require 'init-el-get)

;;; byte-compile-cache
(when *byte-code-cache-enabled*
  (require 'init-byte-code-cache))

;;; initial setup, keybindings
(require 'init-general)
(require 'init-ess-minors)
(require 'init-custom-key-set)
(require 'init-point)
(require 'init-buffers)
(require 'init-time)
(require 'init-diminish)
(require 'init-linum)

;;; look
(require 'init-font)
(require 'init-color-theme)

;;; help typing
(require 'init-autopair)
(require 'init-auto-fill)
(require 'init-auto-insert)
(require 'init-flyspell)
(require 'init-hippie-expand)
(require 'init-auto-complete)
(require 'init-yasnip)
(require 'init-dictem)

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
(require 'init-python)

;;; subject
(require 'init-octave)
(require 'init-auctex)
;; (require 'init-latex)
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
(require 'init-epresent)

;;; Info,  help & Doc
(require 'init-info)
(require 'init-eldoc)

;;; 'make' help

;;; web
(require 'init-webjump)
(require 'init-w3m)
(require 'init-yaoddmuse)
(require 'init-sass-mode)
(require 'init-erc)

;;; utilities & misc
(require 'init-utils)
(require 'init-exec-path)
(require 'init-misc)
(require 'init-battery)

;;; server
(require 'init-server)

;;; music
(if (file-directory-p "/dump/MUSIC/")
    (require 'init-emms))

;; interactive customization
;;----------------------------------------------------------------------------
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(add-hook 'emacs-startup-hook
          '(lambda ()
             (progn
               (message "My .emacs loaded in %s"
                        (emacs-init-time))
               (el-get-notify
                "Emacs is started"
                (format "loding init file took %s"
                        (emacs-init-time)))
               (sit-for 0.5)
               ;; bit intersting startup
               (message "%s" "As always by your command... "))))

;; init ends here
