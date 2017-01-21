(package-initialize)

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
(defvar on-lab-server (string-match "iitm" (system-name)))
(defvar on-ms (string-match "windows" (format "%s" system-type)))

;;;
(defconst emacsd
  (expand-file-name "lisp"
                    (file-name-directory user-init-file)))
(add-to-list 'load-path emacsd)

;; ----------------------------------------------------------------------------
;;; Some assistant macros for loading/debug
;; ----------------------------------------------------------------------------
(if (symbolp 'with-eval-after-load)
    (defalias 'after #'with-eval-after-load)
  (defmacro after (file &rest body)
    `(eval-after-load ,file
       (lambda () ,@body))))

;; stupid debugger assistant
(defmacro catch-pkg-load (&optional pkg)
  "Find out who is loading a PKG if the argument is available or
mark a check point"
  (setq debug-on-error t)
  (if pkg
      (eval-after-load pkg
        `(error  "%s is just loaded in %s" ',pkg
                 (or load-file-name buffer-file-name)))
    (message "%s already loaded at this point: %s " ',pkg
             (or load-file-name buffer-file-name))))

(defun reload-init-file ()
  "reloads init file .emacs.d/init.el"
  (interactive)
  (load-file "~/.emacs.d/init.el"))

;; ----------------------------------------------------------------------------
;;; load individual configuration files
;; ----------------------------------------------------------------------------
(defalias 'function-put 'put)
;;; prefer neweer
(setq load-prefer-newer t)

;;; first of all any OS dependent paths has to be set
(when on-ms
  (load "init-ms"))

;;; package managers
(load "init-el-get")

;;; version control
(load "init-git")

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

;;; make friendly mini buffer
(load "init-ido")

;;; help typing
(load "init-auto-fill")
(load "init-auto-insert")
(load "init-flyspell")
(load "init-hippie-expand")
;; (load "init-auto-complete")
(load "init-company")

(load "init-yasnip")
(load "init-multiple-cursors")
(load "init-dev")

;;; look
(load "init-font")
(load "init-point")

;; dictionary
(when (executable-find "dict") (load "init-dictem"))
(when (file-directory-p "~/git/sdic") (load "init-sdic"))
(load "init-edict")
;; (when (not on-ms) (load "init-japanese"))

;;; help navigation
(load "init-navigation")
(load "init-editing")
(load "init-imenu")
(load "init-buffers")
(load "init-recentf")

;;; shell, term, comint, tramp
(load "init-term")
(load "init-tramp")
(load "init-unixutils")

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

;;; code assistance
(load "init-flycheck")
(load "init-etags")

;;; subject
(load "init-ncl")
(load "init-ferret")
(when (and (not on-lab-server) (not on-ms))
  (load "init-latex")
  (load "init-bib"))
(load "init-doc-view")

;;; ORG
(load "init-org")
(load "init-org-todo-state-tags")
(load "init-org-agenda")
(load "init-org-tags")
(load "init-org-capture")
(load "init-org-ob")
(load "init-org-diary")
(load "init-calender")
(load "init-weather-metno")

;;; org publish
(load "init-org-export")
(load "init-org-misc")

;;; info,  help, doc, man(woman) etc..
(load "init-info")
(load "init-eldoc")
(load "init-help")
(load "init-outline")

;;; web
(load "init-web")
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


;;; music
(when (and (not on-lab-server) (not on-ms)) (load "init-emms"))

(load "init-finish")
;; init ends here
