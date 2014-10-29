;;; init-smex.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;; License: GPL v3 or later

;; -----------------------------------------------------------------------------
;; ido completion in M-x
;; -----------------------------------------------------------------------------
(el-get 'sync '(smex))

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;;; init-smex.el ends here
