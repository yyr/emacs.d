;;; init-emms.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;;    File: init-emms.el
;;  Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;; Created: Thursday, July 21 2011
;; License: GPL v3 or later. You should get a copy from <http://www.gnu.org/licenses/gpl.html>

;;; Description:
;;

(add-to-list 'load-path "~/.emacs.d/el-get/emms/lisp/")

(require 'emms-setup)
(emms-standard)
(emms-default-players)

(setq-default
 emms-info-asynchronously nil
 emms-playlist-buffer-name "*Music*"
 emms-source-file-default-directory "/dump/MUSIC/Telugu/"
 emms-directory "~/.emms/")

(global-set-key (kbd "<f7> p") 'emms-play-directory-tree)
(global-set-key (kbd "<f7> t") 'emms-toggle-repeat-playlist)
(global-set-key (kbd "<f7> o") '(lambda ()
                                  (interactive)
                                  (switch-to-buffer "*Music*")))
(global-set-key (kbd "<f7> P") 'emms-pause)
(global-set-key (kbd "<f7> a") 'emms-add-playlist-directory)
(global-set-key (kbd "<f7> A") 'emms-add-playlist-directory-tree)

(provide 'init-emms)
;;; init-emms.el ends here