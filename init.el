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
(load! "init-navigation")
(load! "init-imenu")
(load! "init-buffers")
(load! "init-recentf")

;; langs
(load! "init-lispy")
(load! "init-elisp")

(load! "init-yasnip")
(load! "init-dev")

(load! "init-finish")
;; init ends here
