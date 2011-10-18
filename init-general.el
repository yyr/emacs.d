;;; init-general.el
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@NOSPAM.live.com>
;; License: GPL v3 or later

;;; General settings

;; I dont what this means. but looks imp
(setq buffer-file-coding-system 'utf-8-unix)
(setq default-file-name-coding-system 'utf-8-unix)
(setq default-keyboard-coding-system 'utf-8-unix)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))
(setq default-sendmail-coding-system 'utf-8-unix)
(setq default-terminal-coding-system 'utf-8-unix)

(setq-default
 inhibit-startup-screen t               ; Skip the startup screens
 initial-scratch-message nil
 frame-title-format '(buffer-file-name "%f" "%b") ; I already know this is Emacs
 truncate-lines t                     ; Truncate lines, don't wrap
 paren-mode 'sexp                     ; Highlight parenthesis
 blink-cursor-alist '((t . hollow))   ; Cursor blinks solid and hollow
 disabled-command-function nil  ; Don't second-guess advanced commands
 kill-read-only-ok t            ; Silently copy in read-only buffers
 tab-width 4                    ; Set tab stops
 tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44
                   48 52 56 60 64 68 72 76 80 84)
 indent-tabs-mode nil             ; Use spaces only, no tabs
 page-delimiter "^\\s *\n\\s *"   ; Page delim one or more blank lines
 minibuffer-max-depth nil         ; Mini-buffer settings
 display-time-day-and-date t ; Display the time and date on the mode line
 case-fold-search t          ; Fold case on searches
 )

;;; delete nasty hidden white spaces at the end of lines
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

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

;;; Ubuntu needs this(?)
(setq browse-url-browser-function 'browse-url-firefox)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;;; damn IMPORTANT.
(defalias 'yes-or-no-p 'y-or-n-p)

;;; Dont ask me when a process is alive while I kill a buffer
(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
            kill-buffer-query-functions))

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
     ("\\<the[ \t\r\n]+[a-zA-Z]+[ \t\r\n]+of[ \t\r\n]+the\\>" 0
      'grammar-warning-face t)))
  (font-lock-fontify-buffer))


;;; make executable if shebang is present
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)


;;; init-general.el ends here
