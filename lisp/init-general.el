;;; init-general.el
;; Author: Yagnesh Raghava Yakkala. http://yagnesh.org

;;; General settings

;;; Some environment variables
(setenv "LANG" "C")
(setenv "LC_COLLATE" "en_US.UTF-8")
(setenv "LC_CTYPE" "en_US.UTF-8")
(setenv "LC_MESSAGES" "en_US.UTF-8")

(setenv "PAGER" "cat")
(setenv "TERM" "xterm")
(setenv "TMPDIR" "/tmp")


;; I dont what this means. but looks imp
(setq buffer-file-coding-system 'utf-8-unix)
(setq default-file-name-coding-system 'utf-8-unix)
(setq default-keyboard-coding-system 'utf-8-unix)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))
(setq default-sendmail-coding-system 'utf-8-unix)
(setq default-terminal-coding-system 'utf-8-unix)

(setq undo-outer-limit  40000000)
(setq large-file-warning-threshold 100000000) ;; 95mb aprox

(add-to-list 'completion-styles 'substring t)

(setq message-log-max 5000              ; Increase message log
      echo-keystrokes 0.1
      use-dialog-box nil
      visible-bell t
      show-paren-delay 0
      inhibit-startup-screen t          ; Skip the startup screens
      initial-scratch-message nil
      require-final-newline t       ; Always end a file with a newline

      search-whitespace-regexp "[ \t\r\n]+"  ;
      next-line-add-newlines nil ; Stop at the end of the file, not just add lines
      browse-url-browser-function 'browse-url-firefox  ; my system needs this
      )

(setq completion-ignored-extensions
      (delete-dups (append completion-ignored-extensions
                           '(".bak" ".obj" ".map" ".mod" ".rel" ".out"))))

(setq-default
 frame-title-format `("%b       " ,(user-login-name) "@" ,(system-name) "     "
                      global-mode-string)
 ;; frame-title-format '(buffer-file-name "%f" "%b") ; I already know this is Emacs
 truncate-lines t                                 ; Truncate lines, don't wrap
 paren-mode 'sexp                                 ; Highlight parenthesis
 blink-cursor-alist '((t . hollow))     ; Cursor blinks solid and hollow
 disabled-command-function nil          ; Don't second-guess advanced commands
 kill-read-only-ok t                    ; Silently copy in read-only buffers
 tab-width 4                            ; Set tab stops
 tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84)
 indent-tabs-mode nil             ; Use spaces only, no tabs
 page-delimiter "^\\s *\n\\s *"   ; Page delim one or more blank lines
 minibuffer-max-depth nil         ; Mini-buffer settings
 display-time-day-and-date t      ; Display the time and date on the mode line
 case-fold-search t               ; Fold case on searches
 indicate-empty-lines t)


;;; damn IMPORTANT.
(defalias 'yes-or-no-p 'y-or-n-p)

;;; Dont ask me when a process is alive while I kill a buffer
(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
            kill-buffer-query-functions))

;;; make executable if shebang is present
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;;;---------------------------------------------------------------------
;;; change behavious of builtins

(defadvice kill-line (around kill-region-if-active activate)
  "kill region if active with C-k"
  (if (and (called-interactively-p 'any)
           (region-active-p))
      (kill-region (region-beginning) (region-end))
    ad-do-it))

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

;;; delete nasty hidden white spaces at the end of lines
;; le weng from emacs.help
(defun my-save-buffer-dtws (arg)
  "save buffer delete trailing white space, preserve white space
before point if point is past text"
  (interactive "p")
  (let ((save (when (and (looking-at "\\s-*$")
                         (looking-back "\\s-+"
                                       (line-beginning-position) t))
                (match-string 0))))
    (delete-trailing-whitespace)
    (set-buffer-modified-p t)
    (save-buffer arg)
    (when (and (eq major-mode 'org-mode) save)
      (insert save)
      (set-buffer-modified-p nil))))

(global-set-key [remap save-buffer] 'my-save-buffer-dtws)
;;(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;; buttonize addresses
(add-hook 'find-file-hooks 'goto-address-prog-mode)

;;; stop unwanted kill-emacs (while using orgmode)
;; (global-unset-key (kbd "C-x C-c"))

(when (fboundp 'horizontal-scroll-bar-mode)
  (horizontal-scroll-bar-mode -1))

(when (fboundp 'copyright-update)
  (setq copyright-names-regexp "Yagnesh\\|Free Software")
  (add-hook 'before-save-hook 'copyright-update))


;;; init-general.el ends here
