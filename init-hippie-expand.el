;; -----------------------------------------------------------------------------
;; hippe expansion
;; -----------------------------------------------------------------------------

(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-list try-expand-line
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

(global-set-key (kbd "M-/") 'hippie-expand)

;; Helps when debugging which try-function expanded
(setq hippie-expand-verbose t)
