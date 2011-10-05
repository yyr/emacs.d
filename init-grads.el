;;; init-grads.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;; License: GPL v3 or later

(autoload 'gs-mode "gs-mode" nil t)
(autoload 'ctl-mode "ctl-mode" nil t)

(add-to-list 'auto-mode-alist '("\\.gs$" . gs-mode))
(add-to-list 'auto-mode-alist '("\\.ctl$" . ctl-mode))

(provide 'init-grads)
;;; init-grads.el ends here