;;; init-font.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;;

(defun abstract-screen-width ()
  (cond ((eq 'x window-system) (x-display-pixel-width))
        ((eq 'w32 window-system) (display-pixel-width))
        ((eq 'ns window-system) (display-pixel-width))))

(defun perfect-font-size (pixels)
  (cond
   ((<= pixels 1024) 95)
   ((<= pixels 1366) 100)
   ((> pixels 1366) 110)))

(when (window-system)
  (set-face-attribute 'default nil
                      :height (perfect-font-size (abstract-screen-width))
                      :width 'extra-condensed
                      :weight 'light))

;; (set-default-font  "-adobe-courier-medium-r-normal--18-100-75-75-m-90-iso8859-1")
;; (set-face-attribute 'default nil :family "Inconsolata" :height 110)
;; (set-face-attribute 'default nil :family "Anonymous Pro" :height 110)
;; (set-default-font "-Misc-Fixed-Medium-R-Normal--10-100-75-75-C-90-ISO8859-1")

;; font-size
;; ---------
;; Sometimes you just feel like a larger, bolder font.  Other times you
;; want something a little smaller to get the big picture.  These adjust
;; the current display font size by a step in either direction.
;;
(defun font-increase ()
  "Make the current display font size a step larger."
  (interactive)
  (set-face-attribute 'default nil
                      :height (+ (face-attribute 'default :height) 10))
  (message "Font size: %s" (face-attribute 'default :height)))
(define-key global-map [(control ?z) ?=] 'font-increase)      ; Bind to C-z =

(defun font-decrease ()
  "Make the current display font size a step smaller."
  (interactive)
  (set-face-attribute 'default nil
                      :height (- (face-attribute 'default :height) 10))
  (message "Font size: %s" (face-attribute 'default :height)))
(define-key global-map [(control ?z) ?-] 'font-decrease)      ; Bind to C-z -


;;; init-font.el ends here
