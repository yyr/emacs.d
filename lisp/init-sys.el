;;; init-sys.el
;; Author: Yagnesh Raghava Yakkala. http://yagnesh.org

;;; top-mode missing?
(ensure-package-installed '(wgrep symon))

;;; http://stackoverflow.com/questions/5562974/emacs-is-it-running-on-laptop-or-on-desktop
;; (require 'battery)
;; (when (and battery-status-function
;;            (not (string-match-p
;;                  "N/A"
;;                  (battery-format
;;                   "%B"
;;                   (funcall battery-status-function)))))
;;   (display-battery-mode 1))

(add-hook 'emacs-startup-hook
          '(lambda nil (display-battery-mode 1)))

;;; init-sys.el ends here
