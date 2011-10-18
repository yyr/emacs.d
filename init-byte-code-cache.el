;;; init-byte-code-cache.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;;    File: init-byte-code-cache.el
;;  Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;; Created: Thursday, May 26 2011
;; License: GPL v3 or later. You should get a copy from <http://www.gnu.org/licenses/gpl.html>

;;; Description:

(when *byte-code-cache-enabled*
  (require 'byte-code-cache))

(setq byte-compile-warnings t)
(setq byte-cache-directory nil)
(setq bcc-enabled-on-save t)
(setq bcc-blacklist '("/\\.recentf$" "/history$" "/\\.ecb-user-layouts\\.el$" "/\\.session$"
                      "/\\.emacs-project$" "/\\.emacs\\.desktop$" "/custom\\.el$" "/init\\.el$"
                      "/\\.ido\\.last$" "/\\.ecb-tip-of-day\\.el$" "/\\.viper$" "/\\.recentf$"))


;; Cite:  steve (sanityinc) emacsd

;;; init-byte-code-cache.el ends here
