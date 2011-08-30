;;; init-buffers.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: init-buffers.el
;;  Author: Yagnesh Raghava Yakkala <yagnesh@NOSPAM.live.com>
;; Created: Tuesday, August 30 2011
;; Licence: GPL v3 or later. You should get a copy from <http://www.gnu.org/licenses/gpl.html>

;;; Description:
;;

(require 'uniquify)                                           ; Smarter buffer naming than x<1>, x<2>, ...
(setq uniquify-buffer-name-style 'post-forward
      uniquify-after-kill-buffer-p t
      uniquify-ignore-buffers-re "^\\*")

;; kill-other-buffers
;; ------------------

;; Emacs buffers multiply faster than rabbits.  They were
;; regenerating faster than I could kill them so I wrote this.  Run this
;; macro to kill all but the active buffer and the unsplit the window if
;; need be.
;;

(defun kill-other-buffers ()
  "Kill all buffers except the current and unsplit the window."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))) ; Delete other buffers
  (delete-other-windows)           ; And then unsplit the current window...
  (delete-other-frames))           ; ...and remove other frames, too.
(define-key global-map [(control ?z) ?k] 'kill-other-buffers) ; Bind to C-z k

(provide 'init-buffers)
;;; init-buffers.el ends here
