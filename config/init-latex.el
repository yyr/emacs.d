;; -----------------------------------------------------------------------------
;; LATEX stuff
;; -----------------------------------------------------------------------------

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

(add-hook 'LaTeX-mode-hook
          (lambda()
            (define-key LaTeX-mode-map (kbd "<S-tab>") 'TeX-complete-symbol)
            (TeX-PDF-mode t)
            (setq TeX-save-query  nil )
	    (setq TeX-master (guess-TeX-master (buffer-file-name)))
            (setq TeX-show-compilation t)))

(add-hook 'LaTeX-mode-hook
          (lambda ()
            (imenu-add-menubar-index)
            (turn-on-reftex)
            (turn-on-auto-fill)))

;; from emacs wiki
(defun guess-TeX-master (filename)
  "Guess the master file for FILENAME from currently open .tex files."
  (let ((candidate nil)
	(filename (file-name-nondirectory filename)))
    (save-excursion
      (dolist (buffer (buffer-list))
	(with-current-buffer buffer
	  (let ((name (buffer-name))
		(file buffer-file-name))
	    (if (and file (string-match "\\.tex$" file))
		(progn
		  (goto-char (point-min))
		  (if (re-search-forward (concat "\\\\input{" filename "}") nil t)
		      (setq candidate file))
		  (if (re-search-forward (concat "\\\\include{" (file-name-sans-extension filename) "}") nil t)
		      (setq candidate file))))))))
    (if candidate
	(message "TeX master document: %s" (file-name-nondirectory candidate)))
    candidate))

(provide 'init-latex)
