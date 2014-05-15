;;; init-python.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;;    File: init-python.el
;; Created: Friday, July 22 2011
;; License: GPL v3 or later. You should get a copy from <http://www.gnu.org/licenses/gpl.html>

;;; Description:

(el-get 'sync '(pylookup
                highlight-indentation))

;;; --------------------------------------------------------------------
;;; Auto Completion
;;; --------------------------------------------------------------------
(load "init-jedi")


;;; Ipython
(when (executable-find "ipython")
  (setq
   python-shell-interpreter "ipython"
   python-shell-interpreter-args ""
   python-shell-prompt-regexp "In \\[[0-9]+\\]: "
   python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
   python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
   python-shell-completion-module-string-code
   "';'.join(module_completion('''%s'''))\n"
   python-shell-completion-string-code
   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"))

(add-to-list 'auto-mode-alist           ; .py, pym, pyc (also capitals)
             '("\\.[pP][yY][MmCc]?\\'" . python-mode))

;;;
(defun inf-python ()
  (interactive)
  (setenv "PYTHONSTARTUP"
          (replace-regexp-in-string
           "\n"  "" (shell-command-to-string "python -m jedi")))
  (run-python "python" t t))

;;; --------------------------------------------------------------------
;; Documentation Helpers
;;; --------------------------------------------------------------------
;;; pylookup
(require 'pylookup)
(add-hook 'python-mode-hook
          (lambda ()
            ;; pylookup
            (local-set-key (kbd "C-z C-l") 'pylookup-lookup)
            (local-set-key (kbd "C-z C-s") 'pylookup-lookup-at-point)
            ;; indentation
            (local-set-key (kbd "M-<left>") 'python-indent-shift-left)
            (local-set-key (kbd "M-<right>") 'python-indent-shift-right)))

;;; pydoc-info
(setq my-info-dir "~/git/info-collection/")
(when (file-exists-p (concat my-info-dir "python.info"))
  (el-get 'sync 'pydoc-info)
  (require 'pydoc-info)
  (info-lookup-add-help
   :mode 'python-mode
   :parse-rule 'pydoc-info-python-symbol-at-point
   :doc-spec
   '(("(python)Index" pydoc-info-lookup-transform-entry)
     ("(sphinx)Index" pydoc-info-lookup-transform-entry))))

;;; init-python.el ends here
