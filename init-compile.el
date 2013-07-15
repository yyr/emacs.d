;;; init-compile.el
;; Created: 金曜日, 11月 30 2012

(require 'compile)

(setq compilation-scroll-output t)
(setq compilation-auto-jump-to-first-error t)
(setq compilation-scroll-output 'first-error)

;; http://www.emacswiki.org/emacs/CompileCommand
(add-hook 'c-mode-hook
          (lambda ()
            (unless (file-exists-p "Makefile")
              (set (make-local-variable 'compile-command)
                   ;; emulate make's .c.o implicit pattern rule, but with
                   ;; different defaults for the CC, CPPFLAGS, and CFLAGS
                   ;; variables:
                   ;; $(CC) -c -o $@ $(CPPFLAGS) $(CFLAGS) $<
                   (let ((file (file-name-nondirectory buffer-file-name)))
                     (format "%s -o %s.o %s %s %s"
                             (or (getenv "CC") "gcc")
                             (file-name-sans-extension file)
                             (or (getenv "CPPFLAGS") "-DDEBUG=9")
                             (or (getenv "CFLAGS") "-ansi -pedantic -Wall -g")
                             file))))))

;; http://emacswiki.org/emacs/ModeCompile#toc2
(setq compilation-finish-functions 'compile-autoclose)
(defun compile-autoclose (buffer string)
  (cond ((string-match "finished" string)
         (bury-buffer "*compilation*")
         (winner-undo)
         (message "Build successful. :)"))
        (t
         (message "Compilation exited abnormally: %s" string))))

(global-set-key (kbd "<f7>") 'compile)
;;; init-compile.el ends here
