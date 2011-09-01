;;----------------------------------------------------------------------------
;; Add spell-checking in comments for all programming language modes
;;----------------------------------------------------------------------------

;;; dont use M-TAB for flyspell
(setq flyspell-use-meta-tab nil)

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
                org-mode
                LaTeX-mode-hook))
  (add-hook hook 'flyspell-prog-mode))

(add-hook 'nxml-mode-hook
          (lambda ()
            (add-to-list 'flyspell-prog-text-faces 'nxml-text-face)))

(provide 'init-flyspell)
