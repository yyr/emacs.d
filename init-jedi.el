;;; init-jedi.el
;;
;; Author: Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: init-jedi.el
;; Created: 水曜日, 10月 31 2012

(el-get 'sync '(deferred
                 jedi))


(defun auto-complete-python-completion-on-dot ()
  (interactive)
  (insert ".")
  (when auto-complete-mode
    (auto-complete '(ac-source-jedi-direct))))

(defun my-jedi-setup ()
  (jedi-mode)
  (jedi:ac-setup)
  (define-key python-mode-map (kbd "<C-tab>") 'jedi:complete)
  (define-key python-mode-map "." 'auto-complete-python-completion-on-dot))

(add-hook 'python-mode-hook 'my-jedi-setup)

;;; init-jedi.el ends here
