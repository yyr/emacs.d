;;; init-info.el
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;; License: GPL v3 or later

;;; Commentary:
;; info , searching docs, short cuts

(require 'info-look)
(add-to-list 'Info-additional-directory-list "~/.emacs.d/my-info/")

;;; this work around is needed if emacs is in non standard directory and
;;; INFOPATH is set.
(if (getenv "INFOPATH")
    (dolist (dir Info-default-directory-list)
      (add-to-list 'Info-additional-directory-list dir)))

;;; init-info.el ends here
