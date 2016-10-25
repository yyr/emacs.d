;;; init-python.el
;; Author: Yagnesh Raghava Yakkala. http://yagnesh.org
;; Created: Friday, July 22 2011

(el-get 'sync '(pylookup
                highlight-indentation
                sphinx-doc
                company-jedi
                py-isort))

;;; plakes8, isort, yapf

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi)
  (require 'sphinx-doc)
  (require 'py-yapf)
  (require 'py-isort)
  (sphinx-doc-mode 1)
  (py-yapf-enable-on-save)
  (add-hook (make-local-variable 'before-save-hook) 'py-isort-before-save))
(add-hook 'python-mode-hook 'my/python-mode-hook)

;;; --------------------------------------------------------------------
;;; Auto Completion
;;; --------------------------------------------------------------------
;(load "init-jedi")

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
