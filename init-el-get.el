;;; init-el-get.el
;;    File: init-el-get.el
;;  Author: Yagnesh Raghava Yakkala <hi@yagnesh.org>

;;; Description:
;; El-get package manager., This file should be loaded first. load few
;; packages here.

;;; add el-get load-path
(setq load-path (cons (expand-file-name "~/.emacs.d/el-get/el-get") load-path))

;;; load el-get or install it (from readme)
(unless (require 'el-get nil t)
  (setq el-get-install-branch "master")
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (end-of-buffer)
    (eval-print-last-sexp))
  (el-get-emacswiki-refresh el-get-recipe-path-emacswiki t))

;;; el-get-is-lazy
(setq el-get-is-lazy nil)

(if (symbolp 'package-archives)
    (setq package-archives
          '(("gnu" . "http://elpa.gnu.org/packages/")
            ("marmalade" . "http://marmalade-repo.org/packages/")
            ("melpa" . "http://melpa.milkbox.net/packages/"))))

;; packages are defined by me
(setq el-get-sources
      '((:name ams-glossary
               :description "Read AMS glossary from Emacs"
               :type github
               :pkgname "yyr/ams-glossary.el"
               :depends (epc))
        (:name ido-hacks
               :description "Advices for ido-mode."
               :type github
               :pkgname "scottjad/ido-hacks"
               :load    "ido-hacks.el")))

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
;; init-el-get.el ends here
