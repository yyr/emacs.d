;;; init-flymake.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: init-flymake.el
;; Created: Saturday, October 29 2011
;; License: GPL v3 or later. <http://www.gnu.org/licenses/gpl.html>

;;; Description:
;;

(require 'flymake)

;;; FIXME
(set-face-attribute
 '(flymake-errline ((((class color)) (:underline "red"))))
 '(flymake-warnline ((((class color)) (:underline "yellow")))))


;;; shell mode
;;----------------
(defcustom flymake-shell-of-choice
  "/bin/bash"
  "Path of shell.")

(defcustom flymake-shell-arguments
  (list "-n")
  "Shell arguments to invoke syntax checking.")

(defconst flymake-allowed-shell-file-name-masks
  '(("\\.sh$" flymake-shell-init))
  "Filename extensions that switch on flymake-shell mode syntax checks.")

(defcustom flymake-shell-err-line-pattern-re
  '(("^\\(.+\\): line \\([0-9]+\\): \\(.+\\)$" 1 2 nil 3))
  "Regexp matching shell error messages.")

(when (load "flymake" t)
  (defun flymake-shell-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list flymake-shell-of-choice
            (append flymake-shell-arguments (list local-file)))))
  (push '(".+\\.sh$" flymake-shell-init)
        flymake-allowed-shell-file-name-masks))

(defun flymake-shell-load ()
  (setq flymake-allowed-file-name-masks
        (append flymake-allowed-file-name-masks
                flymake-allowed-shell-file-name-masks))
  (setq flymake-err-line-patterns
        (append flymake-err-line-patterns flymake-shell-err-line-pattern-re))
  (flymake-mode t)
  (local-set-key (kbd "C-c d") 'flymake-display-err-menu-for-current-line))

;;; init-flymake.el ends here
