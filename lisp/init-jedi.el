;;; init-jedi.el
;; Author: Yagnesh Raghava Yakkala. http://yagnesh.org
;; Created: 水曜日, 10月 31 2012

(el-get 'sync '(deferred
                 jedi))

(defun my-jedi-setup ()
  (auto-complete-mode 1)
  (setq jedi:complete-on-dot t)
  (setq jedi:setup-keys t)
  (require 'jedi)
  (jedi:setup))

(add-hook 'python-mode-hook 'my-jedi-setup)
(add-hook 'inferior-python-mode-hook 'my-jedi-setup)

;;; init-jedi.el ends here
