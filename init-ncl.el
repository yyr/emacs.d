;;; init-ncl.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;;

;;; http://www.ncl.ucar.edu/Applications/editor.shtml
(setq auto-mode-alist (cons '("\.ncl$" . ncl-mode) auto-mode-alist))

;; this line associates ncl-mode with the lisp package that defines it.
(autoload 'ncl-mode "ncl" "ncl-mode for editing ncar graphics" t)

;; a hook is a list of functions that get executed under certain
;; conditions.
;; (add-hook 'ncl-mode-hook
;;           (lambda ()  ; lambda is an anonymous function. e.g. has no name.
;;             ;; highlight comments
;;             (set-face-foreground font-lock-comment-face "FireBrick")
;;             ;; highlight strings
;;             (set-face-foreground font-lock-string-face "Salmon")
;;             ;; highlight keywords, array descriptors, and tests
;;             (set-face-foreground font-lock-keyword-face "Purple")
;;             ;; highlight built-in functions
;;             (set-face-foreground font-lock-builtin-face "Blue")
;;             ;; highlight gsn* functions
;;             (set-face-foreground font-lock-variable-name-face "SteelBlue")
;;             ;; highlight shea_util and contributed functions
;;             (set-face-foreground font-lock-function-name-face  "CadetBlue")
;;             ;; highlight resources
;;             (set-face-foreground font-lock-constant-face  "ForestGreen")
;;             )
;;           )

(provide 'init-ncl)
;;; init-ncl.el ends here
