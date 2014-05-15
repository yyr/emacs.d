;;; init-elisp.el
;; http://yagnesh.org

;;; elisp setup
(el-get 'sync 'elisp-slime-nav)
(add-hook 'emacs-lisp-mode-hook (lambda () (elisp-slime-nav-mode 1)))

(defun my-elisp-hook ()
  (setq tab-width 8)
  (local-set-key (kbd "C-S-SPC") 'my-popup-describe-symbol))                    ; Set tab stops

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

(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-to-list 'auto-mode-alist '("\\.emacs-project$" . emacs-lisp-mode))

(require 'find-func)
(find-function-setup-keys)

;;; By Jumbunathan on org-mode list
(defun yyr-jump-to-source ()
  (interactive)
  (let ((thing (intern (thing-at-point 'symbol))))
    (if (functionp thing)
        (find-function thing)
      (find-variable thing))))
(global-set-key (kbd "C-c f") 'yyr-jump-to-source)

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

(defun locate-function (func)
  "Return file-name as string where `func' was defined or will be autoloaded"
  (interactive "Ccommand: ")
  (let ((res (find-lisp-object-file-name func (symbol-function func))))
    (when (called-interactively-p 'any)
      (message "%s defined in %s" func res))
    res))


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


(add-hook 'outline-minor-mode-hook
          (lambda ()
            (when (and outline-minor-mode (derived-mode-p 'emacs-lisp-mode))
              (hide-sublevels 1000)
              (reveal-mode 1))))

;;; init-elisp.el ends here
