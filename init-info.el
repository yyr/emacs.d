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

(when (file-exists-p (concat my-info-dir "python.info"))
  (el-get 'sync 'pydoc-info)
  (info-lookup-add-help
   :mode 'python-mode
   :parse-rule 'pydoc-info-python-symbol-at-point
   :doc-spec
   '(("(python)Index" pydoc-info-lookup-transform-entry)
     ("(sphinx)Index" pydoc-info-lookup-transform-entry))))

;;; init-info.el ends here
