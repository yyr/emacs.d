;;; init-flyspell.el

;;; dont use M-TAB for flyspell , I reserve it for other LaTex mode
(after 'flyspell
       (setq flyspell-use-meta-tab nil)
       (define-key flyspell-mode-map "\M-\t" nil)
       (define-key flyspell-mode-map [(control .)] nil))

;;; turn on flyspell mode
(dolist (hook '(org-mode-hook
                text-mode-hook
                erc-mode-hook
                message-mode-hook))
  (add-hook hook (lambda ()
                   (flyspell-mode 1))))

;;; for prog modes turn on flyspell-prog-mode (checks spell only in comments)
(dolist (hook '(lisp-mode-hook
                emacs-lisp-mode-hook
                ruby-mode-hook
                yaml-mode
                python-mode-hook
                shell-mode-hook
                php-mode-hook
                css-mode-hook
                nxml-mode-hook
                crontab-mode-hook
                perl-mode-hook
                javascript-mode-hook
                LaTeX-mode-hook))
  (add-hook hook 'flyspell-prog-mode))

(add-hook 'nxml-mode-hook
          (lambda ()
            (add-to-list 'flyspell-prog-text-faces 'nxml-text-face)))

(global-set-key (kbd "C-<f8>")
                'flyspell-check-previous-highlighted-word)

;;; init-flyspell.el ends here
