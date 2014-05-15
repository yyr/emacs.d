;;; init-bnf.el
;;

;;; http://stackoverflow.com/a/1801004/399964
(define-generic-mode 'bnf-mode
  '("#")
  nil
  '(("^<.*?>" . 'font-lock-variable-name-face)
    ("<.*?>" . 'font-lock-keyword-face)
    ("::=" . 'font-lock-warning-face)
    ("\|" . 'font-lock-warning-face))
  '("\\.bnf\\.pybnf\\'")
  nil
  "Major mode for BNF highlighting.")

;; (setq ebnf-debug t)
(setq ebnf-log t)
(setq ebnf-color-p t)
(setq ebnf-debug-ps t)
(setq ebnf-iso-normalize-p t)
(setq ebnf-non-terminal-font
      (quote (8 Helvetica "Black" "White")))
(setq ebnf-non-terminal-shadow t)
(setq ebnf-non-terminal-shape (quote bevel))
(setq ebnf-terminal-font
      (quote (9 Courier "Black" "White")))
(setq ebnf-terminal-shape (quote bevel))
(setq ebnf-yac-ignore-error-recovery t)

;;; init-bnf.el ends here
