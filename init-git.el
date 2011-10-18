;;: init-git.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;; License: GPL v3 or later

(eval-after-load "vc-mode"
  '(progn
     (require 'magit)
     (define-key (kbd "<f7> p") 'magit-push)
     (define-key (kbd "<f7> l") 'magit-pull)))

(autoload 'magit-status "magit" nil t)
(global-set-key (kbd "M-<f12>") 'magit-status)

(autoload 'rebase-mode "rebase-mode" nil t)


;;; init-git.el ends here
