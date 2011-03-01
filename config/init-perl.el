;; -----------------------------------------------------------------------------
;; Perl Stuff (Cperl-mode)
;; -----------------------------------------------------------------------------
(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\|al\\)\\'" . cperl-mode))
(defalias 'perl-mode 'cperl-mode)

;; more robust way of doing (emacswiki)
(mapc
 (lambda (pair)
   (if (eq (cdr pair) 'perl-mode)
       (setcdr pair 'cperl-mode)))
 (append auto-mode-alist interpreter-mode-alist))

(add-hook 'cperl-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-h f") 'cperl-perldoc)))

(add-hook 'cperl-mode-hook
  (lambda ()
    (setq cperl-hairy nil
          cperl-highlight-variables-indiscriminately t
          cperl-auto-newline t
	  cperl-electric-keywords t
          cperl-auto-newline-after-colon t
          cperl-electric-keywords t
          cperl-electric-linefeed t
	  abbrev-mode nil
          cperl-regexp-scan nil
;;	  autopair-dont-activate t
          cperl-electric-parens nil)))  ;; <------ electric parens!   cperl-electric-parens t


;;info thing
(global-set-key (kbd "<f9> p") (lambda ()
				 (interactive)
				 (info "~/git/info/pickingUpPerl.info")
				 ))

(provide 'init-perl)
