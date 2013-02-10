;;; init-python.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;;    File: init-python.el
;; Created: Friday, July 22 2011
;; License: GPL v3 or later. You should get a copy from <http://www.gnu.org/licenses/gpl.html>

;;; Description:

(el-get 'sync '(pylookup
                highlight-indentation))

(load "init-jedi")

;;; --------------------------------------------------------------------
;; pylookup
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

;;; ipython
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

;;; init-python.el ends here
