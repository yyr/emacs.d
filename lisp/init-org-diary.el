;;; init-org-diary.el
;; Yagnesh Raghava Yakkala. http://yagnesh.org
;; Created: Friday, June 17 2011

(ensure-package-installed 'japanese-holidays)

(setq org-agenda-include-diary nil)
(setq org-agenda-diary-file "~/git/org/life/diary.org")

;; put diary in org notes folder instead of home folder
(setq diary-file "~/git/org/life/d")

;;; diary supplement Nick Dokos org-mode mailing list
;;; location: sapporo
(setq calendar-latitude +18.52)
(setq calendar-longitude +73.85)

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

(eval-after-load "calendar"
  `(progn
     (define-key calendar-mode-map "f" 'calendar-forward-day)
     (define-key calendar-mode-map "b" 'calendar-backward-day)
;     (require 'japanese-holidays)
     (setq diary-number-of-entries 31)
     (setq calendar-weekend-marker 'diary)
     (setq mark-holidays-in-calendar t)
     (setq calendar-holidays
;           (append japanese-holidays holiday-local-holidays holiday-other-holidays)
           (append holiday-local-holidays holiday-other-holidays))))

;; (add-hook 'today-visible-calendar-hook 'calendar-mark-weekend)
;; (add-hook 'today-invisible-calendar-hook 'calendar-mark-weekend)

;;; init-org-diary.el ends here
