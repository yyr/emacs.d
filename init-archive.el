;;; init-archive.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: init-archive.el
;;  Author: Yagnesh Raghava Yakkala <yagnesh@NOSPAM.live.com>
;; Created: Saturday, September 10 2011
;; License: GPL v3 or later.
;;  You should get a copy from <http://www.gnu.org/licenses/gpl.html>


;;; Description:
;; functions that are not using anymore

;;----------------------------------------------------------------------------
;; Easy way to check that we're operating on a specific file type
;;----------------------------------------------------------------------------
(defun filename-has-extension-p (extensions)
  (and buffer-file-name
       (string-match (concat "\\." (regexp-opt extensions t) "\\($\\|\\.\\)") buffer-file-name)))

;;----------------------------------------------------------------------------
;; Locate executables
;;----------------------------------------------------------------------------
(defun find-executable (name)
  "Return the full path of an executable file name `name'
in `exec-path', or nil if no such command exists"
  (locate-file name exec-path nil 'file-executable-p))

;;----------------------------------------------------------------------------
;; Handier way to add modes to auto-mode-alist
;;----------------------------------------------------------------------------
(defun add-auto-mode (mode &rest patterns)
  (dolist (pattern patterns)
    (add-to-list 'auto-mode-alist (cons pattern mode))))


;;; init-archive.el ends here
