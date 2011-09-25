;;; init-ncl.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;;

;;; http://www.ncl.ucar.edu/Applications/editor.shtml
(setq auto-mode-alist (cons '("\.ncl$" . ncl-mode) auto-mode-alist))

(setq ncl-startup-message nil)

;; this line associates ncl-mode with the lisp package that defines it.
(autoload 'ncl-mode "ncl" "ncl-mode for editing ncar graphics" t)

(provide 'init-ncl)
;;; init-ncl.el ends here
