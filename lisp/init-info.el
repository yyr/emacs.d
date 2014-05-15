;;; init-info.el
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;; License: GPL v3 or later

;;; Commentary:
;; info , searching docs, short cuts

(require 'info-look)
(setq my-info-dir "~/git/info-collection/")
(add-to-list 'Info-additional-directory-list my-info-dir)

;;; this work around is needed if emacs is in non standard directory and
;;; INFOPATH is set.
(when (getenv "INFOPATH")
  (dolist (dir Info-default-directory-list)
    (add-to-list 'Info-additional-directory-list dir)))

;;; init-info.el ends here
