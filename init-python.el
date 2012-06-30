;;; init-python.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;;    File: init-python.el
;; Created: Friday, July 22 2011
;; License: GPL v3 or later. You should get a copy from <http://www.gnu.org/licenses/gpl.html>

;;; Description:

(el-get 'sync '(python
                pylookup
                highlight-indentation
                pymacs
                rope
                ropemode
                ropemacs))

;;; --------------------------------------------------------------------
;; PYTHON.EL
(require 'python)

(autoload 'python-mode "python.el" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.\\(py\\|py3\\)$" . python-mode))

;;; highlight indentation mode
(defvaralias 'py-indent-offset 'python-indent-offset)

;; (add-hook 'python-mode-hook (lambda ()
;;                              (highlight-indentation-mode)))


;;; --------------------------------------------------------------------
;;; PYMACS
(require 'pymacs)

(setenv
 "PYTHONPATH"
 (let ((pplist (split-string (or (getenv "PYTHONPATH") "") ":" 'omit-nulls)))
   (mapconcat 'identity
              (remove-duplicates (cons (el-get-package-directory 'pymacs)  pplist)
                                 :test #'string= :from-end t)
              ":")))

(defun pymacs-setup ()
  "pymacs setup"
  (autoload 'pymacs-load "pymacs" nil t)
  (autoload 'pymacs-eval "pymacs" nil t)
  (autoload 'pymacs-exec "pymacs" nil t)
  (autoload 'pymacs-call "pymacs")
  (autoload 'pymacs-apply "pymacs")

;;; ROPEMACS
  (pymacs-load "ropemacs" "rope-"))

(add-hook 'python-mode-hook 'pymacs-setup)

;;; --------------------------------------------------------------------
;; PYLOOKUP
(setq pylookup-dir "~/.emacs.d/el-get/pylookup")
(add-to-list 'load-path pylookup-dir)

;; load pylookup when compile time
(require 'pylookup)

;; set executable file and db file
(setq pylookup-program
      (concat pylookup-dir "/pylookup.py"))
(setq pylookup-db-file
      (concat pylookup-dir "/pylookup.db"))

;; to speedup, just load it on demand
(autoload 'pylookup-lookup "pylookup"
  "Lookup SEARCH-TERM in the Python HTML indexes." t)

(autoload 'pylookup-update "pylookup"
  "Run pylookup-update and create the database at `pylookup-db-file'." t)

(add-hook 'python-mode-hook
          (lambda ()
            ;; pylookup
            (local-set-key (kbd "C-z C-l") 'pylookup-lookup)
            (local-set-key (kbd "C-z C-s") 'pylookup-lookup-at-point)
            ;; indentation
            (local-set-key (kbd "M-<left>") 'python-indent-shift-left)
            (local-set-key (kbd "M-<right>") 'python-indent-shift-right)))


;;; init-python.el ends here
