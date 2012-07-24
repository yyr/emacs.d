;;; init-eldoc.el

(setq eldoc-idle-delay 0)

(dolist (hook (list
               'ielm-mode-hook
               'emacs-lisp-mode-hook
               'lisp-interaction-mode-hook
               'message-mode-hook
               'Info-mode-hook
               'erc-mode-hook
               'python-mode
               ;;'org-mode-hook
               ))
  (add-hook hook 'turn-on-eldoc-mode))
;;(setq eldoc-argument-case 'upcase)

;; (defadvice eldoc-highlight-function-argument
;;   (around my-formatting (sym args index) compile activate preactivate)
;;   "Replace original to apply my style of formatting."
;;   ;; HACK: intercept the call to eldoc-docstring-format-sym-doc at the
;;   ;; end of the adviced function. This is obviously brittle, but the
;;   ;; alternative approach of copy/pasting the original also has
;;   ;; downsides...
;;   (flet ((eldoc-docstring-format-sym-doc
;;           (sym doc face)
;;           (let* ((function-name (propertize (symbol-name sym)
;;                                             'face face))
;;                  (spec (format "%s %s" function-name doc))
;;                  (docstring (or (eldoc-docstring-first-line
;;                                  (documentation sym t))
;;                                 "Undocumented."))
;;                  (docstring (propertize docstring
;;                                         'face 'font-lock-doc-face))
;;                  ;; TODO: currently it strips from the start of spec by
;;                  ;; character instead of whole arguments at a time.
;;                  (fulldoc (format "%s: %s" spec docstring))
;;                  (ea-width (1- (window-width (minibuffer-window)))))
;;             (cond ((or (<= (length fulldoc) ea-width)
;;                        (eq eldoc-echo-area-use-multiline-p t)
;;                        (and eldoc-echo-area-use-multiline-p
;;                             (> (length docstring) ea-width)))
;;                    fulldoc)
;;                   ((> (length docstring) ea-width)
;;                    (substring docstring 0 ea-width))
;;                   ((>= (- (length fulldoc) (length spec)) ea-width)
;;                    docstring)
;;                   (t
;;                    ;; Show the end of the partial symbol name, rather
;;                    ;; than the beginning, since the former is more likely
;;                    ;; to be unique given package namespace conventions.
;;                    (setq spec (substring spec (- (length fulldoc) ea-width)))
;;                    (format "%s: %s" spec docstring))))))
;;     ad-do-it))


;;; init-eldoc.el ends here
