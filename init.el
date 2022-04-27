;;; Emacs Init
;;
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;; License: GPL v3 or later
;;

(setq user-full-name "Yagnesh Raghava Yakkala")
(setq user-mail-address "hi@yagnesh.org")


;;; for faster startup
(defvar file-name-handler-alist-backup file-name-handler-alist)
(setq file-name-handler-alist nil)

(add-hook 'after-init-hook #'(lambda ()
                               ;; restore after startup
                               (setq gc-cons-threshold 2000000
                                     gc-cons-percentage 0.1
                                     file-name-handler-alist file-name-handler-alist-backup)))

;;; package.el
(when (symbolp 'package-archives)
  (setq package-archives
        '(("melpa" . "http://melpa.org/packages/")
          ("gnu" . "http://elpa.gnu.org/packages/"))))

;; (setq package-enable-at-startup nil)
(package-initialize)

;;;
(defconst emacsd
  (expand-file-name "lisp"
                    (file-name-directory "~/.emacs.d/")))
(add-to-list 'load-path emacsd)

(defmacro load! (fname)
  (load-file (expand-file-name (concat fname ".el") emacsd)))
(setq load-prefer-newer t)

(defun ensure-package-installed (pkgs)
  "ensure PKGS are available and installed"
  (let ((packages (if (listp pkgs)
                      pkgs
                    `(,pkgs))))
    (mapc #'(lambda (package)
              (unless (package-installed-p package)
                (package-install package)))
          packages)))

(if (symbolp 'with-eval-after-load)
    (defalias 'after #'with-eval-after-load)
  (defmacro after (file &rest body)
    `(eval-after-load ,file
       (lambda () ,@body))))


;; ----------------------------------------------------------------------------
;;; load individual configuration files
;; ----------------------------------------------------------------------------
(load! "init-git")

;;; initial setup, keybindings
(load! "init-general")
(load! "init-custom-key-set")
(load! "init-minors")
(load! "init-auto-save")

(load! "init-ido")
(load! "init-auto-fill")
(load! "init-auto-insert")
(load! "init-flyspell")
(load! "init-hippie-expand")
(load! "init-company")

;;; look
(load! "init-font")
(load! "init-point")

;;; window, frame
(load! "init-windows")
(load! "init-frame")

;;; help navigation
(load! "init-dired")
(load! "init-navigation")
(load! "init-imenu")
(load! "init-buffers")
(load! "init-recentf")

(load! "init-org")
(load! "init-org-todo-state-tags")
(load! "init-org-agenda")
(load! "init-org-tags")
(load! "init-org-capture")
(load! "init-org-ob")
(load! "init-org-diary")
(load! "init-calender")
(load! "init-weather-metno")
(load! "init-org-export")
(load! "init-org-misc")

;;; info,  help, doc, man(woman) etc..
(load! "init-info")
(load! "init-eldoc")
(load! "init-help")

(load! "init-web")

;;; sys & server  shell, term, tramp
(load! "init-sys")
(load! "init-print")
(load! "init-crontab")
(load! "init-time")
(load! "init-term")
(load! "init-tramp")

;;; languages
(load! "init-flycheck")
(load! "init-etags")
(load! "init-lispy")
(load! "init-elisp")
(load! "init-yasnip")
(load! "init-dev")
(load! "init-common-lisp")
(load! "init-scheme")
(load! "init-grammar")
(load! "init-cc")
(load! "init-perl")
(load! "init-html")
(load! "init-yaml")
(load! "init-python")
(load! "init-compile")
(load! "init-fortran")
(load! "init-js")

;;; Emacs server
(load! "init-server")
(load! "init-session")

;;; mail, news & messages
(load! "init-gpg")
(load! "init-pre-gnus")
(load! "init-gnus")
(load! "init-bbdb")
(load! "init-mail")
(load! "init-message")

;;;  misc
(load! "init-misc")
(load! "init-utils")
(load! "init-boxquote")

(load! "init-finish")
;; init ends here
