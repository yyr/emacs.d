;;; init-info.el
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@NOSPAM.live.com>
;; License: GPL v3 or later

;;; Commentary:
;; info , searching docs, short cuts

(require 'info-look)

;;; FIXME
(add-hook 'Info-mode-hook       ; After Info-mode has started
          (lambda ()
            (setq Info-additional-directory-list Info-default-directory-list)))

;;; init-info.el ends here
