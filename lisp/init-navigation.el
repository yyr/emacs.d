;;; init-navigation.el
;; Created: Tuesday, December 13 2011

;; navigation with in buffer related setup

;;; loading
;; ace-jump-mode - navigation by searching
;; jump-char - char type navigation

(el-get 'sync '(ace-jump-mode))

(define-key global-map (kbd "M-l") 'ace-jump-mode)  ; was downcase-word
(define-key global-map (kbd "M-L") 'downcase-word)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-limit 1000)
(setq save-place-file
      (expand-file-name ".save-places" user-emacs-directory))

;;; --- http://whattheemacsd.com/key-bindings.el-02.html
;; Move more quickly
(global-set-key (kbd "C-S-n")
                (lambda ()
                  (interactive)
                  (ignore-errors (next-line 5))))

(global-set-key (kbd "C-S-p")
                (lambda ()
                  (interactive)
                  (ignore-errors (previous-line 5))))

(global-set-key (kbd "C-S-f")
                (lambda ()
                  (interactive)
                  (ignore-errors (forward-char 5))))

(global-set-key (kbd "C-S-b")
                (lambda ()
                  (interactive)
                  (ignore-errors (backward-char 5))))

(global-set-key (kbd "M-F")
                (lambda ()
                  (interactive)
                  (ignore-errors (forward-word 5))))

(global-set-key (kbd "M-B")
                (lambda ()
                  (interactive)
                  (ignore-errors (backward-word 5))))
;;; ---


;;; View mode on when ever possible
;;----------------------------------------------
(defun my-vi-bind (map)
  (define-key map "j" [down])
  (define-key map "k" [up])
  (define-key map "l" [right])
  (define-key map "h" [left]))

(add-hook 'view-mode-hook
          (lambda ()
            (my-vi-bind view-mode-map)
            (define-key view-mode-map "n" [down])
            (define-key view-mode-map "p" [up])
            (define-key view-mode-map "i" 'read-only-mode)))

(setq view-mode-hook nil)

;;; read only files would be open in view-mode
(setq view-read-only t)
(setq scroll-preserve-screen-position 'always)

;;; highlight current line in view mode
(defadvice view-mode (after disable-hl-line-mode activate)
  (if view-mode
      (hl-line-mode 1)
    (hl-line-mode -1)))

;;; init-navigation.el ends here
