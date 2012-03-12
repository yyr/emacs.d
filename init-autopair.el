;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;; License: GPL v3 or later

;; -----------------------------------------------------------------------------
;; autopair.el
;; -----------------------------------------------------------------------------

(require 'autopair)
(autopair-global-mode 1) ;; enable autopair in all buffers

(defadvice autopair-on (after autopair-newline-disable activate)
  (local-unset-key (kbd "RET")))


;;; init-autopair.el ends here
