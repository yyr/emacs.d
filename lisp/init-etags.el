;;; init-etags.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: init-ctags.el
;; Created: Monday, October 24 2011
;; License: GPL v3 or later. <http://www.gnu.org/licenses/gpl.html>

;;; Description:
;; setting  for tags

(defun find-tag-at-point ()
  "find out tag at point with out confirmation"
  (interactive)
  (let ((tap (thing-at-point 'symbol)))
    (if tap
        (find-tag tap)
      (call-interactively 'find-tag))))

(global-set-key (kbd "M-.") 'find-tag-at-point)

;;; init-etags.el ends here
