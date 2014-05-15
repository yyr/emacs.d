;;; init-cedet.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: init-cedet.el
;; Created: Saturday, October 29 2011
;; License: GPL v3 or later. <http://www.gnu.org/licenses/gpl.html>

;;; Description:
;;

(el-get 'sync 'cedet)
(unless (featurep 'cedet)
  (when (file-directory-p "~/.emacs.d/el-get/cedet")
    (progn
      (add-to-list 'load-path  "~/.emacs.d/el-get/cedet")
      (load-file "~/.emacs.d/el-get/cedet/cedet-devel-load.el"))))

;;; ede
(setq semantic-default-submodes
      '(;; cache(?)
        global-semanticdb-minor-mode

        global-semantic-highlight-edits-mode
        global-semantic-idle-local-symbol-highlight-mode
        global-cedet-m3-minor-mode

        ;; code helpers
        global-semantic-idle-scheduler-mode
        global-semantic-idle-summary-mode
        global-semantic-idle-completions-mode

        ;; eye candy
        ;; global-semantic-decoration-mode
        ;; global-semantic-highlight-func-mode
        ;; global-semantic-highlight-edits-mode
        ;; global-semantic-stickyfunc-mode

        ;; debugging semantic itself
        ;;global-semantic-show-parser-state-mode 1   ;; show the parsing state in the mode line
        ;;global-semantic-show-unmatched-syntax-mode 1
        ))

(global-ede-mode 1)

(defun my-cedet-hook ()
  (require 'semantic/senator)
  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
  (local-set-key (kbd "C-.") 'semantic-ia-fast-jump))

(dolist (hook
         '(python-mode-hook
           c-mode-hook
           fortran-mode-hook
           emacs-lisp-mode-hook
           c-mode-hook
           f90-mode-hook))
  (add-hook hook 'my-cedet-hook))

;;; init-cedet.el ends here
