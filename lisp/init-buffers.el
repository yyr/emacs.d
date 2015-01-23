;;; init-buffers.el
;; Created: Tuesday, August 30 2011

;;; uniquify
(setq  uniquify-buffer-name-style 'post-forward-angle-brackets
       uniquify-after-kill-buffer-p t
       uniquify-ignore-buffers-re "^\\*")

;;; Ibuffer
;;; --------------------------------------------------------
(setq ibuffer-modified-char ?✍)
(setq ibuffer-read-only-char ?✗)
(setq ibuffer-marked-char ?✓)
(setq ibuffer-deletion-char ?␡)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(setq ibuffer-expert t)
(setq ibuffer-show-empty-filter-groups nil)

(setq ibuffer-shrink-to-minimum-size t)
(setq ibuffer-always-show-last-buffer nil)
(setq ibuffer-sorting-mode 'recency)

;;; http://www.elliotglaysher.org/emacs/
(setq ibuffer-saved-filter-groups
      '(("default"
         ;; ("emacs" (or (name . "^\\*scratch\\*$")
         ;;              (name . "^\\*Messages\\*$")
         ;;              (name . "^\\*ELP Profiling Results\\*$")
         ;;              (name . "^\\*Help\\*$")
         ;;              (name . "^TAGS\\(<[0-9]+>\\)?$")
         ;;              (name . "^\\*info\\*$")
         ;;              (name . "^\\*Occur\\*$")
         ;;              (name . "^\\*grep\\*$")
         ;;              (name . "^\\*Apropos\\*$")
         ;;              (name . "^\\*Compile-Log\\*$")
         ;;              (name . "^\\*Backtrace\\*$")
         ;;              (name . "^\\*Packages\\*$")
         ;;              (name . "^\\*Process List\\*$")
         ;;              (name . "^\\*gud\\*$")
         ;;              (name . "^\\*Man")
         ;;              (name . "^\\*WoMan")
         ;;              (name . "^\\*Kill Ring\\*$")
         ;;              (name . "^\\*Completions\\*$")
         ;;              (name . "^\\*tramp")
         ;;              (name . "^\\*shell\\*$")
         ;;              (name . "^\\*compilation\\*$")
         ;;              (mode . Custom-mode)))

         ("dict" (or (name . "^\\*edict")
                     (name . "^\\*dict")))

         ("version control" (or (mode . svn-status-mode)
                                (mode . svn-log-edit-mode)
                                (name . "^\\*svn-")
                                (name . "^\\*vc\\*$")
                                (name . "^\\*Annotate")
                                (name . "^\\*magit")
                                (name . "^\\*vc-")))

         ("IRC" (or (name . "^\\*Finger")
                    (mode . erc-mode)))

         ("emacs source" (or (mode . emacs-lisp-mode)
                             (filename . "\\.el\\.gz$")))

         ("Gnus" (or   (name . "^\\*Group*")
                       (name . "^\\*BBDB*")
                       (name . "^\\*Summary")
                       (name . "^\\*mail")
                       (name . "^\\*wide")
                       (name . "^\\*Article")
                       (name . "^\\*reply")
                       (name . "^\\.news")
                       (name . "^\\*unsent")
                       (name . "^\\.bbdb")))

         ("agenda" (or (name . "^\\*Calendar\\*$")
                       (name . "^diary$")
                       (name . "^\\*Agenda")
                       (name . "^\\*org-")
                       (name . "^\\*Org")
                       (mode . org-mode)
                       (mode . muse-mode)))

         ("latex" (or (mode . latex-mode)
                      (mode . LaTeX-mode)
                      (mode . bibtex-mode)
                      (mode . reftex-mode)))

         ("dired" (or (mode . dired-mode)))

         ("Starred"  (or
                      (name . "^\\*[[:ascii:]]+\\*")
                      (name . "^TAGS\\(<[0-9]+>\\)?$")
                      (mode . Custom-mode)))

         ("EMMS" (or  (name . "^\\*Music")
                      (name . "^\\*EMMS")
                      (mode . emms-browser-mode))))))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")
            (ibuffer-auto-mode 1)))

;;;
(el-get 'sync 'ibuffer-vc)
(global-set-key (kbd "C-S-b") #'ibuffer-vc-set-filter-groups-by-vc-root)
(global-set-key (kbd "C-b") 'backward-char)

;; Order the groups so the order is : [Default], [agenda], [emacs]
(defadvice ibuffer-generate-filter-groups (after reverse-ibuffer-groups ()
                                                 activate)
  (setq ad-return-value (nreverse ad-return-value)))

(defun kill-other-buffers ()
  "Kill all buffers except the current and unsplit the window."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list)))
  (delete-other-windows)
  (delete-other-frames))
(define-key global-map [(control ?z) ?k] 'kill-other-buffers)


(defun kill-star-buffers ()
  "kill all those starred buffers.
FIXME: make an exceptions for few buffers like gnus, emms"
  (interactive)
  (mapc (lambda (buf)
          (if (string-match "^\*.*\*$" (buffer-name buf))
              (kill-buffer buf)))
        (buffer-list)))
(define-key global-map
  [(control ?z) (control ?k)] 'kill-star-buffers)

;;; kill current buffer
(global-set-key (kbd "M-k") (defun my-kill-buffer ()
                              (interactive)
                              (kill-buffer (buffer-name))))

;;; From Emacswiki http://www.emacswiki.org/RecentFiles
(defun undo-kill-buffer (arg)
  "Re-open the last buffer killed.  With ARG, re-open the nth buffer."
  (interactive "p")
  (let ((recently-killed-list (copy-sequence recentf-list))
        (buffer-files-list
         (delq nil (mapcar (lambda (buf)
                             (when (buffer-file-name buf)
                               (expand-file-name (buffer-file-name buf)))) (buffer-list)))))
    (mapc
     (lambda (buf-file)
       (setq recently-killed-list
             (delq buf-file recently-killed-list)))
     buffer-files-list)
    (find-file
     (if arg (nth arg recently-killed-list)
       (car recently-killed-list)))))

(global-set-key (kbd "M-<f9>") #'undo-kill-buffer)

;;; init-buffers.el ends here
