;;; init-el-get.el
;;    File: init-el-get.el
;;  Author: Yagnesh Raghava Yakkala <hi@yagnesh.org>

;;; Description:
;; El-get package manager., This file should be loaded first. load few
;; packages here.

;;; add el-get load-path
(setq load-path (cons (expand-file-name "~/.emacs.d/el-get/el-get") load-path))

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
  (el-get-emacswiki-refresh el-get-recipe-path-emacswiki t)
  (el-get-elpa-build-local-recipes))

;;; el-get-is-lazy
(setq el-get-is-lazy nil)
(package-initialize)

;; packages are defined by me
(setq el-get-sources
      '((:name ams-glossary
               :description "Read AMS glossary from Emacs"
               :type github
               :pkgname "yyr/ams-glossary.el"
               :depends (epc))
        (:name japanese-holidays
               :type http
               :url "http://www.meadowy.org/meadow/netinstall/export/799/branches/3.00/pkginfo/japanese-holidays/japanese-holidays.el")))


;; common packages all the systems I have
(setq my-packages
      (append
       '(screenshot
         profile-dotemacs)
       (mapcar 'el-get-source-name el-get-sources)))

;; package needed for only my laptop
(when (and on-laptop
           (not on-ms))
  (setq my-packages
        (append
         '(textile-mode
           markdown-mode
           haml-mode
           sass-mode)
         my-packages)))

(el-get 'sync my-packages)

(defun el-get-create-recipe-from-url (url)
  (interactive "sURL of Elisp Package: ")
  (unless (url-p url)
    (message "'%s' is not an url" url)))

;; init-el-get.el ends here
