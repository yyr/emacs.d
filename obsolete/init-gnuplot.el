;;; init-gnuplot.el
;; Author: Yagnesh Raghava Yakkala.
;; Website: http://yagnesh.org

(el-get 'sync 'gnuplot-mode)

(autoload 'gnuplot-mode "gnuplot"
  "gnuplot major mode" t)

(autoload 'gnuplot-make-buffer "gnuplot"
  "open a buffer in gnuplot mode" t)
(setq auto-mode-alist
      (append '(("\\.gp$" . gnuplot-mode))
              auto-mode-alist))
;; (global-set-key [(f9)] ’gnuplot-make-buffer)

;;; init-gnuplot.el ends here
