;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;; License: GPL v3 or later
;;

;; full screen

;;; http://stackoverflow.com/questions/7763847/maximize-emacs-on-start-upnot-the-fullscreen/7763907#7763907
(defun max-emacs-x-window (&optional f)
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                         '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                         '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))

(add-hook 'emacs-startup-hook
          (lambda ()
            (if (fboundp 'toggle-frame-maximized)
                (when (eq 'x window-system)
                  (toggle-frame-maximized))
              (max-emacs-x-window))))

;; (set-frame-parameter (selected-frame) 'alpha '(100 95))
;; (add-to-list 'default-frame-alist '(alpha 100 95))

;;; init-frame.el ends here
