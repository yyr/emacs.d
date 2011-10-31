;;; init-org-diary.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;;    File: init-org-diary.el
;;  Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;; Created: Friday, June 17 2011
;; License: GPL v3 or later. You should get a copy from <http://www.gnu.org/licenses/gpl.html>

;;; Description:

(setq org-agenda-include-diary nil)
(setq org-agenda-diary-file "~/git/org/diary.org")

;; put diary in org notes folder instead of home folder
(setq diary-file "~/git/org/diary")

;;; diary supplement Nick Dokos org-mode mailing list
;;; location: sapporo
(setq calendar-latitude +43.0)
(setq calendar-longitude +141.21)

(defun diary-sunrise ()
  (let ((dss (diary-sunrise-sunset)))
    (with-temp-buffer
      (insert dss)
      (goto-char (point-min))
      (search-forward ",")
      (buffer-substring (point-min) (match-beginning 0)))))

(defun diary-sunset ()
  (let ((dss (diary-sunrise-sunset))
        start end)
    (with-temp-buffer
      (insert dss)
      (goto-char (point-min))
      (search-forward ", ")
      (setq start (match-end 0))
      (search-forward " at")
      (setq end (match-beginning 0))
      (goto-char start)
      (capitalize-word 1)
      (buffer-substring start end))))


;;; init-org-diary.el ends here
