;;; init-flycheck.el

(el-get 'sync 'flycheck)

(after 'flycheck
       (setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers))
       (setq flycheck-idle-change-timer 3)
       (setq flycheck-check-syntax-automatically
             (delq 'new-line flycheck-check-syntax-automatically)))

;; (add-hook 'prog-mode-hook 'flycheck-mode)
(dolist (hook '(emacs-lisp-mode-hook
                c-mode-hook
                sh-mode-hook))
  (add-hook hook 'flycheck-mode))

(add-hook 'sh-mode-hook
          (lambda ()
            (setq flycheck-checker 'bash)))

;;; for c & cpp
(after 'flycheck
       ;; Highlight whole line with error
       (setq-default flycheck-highlighting-mode 'lines)
       ;; Define a poor c/c++ checker (it fails when errors affect other files,
       ;; not the one being being checked actually)
       (defmacro flycheck-define-clike-checker (name command modes)
         `(flycheck-declare-checker ,(intern (format "flycheck-checker-%s" name))
            ,(format "A %s checker using %s" name (car command))
            :command '(,@command source-inplace)
            :error-patterns
            '(("^\\(?1:.*\\):\\(?2:[0-9]+\\):\\(?3:[0-9]+\\): error: \\(?4:.*\\)$"
               error)
              ("^\\(?1:.*\\):\\(?2:[0-9]+\\):\\(?3:[0-9]+\\): warning: \\(?4:.*\\)$"
               warning))
            :modes ',modes))
       (flycheck-define-clike-checker c
                                      ("gcc" "-fsyntax-only" "-Wall" "-Wextra")
                                      c-mode)
       (add-to-list 'flycheck-checkers 'flycheck-checker-c)
       (flycheck-define-clike-checker c++
                                      ("g++" "-fsyntax-only" "-Wall" "-Wextra")
                                      c++-mode)
       (add-to-list 'flycheck-checkers 'flycheck-checker-c++))

;;; init-flycheck.el ends here
