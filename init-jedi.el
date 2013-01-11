;;; init-jedi.el
;;
;; Author: Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: init-jedi.el
;; Created: 水曜日, 10月 31 2012

(el-get 'sync '(deferred
                 jedi))

(defun my-jedi-setup ()
  (setq jedi:complete-on-dot t)
  (setq jedi:setup-keys t)
  (require 'jedi)
  (jedi:setup))

(add-hook 'python-mode-hook 'my-jedi-setup)

;;; init-jedi.el ends here
