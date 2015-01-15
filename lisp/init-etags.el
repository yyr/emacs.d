;;; init-etags.el
;; Author: Yagnesh Raghava Yakkala. http://yagnesh.org
;; Created: Monday, October 24 2011

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
