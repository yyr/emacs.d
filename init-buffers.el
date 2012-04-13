;;; init-buffers.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: init-buffers.el
;; Created: Tuesday, August 30 2011
;; License: GPL v3 or later. You should get a copy from <http://www.gnu.org/licenses/gpl.html>

;;; Description:
;;

(require 'uniquify)       ; Smarter buffer naming than x<1>, x<2>, ...
(setq uniquify-buffer-name-style 'post-forward-angle-brackets
      uniquify-after-kill-buffer-p t
      uniquify-ignore-buffers-re "^\\*")

;;; Ibuffer
;; bs instead of buffer-menu
;; (global-set-key (kbd "C-x C-b") 'bs-show)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(setq ibuffer-expert t)
(setq ibuffer-show-empty-filter-groups nil)

(setq ibuffer-shrink-to-minimum-size t)
(setq ibuffer-always-show-last-buffer nil)
(setq ibuffer-sorting-mode 'recency)

;; (setq ibuffer-saved-filter-groups
;;       '(("home"
;;          ("Org" (or (mode . org-mode)
;;                     (filename . "OrgMode")))
;;          ("star"  (name . "\*.*\*")))))

(add-hook 'ibuffer-mode-hook
          '(lambda ()
             (ibuffer-auto-mode 1)))


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


(defun kill-star-buffers ()
 "kill all those starred buffers.
FIXME: make an exceptions for few buffers like gnus, emms"
  (interactive)
  (mapc (lambda (buf)
          (if (string-match "^\*.*\*$" (buffer-name buf))
              (kill-buffer buf)))
        (buffer-list)))
(define-key global-map
  [(control ?z) (control ?k)] 'kill-star-buffers) ; Bind to C-z C-k

;;; kill current buffer
(global-set-key (kbd "M-k") (lambda ()
                              (interactive)
                              (kill-buffer (buffer-name))))


;;; init-buffers.el ends here
