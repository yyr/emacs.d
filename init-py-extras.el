;;; init-py-extras.el
;;
;; Author: Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: init-py-extras.el
;; Created: 水曜日, 10月 31 2012

;;; Description:
;;

;;; --------------------------------------------------------------------
;; PYTHON.EL
(add-to-list 'auto-mode-alist '("\\.\\(py\\|py3\\)$" . python-mode))


(when (executable-find "hg")
  (el-get 'sync '(rope
                  pymacs
                  ropemode
                  ropemacs)))

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

;; (add-hook 'python-mode-hook 'pymacs-setup)

;;; init-py-extras.el ends here
