;;; init-el-get.el
;;  Author: Yagnesh Raghava Yakkala http://yagnesh.org

;;; Description:
;; El-get package manager., This file should be loaded first. load few
;; packages here.

;;; add el-get load-path
(setq load-path (cons
                 (expand-file-name "el-get/el-get"
                                   (file-name-directory user-init-file))
                 load-path))

(when (symbolp 'package-archives)
  (setq package-archives
        '(("melpa" . "http://melpa.milkbox.net/packages/")
          ("gnu" . "http://elpa.gnu.org/packages/"))))

;;; load el-get or install it (from readme)
(unless (require 'el-get nil t)
  (setq el-get-install-branch "master")
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (end-of-buffer)
    (eval-print-last-sexp))
  (el-get-elpa-build-local-recipes))

(package-initialize)
;; packages are defined by me
(setq el-get-sources
      '((:name ams-glossary
               :description "Read AMS glossary from Emacs"
               :type github
               :pkgname "yyr/ams-glossary.el")
        (:name backup-each-save
               :description "backup each save"
               :type github
               :pkgname "yyr/backup-each-save")))


;; common packages all the systems I have
(setq my-packages
      (append
       '(profile-dotemacs)
       (mapcar
        'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)

(el-get 'sync 'auto-compile)
;; (require 'auto-compile)
;; (auto-compile-on-load-mode 1)
;; (auto-compile-on-save-mode 1)


(defun el-get-create-recipe-from-github-url (url &optional target-dir)
  (interactive "sURL of Elisp Package: ")
  (let* ((href (url-generic-parse-url url))
         (file (url-filename href))
         (up (split-string file "/"))
         (user (cadr up))
         (pkg (caddr up))
         (rfile (concat pkg ".rcp"))
         (target-dir (or target-dir
                         (concat (file-name-directory el-get-script) "recipes")))
         (rfilename  (expand-file-name rfile target-dir) )
         (coding-system-for-write 'utf-8))
    (when (file-exists-p rfilename)
      (if (yes-or-no-p (format "\"%s\" already exists. delete it?" pkg))
          (progn
            (with-temp-file rfilename
              (message "writing recipe file for %s" pkg)
              (insert
               (format
                "(:name %s
:description \"\"
:website \"%s\"
:type github
:depends nil
:pkgname \"%s\")"
                pkg url (concat user "/" pkg)))
              (emacs-lisp-mode)
              (indent-region (point-min) (point-max)))
            (find-file-other-window rfilename))
        (find-file-other-window rfilename)))))

;; init-el-get.el ends here
