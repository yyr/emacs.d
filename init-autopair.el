;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@NOSPAM.live.com>
;; License: GPL v3 or later

;; -----------------------------------------------------------------------------
;; autopair.el
;; -----------------------------------------------------------------------------

(require 'autopair)
(autopair-global-mode 1) ;; enable autopair in all buffers
(add-hook 'emacs-lisp-mode-hook #'(lambda ()
                                    (setq autopair-dont-activate t)))

;;; init-autopair.el ends here
