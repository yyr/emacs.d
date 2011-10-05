;;; init-ecb.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: init-ecb.el
;;  Author: Yagnesh Raghava Yakkala <yagnesh@NOSPAM.live.com>
;; Created: Tuesday, October  4 2011
;; License: GPL v3 or later. <http://www.gnu.org/licenses/gpl.html>

;;; Description:
;; ecb (do i really need this.?)

(setq stack-trace-on-error t)

(add-to-list 'load-path
             "~/.emacs.d/el-get/ecb")
(require 'ecb)

(global-set-key (kbd "s-<f10>") 'ecb-activate)

(provide 'init-ecb)
;;; init-ecb.el ends here
