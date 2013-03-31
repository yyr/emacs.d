;;----------------------------------------------------------------------------
;; Navigate window layouts with "C-c <left>" and "C-c <right>"
;;----------------------------------------------------------------------------
(winner-mode 1)
(windmove-default-keybindings) ;; Shift+direction

(global-set-key "\M-t" 'other-window)   ; was transpose words
;;; (global-set-key (kbd "<f8>") 'other-window)
(global-set-key (kbd "C-x O") (lambda () (interactive) (other-window -1))) ;; back one
(global-set-key (kbd "C-x C-o") (lambda () (interactive) (other-window 2))) ;; forward t
(global-set-key (kbd "C-c C-o") 'scroll-other-window)

;;----------------------------------------------------------------------------
;; When splitting window, show (other-buffer) in the new window
;;----------------------------------------------------------------------------
(defun split-window-func-with-other-buffer (split-function)
  "dont just dumb split window, change buffer as well"
  (lexical-let ((s-f split-function))
    (lambda ()
      (interactive)
      (funcall s-f)
      (set-window-buffer (next-window) (other-buffer)))))

(global-set-key "\C-x2"
                (split-window-func-with-other-buffer 'split-window-vertically))
(global-set-key "\C-x3"
                (split-window-func-with-other-buffer 'split-window-horizontally))


;;----------------------------------------------------------------------------
;; Rearrange split windows
;;----------------------------------------------------------------------------
(defun split-window-horizontally-instead ()
  (interactive)
  (save-excursion
    (delete-other-windows)
    (funcall (split-window-func-with-other-buffer 'split-window-horizontally))))

(defun split-window-vertically-instead ()
  (interactive)
  (save-excursion
    (delete-other-windows)
    (funcall (split-window-func-with-other-buffer 'split-window-vertically))))

(global-set-key "\C-x|" 'split-window-horizontally-instead)
(global-set-key "\C-x_" 'split-window-vertically-instead)

(global-set-key [f2] (split-window-func-with-other-buffer 'split-window-horizontally))
(global-set-key (kbd "<S-f2>") 'delete-other-windows)

(global-set-key (kbd "M-4") 'split-window-vertically) ; was digit-argument
(global-set-key (kbd "M-3") 'delete-other-windows) ; was digit-argument
;; (global-set-key (kbd "M-s") 'other-window) ; was center-line


;;; I want a key to open the current buffer all over the screen.
;; http://stackoverflow.com/questions/970292/emacs-multiple-columns-one-buffer
(defun all-over-the-screen ()
  (interactive)
  (delete-other-windows)
  (split-window-horizontally)
  (split-window-horizontally)
  (balance-windows)
  (follow-mode t))

;;----------------------------------------------------------------------------
;; transpose buffers
;;----------------------------------------------------------------------------
(defun transpose-buffers (arg)
  "Transpose the buffers shown in two windows."
  (interactive "p")
  (let ((selector (if (>= arg 0) 'next-window 'previous-window)))
    (while (/= arg 0)
      (let ((this-win (window-buffer))
            (next-win (window-buffer (funcall selector))))
        (set-window-buffer (selected-window) next-win)
        (set-window-buffer (funcall selector) this-win)
        (select-window (funcall selector)))
      (setq arg (if (plusp arg) (1- arg) (1+ arg))))))

(global-set-key (kbd "C-<f7>") 'transpose-buffers)

(defun previous-buffer-in-other-window (arg)
  (interactive "P")
  (let ((cb (current-buffer))
        (pb (if (minibufferp (cadr (buffer-list)))
             (caddr (buffer-list))
           (cadr (buffer-list)))))
    (other-window 1)
    (switch-to-buffer pb)
    (when arg
      (transpose-buffers 1))))

(global-set-key (kbd "C-S-<f7>") 'previous-buffer-in-other-window)

;;; setup
;;----------------------------------------------------------------------------
(setq ediff-split-window-function 'split-window-horizontally)


;;; init-windows.el
