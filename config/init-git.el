;;: init-git.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;; Licence: GPL v3 or later

(require 'magit) 
(autoload 'magit-status "magit" nil t)

(global-set-key (kbd "M-<f12>") 'magit-status)
(eval-after-load 'magit-mode
  '(progn
     (define-key (kbd "<f7> p") 'magit-push)
     (define-key (kbd "<f7> l")
       'magit-pull)))

(autoload 'rebase-mode "rebase-mode" nil t)

(provide 'init-git)
;;; init-git.el ends here
