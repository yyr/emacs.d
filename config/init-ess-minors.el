;; -----------------------------------------------------------------------------
;; Essential minors, Change Default behavior
;; -----------------------------------------------------------------------------

(setq-default inhibit-startup-screen t                        ; Skip the startup screens
              initial-scratch-message nil
              frame-title-format '(buffer-file-name "%f" "%b") ; I already know this is Emacs
              truncate-lines t                                ; Truncate lines, don't wrap
              paren-mode 'sexp                                ; Highlight parenthesis
              ;; blink-cursor-alist '((t . hollow))              ; Cursor blinks solid and hollow
              disabled-command-function nil                   ; Don't second-guess advanced commands
              kill-read-only-ok t                             ; Silently copy in read-only buffers
              tab-width 4                                     ; Set tab stops
              tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44
                                48 52 56 60 64 68 72 76 80 84)
              indent-tabs-mode nil                            ; Use spaces only, no tabs
              page-delimiter "^\\s *\n\\s *"                  ; Page delim one or more blank lines
              minibuffer-max-depth nil                        ; Mini-buffer settings
              display-time-day-and-date t                     ; Display the time and date on the mode line
              case-fold-search t                              ; Fold case on searches
              )

;; put off menu bar scroll bar
(scroll-bar-mode -1)
(menu-bar-mode -1)

;; minor modes
(tool-bar-mode -1)
(column-number-mode 1)
(blink-cursor-mode -1)
;; (global-linum-mode 1)
(setq visible-bell t)
(show-paren-mode 1)
(setq show-paren-delay 0)

(display-time)                                                ; Display the time of day

(pending-delete-mode t)                                       ; Typed text replaces selection

(provide 'init-ess-minors)
