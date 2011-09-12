;;----------------------------------------------------------------------------
;; Misc config - yet to be placed in separate files
;;----------------------------------------------------------------------------

(fset 'yes-or-no-p 'y-or-n-p)
;; (add-hook 'find-file-hooks 'goto-address-prog-mode)
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  "indent entire buffer"
  (interactive)
  (indent-region (point-min) (point-max)))

(defun delete-trailing-blank-lines ()
  "Deletes all blank lines at the end of the file."
  (interactive)
  (save-excursion
    (save-restriction
      (widen)
      (goto-char (point-max))
      (delete-blank-lines))))

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer."
  (interactive)
  (indent-buffer)
  (untabify-buffer)
  (delete-trailing-whitespace)
  (delete-trailing-blank-lines))

(global-set-key (kbd "C-c n") 'cleanup-buffer)

(defun reload-init-file ()
  "reloads init file .emacs.d/"
  (interactive)
  (load-file "~/.emacs.d/init.el"))

;; zap-up-to-char
;; --------------
;; Most of the time when I want to zap-to-char, it's to a delimeter that
;; I'd like to be left alone rather than zapped too.
;;
(defun zap-up-to-char (arg char)
  "Like standard zap-to-char, but stops just before the given character."
  (interactive "p\ncZap up to char: ")
  (kill-region (point)
               (progn
                 (search-forward (char-to-string char) nil nil arg)
                 (forward-char (if (>= arg 0) -1 1))
                 (point))))
(define-key global-map [(meta ?z)] 'zap-up-to-char)           ; Rebind M-z to our version


;; goto-matching-paren
;; -------------------
;; If point is sitting on a parenthetic character, jump to its match.
;; This matches the standard parenthesis highlighting for determining which
;; one it is sitting on.
;;
(defun goto-matching-paren ()
  "If point is sitting on a parenthetic character, jump to its match."
  (interactive)
  (cond ((looking-at "\\s\(") (forward-list 1))
        ((progn
           (backward-char 1)
           (looking-at "\\s\)")) (forward-char 1) (backward-list 1))))
(define-key global-map [(control ?z) ?p] 'goto-matching-paren) ; Bind to C-z p

(provide 'init-misc)
;;; init-misc.el ends here
