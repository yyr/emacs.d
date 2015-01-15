;;; init-print.el
;; Created: Monday, May 21 2012

;; ps print setup
(defun print-header-func ()
  (concat (ps-time-stamp-locale-default) " : " (ps-header-dirpart)))

(setq ps-bold-faces
      '(font-lock-keyword-face font-lock-function-name-face))

(setq ps-italic-faces
      '(font-lock-comment-face font-lock-string-face))

(after 'ps-print
       (add-to-list 'ps-page-dimensions-database
                    (list 'JpA4 (* 72 8.5)  (* 72 11) "JpA4")))

(setq ps-paper-type 'a4
      ps-print-color-p t
      ps-spool-duplex t
      ps-switch-header nil
      ps-print-header t
      ps-print-footer nil
      ps-print-header-frame nil
      ps-header-offset 5.58001116
      ps-header-title-font-size '(10 . 12)
      ps-header-font-size '(7 . 8.5)
      ps-header-lines 1
      ps-left-header (list 'print-header-func))

(ps-extend-face '(default "black" nil nil) 'MERGE)

(defun sjt/print-file-of-buffer ()
  (interactive)
  (let ((cmd (format "lp -o media=A4 %s" (buffer-file-name))))
    (when (y-or-n-p (format "%s?" cmd))
      (shell-command cmd))))

(global-set-key (kbd "C-c c p") 'sjt/print-file-of-buffer)

;;; init-print.el ends here
