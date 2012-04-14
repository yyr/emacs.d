;;; loading
(el-get 'sync '(autopair))

(require 'autopair)

;;; setup
(setq autopair-wrap-action t)

(autopair-global-mode 1) ;; enable autopair in all buffers

;;; init-autopair.el ends here
