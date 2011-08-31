;;; General

;; I dont what this means. but looks imp
(setq buffer-file-coding-system 'utf-8-unix)
(setq default-file-name-coding-system 'utf-8-unix)
(setq default-keyboard-coding-system 'utf-8-unix)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))
(setq default-sendmail-coding-system 'utf-8-unix)
(setq default-terminal-coding-system 'utf-8-unix)

;;; yank with indent
(defadvice yank (after indent-region activate)
  "To make yank content indent automatically."
  (if (member major-mode '(emacs-lisp-mode
                           scheme-mode
                           lisp-mode
                           lisp-interaction-mode
                           c-mode
                           c++-mode
                           objc-mode
                           latex-mode
                           plain-tex-mode))
      (indent-region (region-beginning) (region-end) nil)))

;; Always end a file with a newline
(setq require-final-newline t)

;; Stop at the end of the file, not just add lines
;;(setq next-line-add-newlines nil)

(setq disabled-command-function nil)
(setq browse-url-browser-function 'browse-url-firefox)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(defalias 'yes-or-no-p 'y-or-n-p)

;;; dont use M-TAB for flyspell
(setq flyspell-use-meta-tab nil)

;; highlight-sloppy-grammar
;; ------------------------
;; This uses the font lock mechanism to highlight some potential
;; grammatical trouble spots.  It checks against a small list of common
;; problems such as duplicate words and instances of the passive voice.
;; It's not fool-proof but it does help when taking a pass over a paper.
;;
(defun highlight-sloppy-grammar ()
  "Highlight areas potentially containing sloppy grammar."
  (interactive)
  (make-face 'grammar-warning-face "Face to display grammar warnings in.")
  (face-spec-set 'grammar-warning-face
                 '((t (:bold t :foreground "orange" :underline t))))
  (font-lock-add-keywords
   nil
   '(("\\<\\(?:were\\|was\\|is\\|are\\|has been\\|be\\)\\(?:[ \t\r\n]+[a-zA-Z]+\\)?[ \t\r\n]+[a-zA-Z]+ed\\>"
      0 'grammar-warning-face t)        ; passive voice
     ("\\<\\([a-zA-Z]+\\)[ \t\r\n]+\\1\\>" 0 'grammar-warning-face t)
     ("[,-][ \t\r\n]+that\\>" 0 'grammar-warning-face t)
     ("[a-zA-Z]+[ \t\r\n]+which\\>" 0 'grammar-warning-face t)
     ("\\<[a-z]+\\(?:n't\\|d've\\)\\>" 0 'grammar-warning-face t)
     ("\\<by[ \t\r\n]+[a-z]+ing\\>" 0 'grammar-warning-face t)
     ("\\<which[ \t\r\n]+was\\>" 0 'grammar-warning-face t)
     ("\\<the[ \t\r\n]+[a-zA-Z]+[ \t\r\n]+of[ \t\r\n]+the\\>" 0 'grammar-warning-face t)))
  (font-lock-fontify-buffer))

(provide 'init-general)
