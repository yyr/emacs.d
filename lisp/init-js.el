;;; init-js.el
;; Author: Yagnesh Raghava Yakkala. http://yagnesh.org
;; Created: Thursday, November 21 2013

;;; missing company-tern
(ensure-package-installed '(js2-mode
                            js2-refactor
                            xref-js2
                            websocket
                            kite-mini))

(add-to-list 'auto-mode-alist '("\\.\\(js\\|jsx\\)$" . js2-mode))
(add-hook 'js2-mode-hook #'js2-refactor-mode)

(js2r-add-keybindings-with-prefix "C-c C-m")
(setq js2-basic-offset 2)

;; (define-key js2-mode-map (kbd "C-k") #'js2r-kill)

;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; unbind it.
(define-key js-mode-map (kbd "M-.") nil)

(add-hook 'js2-mode-hook (lambda ()
                           (add-hook 'xref-backend-functions
                                     #'xref-js2-xref-backend nil t)
                           ;; (add-to-list 'company-backends 'company-tern)
                           ;; (tern-mode 1)
                           (kite-mini-mode 1)))

;; Disable completion keybindings, as we use xref-js2 instead
(add-hook 'tern-mode-hook (lambda ()
                            (define-key tern-mode-keymap (kbd "M-.") nil)
                            (define-key tern-mode-keymap (kbd "M-,") nil)))

;;; init-js.el ends here
