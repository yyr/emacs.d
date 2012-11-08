;;; init-navigation.el
;;
;;    File: init-navigation.el
;; Created: Tuesday, December 13 2011

;;; Description:
;; navigation with in buffer related setup

;;; loading
;; ace-jump-mode - navigation by searching
;; jump-char - char type navigation

(el-get 'sync '(ace-jump-mode
                jump-char))

(define-key global-map (kbd "M-L") 'ace-jump-mode)

;;; faster C-n C-p
(global-set-key (kbd "C-S-n") (kbd "C-6 C-n"))
(global-set-key (kbd "C-S-p") (kbd "C-6 C-p"))


;;; View mode on when ever possible
;;----------------------------------------------
(defun my-vi-bind (map)
  (define-key map "j" [down])
  (define-key map "k" [up])
  (define-key map "l" [right])
  (define-key map "h" [left]))

(add-hook 'view-mode-hook
          '(lambda ()
             (my-vi-bind view-mode-map)))

(define-key ctl-x-map "\M-q" 'view-mode)

;;; read only files would be open in view-mode
(setq view-read-only t)
(setq scroll-preserve-screen-position 'always)

;;; highlight current line in view mode
(defadvice view-mode (after disable-hl-line-mode activate)
  (if view-mode
      (hl-line-mode 1)
    (hl-line-mode -1)))

;;; from taking off help-mode
(defadvice find-function-search-for-symbol
  (after oxy-adv1 last (symbol type library) activate)
  (with-current-buffer (car ad-return-value)
    (view-mode 1)))

(defadvice find-variable-noselect
  (after oxy-adv2 last (variable &optional file) activate)
  (with-current-buffer (car ad-return-value)
    (view-mode 1)))

;;; init-navigation.el ends here
