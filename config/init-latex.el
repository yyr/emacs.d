;; -----------------------------------------------------------------------------
;; LATEX stuff
;; -----------------------------------------------------------------------------

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

;;(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

(add-hook 'LaTeX-mode-hook
          (lambda()
            (define-key LaTeX-mode-map (kbd "<S-tab>") 'TeX-complete-symbol)
            (TeX-PDF-mode t)
            (setq TeX-save-query  nil )
            (setq TeX-show-compilation t)))

(add-hook 'LaTeX-mode-hook
          (lambda ()
            (imenu-add-menubar-index)
            (turn-on-reftex)
            (turn-on-auto-fill)))

(provide 'init-latex)
