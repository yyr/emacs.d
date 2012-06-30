(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(defun add-to-load-path (PATH)
  "Add PATH to your load-path."
  (interactive (list (read-directory-name "Directory: " default-directory
                                          nil  t default-directory)))
  (add-to-list 'load-path path))
