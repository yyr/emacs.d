;;; init-emms.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;;    File: init-emms.el
;;  Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;; Created: Thursday, July 21 2011
;; Licence: GPL v3 or later. You should get a copy from <http://www.gnu.org/licenses/gpl.html>

;;; Description:
;;

(add-to-list 'load-path "~/.emacs.d/el-get/emms/lisp/")

(require 'emms-setup)
(emms-standard)
(emms-default-players)

(setq emms-info-asynchronously nil)
(setq emms-playlist-buffer-name "*Music*")

(setq emms-source-file-default-directory "/dump/MUSIC/Telugu/")

(provide 'init-emms)
;;; init-emms.el ends here
