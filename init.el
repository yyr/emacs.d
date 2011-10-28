;;; Emacs Init
;;
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;; License: GPL v3 or later
;;

;;; ---------------------------------------------------------------------------
(setq user-full-name "Yagnesh Raghava Yakkala")
(setq user-mail-address "yagnesh@live.com")

;;; ---------------------------------------------------------------------------
;; check emacs running on which system (to load config differently
;; for different computers)
;; I go by hostnames which are all fixed

(defvar on-laptop          ; on my laptop, mostly I can run everything
  (string-match "rag" (system-name)))

(defvar on-lab-computer                 ; main lab desktop
  (string-match "okho" (system-name)))

(defvar on-lab-server        ; lab cluster (hu hu built emacs24 there)
  (string-match "amu" (system-name)))

;;; ---------- PATH -----------------------------------------------------------
(defconst emacs-path "~/.emacs.d")      ; emacs path
(setq load-path (cons (expand-file-name emacs-path) load-path))

;; ----------------------------------------------------------------------------
(require 'cl)                            ; must have

;; ----------------------------------------------------------------------------
;;; any reservations in loading individual configurations (down below)
(setq gnus-init-file (concat emacs-path "/init-gnus.el" )) ;gnus init file
(setq *byte-code-cache-enabled* nil)

;; ----------------------------------------------------------------------------
;;; load emacs individual configuration files
;; ----------------------------------------------------------------------------
;;; package managers
                                        ;(load 'init-elpa)
(load "init-el-get")

;;; byte-compile-cache
(when *byte-code-cache-enabled*
  (load "init-byte-code-cache"))

;;; initial setup, keybindings
(load "init-general")
(load "init-ess-minors")
(load "init-custom-key-set")
(load "init-point")
(load "init-time")
(load "init-diminish")
(load "init-auto-save")
;; (load "init-linum")

;;; look
(load "init-font")
(load "init-color-theme")

;;; help typing
(load "init-autopair")
(load "init-auto-fill")
(load "init-auto-insert")
(load "init-flyspell")
(load "init-hippie-expand")
(load "init-auto-complete")
(load "init-yasnip")
(when (executable-find "dictd")            ; dict is not available on server
  (load "init-dictem"))

;;; help navigation
(load "init-bookmarks")
(load "init-imenu")
(load "init-buffers")
(load "init-recentf")
(load "init-anything")

;;; window , frame
(load "init-windows")
(load "init-frame")

;;; File management
(load "init-dired")

;;; make friendly mini buffer
(load "init-ido")
(load "init-smex")

;;; languages
(load "init-perl")
(load "init-fortran")
(load "init-sh")
(load "init-lisp")
(load "init-html")
(load "init-yaml")
(load "init-common-lisp")
(load "init-python")

;;; subject
(load "init-octave")
(when (executable-find "latex")         ; auctex is no use  without latex
  (load "init-auctex")
  (load "init-bib"))
;; (load "init-latex")
(load "init-ncl")
(load "init-grads")
(load "init-gnuplot")

;;; DVC
(load "init-git")

;;; org GTD
(load "init-diary")
(load "init-org")
(load "init-org-todo-state-tags")
(load "init-org-agenda")
(load "init-org-tags")
(load "init-org-capture")
(load "init-org-refile")
(load "init-org-clock")
(load "init-org-ob")
(load "init-org-diary")

;;; org publish
(load "init-org-html")
(load "init-org-latex")
(load "init-org-beamer")
(load "init-org-publish")
(load "init-org-s5")

;;; org misc
(load "init-org-misc")
(load "init-epresent")

;;; Info,  help, doc , man(woman) etc..
(load "init-info")
(load "init-eldoc")
(load "init-help")

;;; IDE , make
(load "init-cedet")
;; (load "init-ecb")
(load "init-flymake")
(load "init-etags")

;;; web
(load "init-webjump")
(load "init-w3m")
(load "init-yaoddmuse")
(load "init-sass-mode")
(load "init-erc")

;;; utilities & misc
(load "init-utils")
(load "init-exec-path")
(load "init-misc")
(load "init-battery")

;;; sys & server
(load "init-crontab")
(load "init-server")
(when (not on-lab-server)
  (load "init-edit-server"))

;;; music
(when on-laptop                     ; I listen music only on my laptop
  (load "init-emms"))

;;; for tests
(load "init-scratch")
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
