;;; init-linum.el

;; (global-linum-mode 1)

(dolist (hook (list
               'c-mode-hook
               'emacs-lisp-mode-hook
               'lisp-interaction-mode-hook
               'lisp-mode-hook
               'emms-playlist-mode-hook
               'java-mode-hook
               'asm-mode-hook
               'haskell-mode-hook
               'rcirc-mode-hook
               'emms-lyrics-mode-hook
               'erc-mode-hook
               'sh-mode-hook
               'makefile-gmake-mode-hook
               ))
  (add-hook hook (lambda () (linum-mode 1))))


;;; init-linum.el ends here
