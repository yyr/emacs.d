;;; init-frame.el
;; Author: Yagnesh Raghava Yakkala. http://yagnesh.org

;; full screen
(ensure-package-installed 'smart-mode-line)

;;; http://stackoverflow.com/a/7763907
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

(add-hook 'after-init-hook 'sml/setup)

(setq rm-blacklist
      '(" AC" " Abbrev"
        " Fill" " hl-p" " Rbow" " yas"
        " ElDoc" " Fly" " Paredit" " SliNav"
        " GitGutter" " company" " MRev"
        " zx" " Ref" " Outl"
        " Ind" " Guide" " Compiling"))

;; (setq sml/show-client t)
;; (sml/apply-theme 'automatic)

;;; init-frame.el ends here
