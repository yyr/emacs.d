;;; init-mediawiki.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: init-mediawiki.el
;; Created: Sunday, April  1 2012
;; License: GPL v3 or later. <http://www.gnu.org/licenses/gpl.html>

;;; Description:
;;
(el-get 'sync '(mediawiki))

(require 'mediawiki)

(setq mediawiki-mode-hook (lambda ()
                            (visual-line-mode 1)
                            (define-key mediawiki-mode-map
                              (kbd "C-c o") 'mediawiki-browse)))

;;; init-mediawiki.el ends here
