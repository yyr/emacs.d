;;; Emacs Init
;;
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;; License: GPL v3 or later
;;

(setq user-full-name "Yagnesh Raghava Yakkala")
(setq user-mail-address "hi@yagnesh.org")

;;; ---------------------------------------------------------------------------
;; Check emacs running on which system (to load config differently
;; for different computers). I go by hostnames which are all fixed

(defvar on-laptop
  (string-match "rag" (system-name)))

(defvar on-lab-computer
  (string-match "okho" (system-name)))

(defvar on-lab-server
  (string-match "amu" (system-name)))

(defvar on-ms
  (string-match "windows" (format "%s" system-type)))

(defconst emacs-path "~/.emacs.d")
(setq load-path (cons (expand-file-name emacs-path) load-path))

(setq gnus-init-file
      (concat emacs-path "/init-gnus.el" ))

(require 'cl)

;; ----------------------------------------------------------------------------
;;; load emacs individual configuration files
;; ----------------------------------------------------------------------------

;;; first of all any OS dependent paths has to be set
(when on-ms
  (load "init-ms"))

;;; package managers
(load "init-el-get")

;;; IDE , make
(load "init-cedet")

;;; initial setup, keybindings
(load "init-general")
(load "init-ess-minors")
(load "init-custom-key-set")
(load "init-point")
(load "init-time")
(load "init-utils")
(load "init-er")

;;; make friendly mini buffer
(load "init-ido")
(load "init-smex")
(load "init-minibuffer")

(load "init-diminish")
(load "init-auto-save")
;; (load "init-linum")

;;; look
(load "init-font")

;;; help typing
(load "init-autopair")
(load "init-auto-fill")
(load "init-auto-insert")
(load "init-flyspell")
(load "init-hippie-expand")
(load "init-auto-complete")
(load "init-yasnip")
(load "init-multiple-cursors")

;; dict is not available on server
(when (executable-find "dict")
  (load "init-dictem"))
(when (file-directory-p "~/git/sdic")
  (load "init-sdic"))
(load "init-edict")

;;; help navigation
(load "init-navigation")
(load "init-bookmarks")
(load "init-imenu")
(load "init-buffers")
(load "init-recentf")

;;; shell, term, comint, tramp
(load "init-term")

;;; window , frame
(load "init-windows")
(load "init-frame")

;;; File management
(load "init-dired")

;;; emacs session
;(load "init-session")

;;; languages
(load "init-lispy")
(load "init-elisp")
(load "init-common-lisp")
(load "init-scheme")
(load "init-grammar")

(load "init-perl")
(load "init-html")
(load "init-yaml")
(load "init-python")
(load "init-compile")

(load "init-fortran")
(load "init-namelist")

;;; subject
(load "init-octave")
(when (executable-find "latex")         ; auctex is no use  without latex
  (load "init-auctex")
  (load "init-bib"))
(load "init-ncl")
(load "init-grads")
;; (load "init-gnuplot")

;;; DVC
(load "init-git")

;;; org GTD
(load "init-org")
(load "init-org-todo-state-tags")
(load "init-org-agenda")
(load "init-org-tags")
(load "init-org-capture")
(load "init-org-refile")
;(load "init-org-clock")
(load "init-org-ob")
(load "init-org-diary")
(load "init-calender")

;;; org publish
(load "init-org-html")
(load "init-org-latex")
(load "init-org-beamer")
(load "init-org-s5")

;;; org misc
(load "init-org-misc")
(load "init-epresent")

;;; Info,  help, doc , man(woman) etc..
(load "init-info")
(load "init-eldoc")
(load "init-help")

;; (load "init-ecb")
(load "init-flymake")
(load "init-etags")

;;; web
(load "init-webjump")
(load "init-w3m")
(load "init-sass-mode")
(load "init-erc")

;;;  misc
(load "init-misc")
(load "init-battery")

;;; sys & server
(load "init-print")
(load "init-mail")
(load "init-crontab")
(load "init-server")
(load "init-boxquote")

(when on-laptop
  (load "init-edit-server")
  (load "init-mediawiki"))

;;; music
(when (and on-laptop (not on-ms))
  (load "init-emms"))

(load "init-finish")
;; init ends here
