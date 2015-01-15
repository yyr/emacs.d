;;; load.el
;; Author: Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: load.el

(loop for f in
      (directory-files
       (file-name-directory
        (or load-file-name buffer-file-name))
       t "init-.*")
      do (load f))

;;; load.el ends here
