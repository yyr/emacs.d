;;; init-font.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;;

(when on-laptop
  (set-face-attribute 'default nil
                      :height 108
                      :width 'extra-condensed
                      :family "DejaVu Sans Mono"
                      ))

;; (set-default-font
;; "-adobe-courier-medium-r-normal--18-100-75-75-m-90-iso8859-1")

;; (set-face-attribute 'default nil :family "Inconsolata" :height 110)

;; (custom-set-faces
;;  '(default ((t (:slant normal
;;             :weight light
;;             :height 95
;;             :width extra-condensed
;;             :foundry "unknown"
;;             :family "DejaVu Sans Mono")))))

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


(provide 'init-font)
;;; init-font.el ends here
