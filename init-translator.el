;;;
(el-get 'sync '(text-translator))

(require 'text-translator-load)

(global-set-key "\C-x\M-t" 'text-translator)
(global-set-key "\C-x\M-T" 'text-translator-translate-last-string)

;;; use translation type auto selection (english/japanese only)

;; set function that use auto selection
(setq text-translator-auto-selection-func
      'text-translator-translate-by-auto-selection-enja)
;; set global-key
(global-set-key "\C-xt" 'text-translator-translate-by-auto-selection)
(global-set-key "\C-xT" 'text-translator-all-by-auto-selection)
