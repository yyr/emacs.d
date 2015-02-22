;;; auto-complete mode

(el-get 'sync '(auto-complete
                ac-math))

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

;;; --------------------------------------------------------
;;; auto completion support
(defun ac-latex-mode-setup ()         ; add ac-sources to default ac-sources
  (setq ac-sources
        (delete-dups
         (append
          '(ac-source-yasnippet
            ac-source-math-latex
            ac-source-latex-commands
            ac-source-math-unicode)
          ac-sources))))

(add-to-list 'ac-modes 'latex-mode)   ; make auto-complete aware of `latex-mode`
(add-hook 'LaTeX-mode-hook 'ac-latex-mode-setup)

;;; elisp
;;; tkf on https://github.com/m2ym/auto-complete/issues/81
(defmacro my-aif (test-form then-form &rest else-forms)
  (declare (debug (form form &rest form)))
  `(let ((it ,test-form))
     (if it ,then-form ,@else-forms)))
(put 'my-aif 'lisp-indent-function 2)

(defun my-popup-message (string)
  "Show string in tooltip using either `pos-tip-show' or `popup-tip'."
  (cond
   ((ac-quick-help-use-pos-tip-p)
    ;; see: `ac-pos-tip-show-quick-help'
    (pos-tip-show string 'popup-tip-face nil nil 0 popup-tip-max-width))
   ((featurep 'popup)
    (popup-tip string))
   (t
    (message string))))

(defun my-popup-describe-symbol ()
  (interactive)
  (my-aif (function-called-at-point)
      (my-popup-message (ac-symbol-documentation it))))
(define-key emacs-lisp-mode-map (kbd "C-S-SPC") 'my-popup-describe-symbol)
(define-key ielm-map (kbd "C-S-SPC") 'my-popup-describe-symbol)

;;; init-auto-complete.el ends here
