;;; init-elisp.el
;; http://yagnesh.org

;;; elisp setup
(el-get 'sync 'elisp-slime-nav)
(add-hook 'emacs-lisp-mode-hook 'elisp-slime-nav-mode)

(defun my-elisp-hook ()
  (setq tab-width 8))                    ; Set tab stops


(defun set-up-hippie-expand-for-elisp ()
  (make-variable-buffer-local 'hippie-expand-try-functions-list)
  (add-to-list 'hippie-expand-try-functions-list 'try-complete-lisp-symbol t)
  (add-to-list 'hippie-expand-try-functions-list 'try-complete-lisp-symbol-partially t))

(dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
  (add-hook hook 'pretty-lambdas)
  (add-hook hook 'set-up-hippie-expand-for-elisp)
  (add-hook hook 'turn-on-eldoc-mode)
  (add-hook hook 'enable-paredit-mode)
  (add-hook hook 'my-elisp-hook))

(add-hook 'minibuffer-setup-hook 'conditionally-enable-paredit-mode)
(defun conditionally-enable-paredit-mode ()
  "Enable paredit-mode during eval-expression"
  (if (eq this-command 'eval-expression)
      (paredit-mode 1)))

;;; show eldoc while in minibuffer.
(add-hook 'eval-expression-minibuffer-setup-hook #'eldoc-mode)

(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-to-list 'auto-mode-alist '("\\.emacs-project$" . emacs-lisp-mode))

;;; find func.
(find-function-setup-keys)

;;; http://stackoverflow.com/a/9620373/399964
(defun locate-feature (feature)
  "Return file name as string where `feature' was provided"
  (interactive "Sfeature: ")
  (dolist (file-info load-history)
    (mapc (lambda (element)
            (when (and (consp element)
                       (eq (car element) 'provide)
                       (eq (cdr element) feature))
              (when (called-interactively-p 'any)
                (message "%s defined in %s" feature (car file-info)))
              (return (car file-info))))
          (cdr file-info))))

(defun locate-symbol (sym &optional noprompt)
  "locate SYM definition. When NOPROMPT forcefully attempts find
thing-at-point"
  (interactive
   (list (symbol-at-point)
         (prefix-numeric-value current-prefix-arg)))
  (cond ((and sym (= noprompt 4))
         (elisp-slime-nav-find-elisp-thing-at-point (format "%s" sym)))
        ((not (= noprompt 4))
         (let ((symb (completing-read (if sym
                                          (format "Describe symbol (default %s): " sym)
                                        "Describe symbol: ")
                                      obarray nil t nil nil
                                      (and sym (symbol-name sym)))))
           (elisp-slime-nav-find-elisp-thing-at-point (format "%s" symb))))
        (t
         (message "No symbol found at point" sym noprompt))))

(global-set-key (kbd "C-c f") 'locate-symbol)

(add-to-list 'auto-mode-alist '("Cask\\'" . emacs-lisp-mode))

;;; init-elisp.el ends here
