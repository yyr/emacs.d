;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;; License: GPL v3 or later
;;

;; full screen
(defun fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
                       (if (frame-parameter nil 'fullscreen) nil 'fullboth)))
(global-set-key [f11] 'fullscreen)

;;; http://stackoverflow.com/questions/7763847/maximize-emacs-on-start-upnot-the-fullscreen/7763907#7763907
(defun max-emacs-x-window (&optional f)
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                         '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                         '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))

(when (eq 'x window-system )
    (max-emacs-x-window))

;;; init-frame.el ends here
