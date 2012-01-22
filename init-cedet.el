;;; init-cedet.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: init-cedet.el
;; Created: Saturday, October 29 2011
;; License: GPL v3 or later. <http://www.gnu.org/licenses/gpl.html>

;;; Description:
;;

(when (file-directory-p "~/.emacs.d/el-get/cedet")
  (progn
    (add-to-list 'load-path  "~/.emacs.d/el-get/cedet")
    (load-file "~/.emacs.d/el-get/cedet/cedet-devel-load.el")
    (semantic-mode 1)
    (global-ede-mode 1)
    (require 'semantic/sb)
    (semantic-mode 1)))

;;; init-cedet.el ends here
