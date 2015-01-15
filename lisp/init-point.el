;;; init-point.el
;; Author: Yagnesh Raghava Yakkala. http://yagnesh.org
;; Created: Tuesday, August 30 2011

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
  (setq point-stack (cons (point-marker) point-stack))
  (message "point pushed"))

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
          (goto-char m))
        (message "point poped"))
    (message "No point in the stack")))

(define-key global-map [(control ?z) ?.] 'pop-point)          ; Bind to C-z .


;;; Cursor Look

(defun th-activate-mark-init ()
  (setq cursor-type 'bar))
(add-hook 'activate-mark-hook 'th-activate-mark-init)

(defun th-deactivate-mark-init ()
  (setq cursor-type 'box))
(add-hook 'deactivate-mark-hook 'th-deactivate-mark-init)

;; Change cursor color according to mode based on the following link
;;;http://emacs-fu.blogspot.de/2009/12/changing-cursor-color-and-shape.html
(setq yyr-read-only-color       "blue")
(setq yyr-overwrite-color       "red")
(setq yyr-normal-color          "green")

(setq yyr-read-only-cursor-type 'box)
(setq yyr-overwrite-cursor-type 'bar)
(setq yyr-normal-cursor-type    'box)

(defun yyr-set-cursor-according-to-mode ()
  "change cursor color and type according to some minor modes."
  (cond
   (buffer-read-only
    (set-cursor-color yyr-read-only-color)
    (setq cursor-type yyr-read-only-cursor-type))
   (overwrite-mode
    (set-cursor-color yyr-overwrite-color)
    (setq cursor-type yyr-overwrite-cursor-type))
   (t
    (set-cursor-color yyr-normal-color)
    (setq cursor-type yyr-normal-cursor-type))))

(add-hook 'post-command-hook 'yyr-set-cursor-according-to-mode)

;;; init-point.el ends here
