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

(defvar on-laptop (string-match "rag" (system-name)))
(defvar on-lab-computer (string-match "sealion" (system-name)))
(defvar on-lab-server (or (string-match "amu" (system-name))
                          (string-match "yuz" (system-name))))
(defvar on-ms (string-match "windows" (format "%s" system-type)))

;;;
(defconst emacs-path "~/.emacs.d")
(setq load-path (cons (expand-file-name emacs-path) load-path))

(defmacro after (mode &rest body)
  `(eval-after-load ,mode
     '(progn ,@body)))

;; ----------------------------------------------------------------------------
;;; load individual configuration files
;; ----------------------------------------------------------------------------

;;; first of all any OS dependent paths has to be set
(when on-ms
  (load "init-ms"))

;;; package managers
(load "init-el-get")

;;; IDE , make
;; (load "init-cedet")

;;; mail, news & messages
(load "init-gpg")
(load "init-pre-gnus")
(load "init-mail")
(load "init-message")


;;; initial setup, keybindings
(load "init-general")
(load "init-custom-key-set")
(load "init-minors")
(load "init-auto-save")
(load "init-diminish")

;;; make friendly mini buffer
(load "init-ido")

;;; help typing
(load "init-auto-fill")
(load "init-auto-insert")
(load "init-flyspell")
(load "init-hippie-expand")
(load "init-auto-complete")
(load "init-yasnip")
(load "init-multiple-cursors")
;(load "init-er")

;;; look
(load "init-font")
(load "init-point")
;; (load "init-linum")

;; dictionary
(when (executable-find "dict") (load "init-dictem"))
(when (file-directory-p "~/git/sdic") (load "init-sdic"))
(load "init-edict")
;; (when (not on-ms) (load "init-japanese"))

;;; help navigation
(load "init-navigation")
(load "init-bookmarks")
(load "init-editing")
(load "init-imenu")
(load "init-buffers")
(load "init-recentf")

;;; shell, term, comint, tramp
(load "init-term")
(load "init-tramp")

;;; window, frame
(load "init-windows")
(load "init-frame")

;;; File management
(load "init-dired")

;;; emacs session
;;(load "init-session")

;;; languages
(load "init-lispy")
(load "init-elisp")
(load "init-common-lisp")
(load "init-scheme")
(load "init-grammar")

(load "init-cc")
(load "init-perl")
(load "init-html")
(load "init-yaml")
(load "init-python")
(load "init-compile")

(load "init-fortran")
(load "init-sass-mode")

;;; code assistance
(load "init-flycheck")
(load "init-etags")

;;; subject
(load "init-octave")
(load "init-ncl")
(load "init-grads")
(load "init-gnuplot")

(when (executable-find "latex") ;; auctex is no use  without latex
  (load "init-latex")
  (load "init-bib"))
(load "init-doc-view")

;;; version control
(load "init-git")

;;; ORG
(load "init-org")
(load "init-org-todo-state-tags")
(load "init-org-agenda")
(load "init-org-tags")
(load "init-org-capture")
(load "init-org-refile")
(load "init-org-ob")
(load "init-org-diary")
(load "init-calender")
(load "init-weather-metno")

;;; org publish
(load "init-org-html")
(load "init-org-latex")
(load "init-org-beamer")
(load "init-org-s5")

;;; org misc
(load "init-org-misc")
;(load "init-epresent")

;;; info,  help, doc, man(woman) etc..
(load "init-info")
(load "init-eldoc")
(load "init-help")

;;; web
(load "init-webjump")
(load "init-w3m")
(load "init-erc")

;;;  misc
(load "init-misc")
(load "init-battery")
(load "init-utils")
(load "init-boxquote")
(when (and (not on-lab-server) (not on-ms)) (load "init-social"))

;;; sys & server
(load "init-print")
(load "init-crontab")
(load "init-server")
(load "init-time")
(load "init-crypt")
;; (when on-laptop (load "init-edit-server")
;;       (load "init-mediawiki"))

;;; music
(when (and (not on-lab-server) (not on-ms)) (load "init-emms"))

(load "init-finish")
;; init ends here
