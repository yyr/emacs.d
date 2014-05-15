;;; init-sass-mode.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;;

(add-hook
 'sass-mode-hook 'ac-css-mode-setup)

(setq scss-compile-at-save nil)

;;; init-sass-mode.el ends here
