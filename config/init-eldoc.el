;;; init-eldoc.el

(setq eldoc-idle-delay 0)

(dolist (hook (list
               'ielm-mode-hook
               'emacs-lisp-mode-hook
               'lisp-interaction-mode-hook
               'message-mode-hook
               'Info-mode-hook
               'erc-mode-hook
               'org-mode-hook
               ))
  (add-hook hook 'turn-on-eldoc-mode))
(setq eldoc-argument-case 'eldoc-argument-list)

(provide 'init-eldoc)

;;; init-eldoc.el ends here
