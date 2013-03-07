;;; init-el-get.el
;;    File: init-el-get.el
;;  Author: Yagnesh Raghava Yakkala <hi@yagnesh.org>

;;; Description:
;; load el-get package manager, install/load few packages here. this
;; file should be loaded first

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

;; compile at init if any source is not byte compiled
;; (setq el-get-byte-compile-at-init t)

;; packages are defined by me
(setq el-get-sources
      '((:name readline-complete
               :description "Offers completions in shell mode"
               :type github
               :pkgname "monsanto/readline-complete.el"
               :depends (auto-complete))
        (:name door-gnus
               :type git
               :url "http://github.com/yyr/door-gnus.git"
               :features door-gnus)))

;; common packages all the systems I have
(setq my-packages
      (append
       '(emacs-w3m
         screenshot
         profile-dotemacs
         el-get)
       (mapcar 'el-get-source-name el-get-sources)))

;; add these packages if I am not server
(when (not on-lab-server)
  (setq my-packages
        (append
         '(edit-server
           bbdb)
         my-packages)))

;; package needed for only my laptop
(when (and on-laptop
           (not on-ms))
  (setq my-packages
        (append
         '(emms textile-mode
                markdown-mode
                haml-mode
                sass-mode)
         my-packages)))

(el-get 'sync my-packages)
;; init-el-get.el ends here
