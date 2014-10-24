;;; auto-complete mode

(el-get 'sync '(auto-complete
                ac-math
                ac-octave))

(ac-config-default)

(add-to-list 'completion-styles 'initials t)
(add-to-list 'ac-sources 'ac-source-semantic)

(setq-default ac-sources (cons 'ac-source-yasnippet ac-sources))

;;; customizations
(setq ac-auto-start 2
      ac-delay 0.
      ac-quick-help-delay 0.
      ac-use-fuzzy t
      tab-always-indent 'complete ; use 'complete when auto-complete is disabled
      ac-dwim t)

(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)
;; (define-key ac-completing-map   "\M-/"  'ac-stop)
(define-key ac-completing-map   "\t"    'ac-expand-common)
(define-key ac-completing-map (kbd "RET") 'ac-complete)

;;; work around for autopair auto-complete
(define-key ac-completing-map [return] 'ac-complete)
(add-hook 'auto-complete-mode-hook 'ac-flyspell-workaround)

;;; list of modes where ac should be available
(dolist (mode '(emacs-lisp-mode
                lisp-interaction-mode
                inferior-emacs-lisp-mode
                magit-log-edit-mode
                log-edit-mode
                org-mode
                text-mode
                haml-mode
                sass-mode
                yaml-mode
                haskell-mode
                html-mode
                nxml-mode
                sh-mode
                lisp-mode
                textile-mode
                markdown-mode
                cperl-mode
                sass-mode
                latex-mode
                fortran-mode
                f90-mode))

  (add-to-list 'ac-modes mode))

;;; configuration of ac-sources
;; define  sources for ielm
(add-hook 'ielm-mode-hook 'ac-emacs-lisp-mode-setup)

;;; init-auto-complete.el ends here
