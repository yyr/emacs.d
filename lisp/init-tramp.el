;;; init-tramp.el --- tramp settings
;;; init-tramp.el
;;    File: init-tramp.el
;; Created: Wednesday, August 28 2013

;; (set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))
(setq tramp-default-method "ssh")

(defun sudo-edit-current-file ()
  "Edit current file with sudo. If variable `buffer-file-name' is
not available drop into `defalt-directory' with tramp sudo."
  (interactive)
  (let ((position (point))
        (fname (or buffer-file-name
                   default-directory)))
    (find-alternate-file
     (if (file-remote-p fname)
         (let ((vec (tramp-dissect-file-name fname)))
           (tramp-make-tramp-file-name
            "sudo"
            (tramp-file-name-user vec)
            (tramp-file-name-host vec)
            (tramp-file-name-localname vec)))
       (concat "/sudo:root@localhost:" fname)))
    (goto-char position)))
(global-set-key (kbd "C-x 4 s") 'sudo-edit-current-file)

;;; WARNING when sudo in use
(defface find-file-root-header-face
  '((t (:foreground "white" :background "red3")))
  "*Face use to display header-lines for files opened as root.")

(defun find-file-root-header-warning ()
  "*Display a warning in header line of the current buffer.
This function is suitable to add to `find-file-root-hook'."
  (let* ((warning "WARNING: EDITING FILE AS ROOT!")
	 (space (+ 6 (- (window-width) (length warning))))
	 (bracket (make-string (/ space 2) ?-))
	 (warning (concat bracket warning bracket)))
    (setq header-line-format
	  (propertize  warning 'face 'find-file-root-header-face))))

(defun find-file-hook-root-header-warning ()
  (when (and buffer-file-name (string-match "root@localhost" buffer-file-name))
    (find-file-root-header-warning)))

(add-hook 'find-file-hook 'find-file-hook-root-header-warning)
;;; init-tramp.el ends here
