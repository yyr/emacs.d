;;; init-color-theme.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;; License: GPL v3 or later

;; (set-background-color "black")
;; (set-face-background 'default "black")
;; (set-face-background 'region "black")
;; (set-face-foreground 'default "white")
;; (set-face-foreground 'region "gray60")
;; (set-foreground-color "white")
;; (set-cursor-color "red")

;; init color-theme.el
(require 'color-theme-autoloads)
(color-theme-initialize)

(if (equal *system* "laptop")
    (setq *my-theme* "zenburn")
  (setq *my-theme* "unknown"))

(if (equal *my-theme* "zenburn")
    (progn
      (require 'zenburn)
      (color-theme-zenburn)))


(provide 'init-color-theme)
;;; init-color-theme.el ends here
