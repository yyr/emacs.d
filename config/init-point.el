;;; init-point.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: init-point.el
;;  Author: Yagnesh Raghava Yakkala <yagnesh@NOSPAM.live.com>
;; Created: Tuesday, August 30 2011
;; Licence: GPL v3 or later. You should get a copy from <http://www.gnu.org/licenses/gpl.html>

;;; Description:


;; point-stack
;; -----------
;; Alternative *simple* mechanism for recording points and buffers and
;; switching back to them later.  Points are stored on a stack with push
;; and pop bound to really easy keys for quick use.  If something heavier
;; duty is needed, use registers (C-x r SPC and C-x r j).
;;
(defvar point-stack nil
  "Stack to store point locations")
(defun push-point ()
  "Push the current point onto the stack."
  (interactive)
  (setq point-stack (cons (point-marker) point-stack)))
(define-key global-map [(control ?z) ?,] 'push-point)         ; Bind to C-z ,
(defun pop-point ()
  "Try to pop a point from the stack and return to it."
  (interactive)
  (if (not (null point-stack))
      (let ((m (car point-stack)))
        (setq point-stack (cdr point-stack))
        (if (not (marker-buffer m))
            (pop-point)
          (switch-to-buffer (marker-buffer m))
          (goto-char m)))))
(define-key global-map [(control ?z) ?.] 'pop-point)          ; Bind to C-z .


(provide 'init-point)
;;; init-point.el ends here
