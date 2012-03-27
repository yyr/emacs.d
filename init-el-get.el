;;; init-el-get.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: init-el-get.el
;;  Author: Yagnesh Raghava Yakkala <yagnesh@NOSPAM.live.com>
;; Created:
;; License: GPL v3 or later. You should get a copy from <http://www.gnu.org/licenses/gpl.html>

;;; Description:
;; install/load packages using el-get package manager

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
;; (setq el-get-is-lazy t)

(if (symbolp "package-archives")
    (add-to-list 'package-archives
                 '("marmalade" . "http://marmalade-repo.org/packages/")))

;; compile at init if any source is not byte compiled
(setq el-get-byte-compile-at-init 't)

;;; ---------------------------------------------------------------------------
;; packages are defined by me
(setq el-get-sources
      '(
;;;; help typing
        (:name org2jekyll
               :type git
               :url "http://github.com/yyr/org2jekyll.git")))

;;; ---------------------------------------------------------------------------
;; COMMON packages all the systems I have
(setq my-packages
      (append
       '(
;;;; help typing

;;;; Cosmetics
         boxquote

;;;; Org
         org-mode
         calfw

         ;; python
         python-mode
         pylookup
         yaml-mode

;;;; Sub
         emacs-grads
         gnuplot-mode

;;;; web & mail
         emacs-w3m
         yaoddmuse

;;; sys
         screenshot

;;;; misc
         profile-dotemacs
         el-get)
       (mapcar 'el-get-source-name el-get-sources)))

;;; ---------------------------------------------------------------------------
;; add these packages if I am not server
(when (not on-lab-server)
  (setq my-packages
        (append
         '(edit-server
           bbdb)
         my-packages)))

;;; ---------------------------------------------------------------------------
;; package needed for only my laptop
(when on-laptop
  (setq my-packages
        (append
         '(emms textile-mode
                markdown-mode
                haml-mode
                sass-mode)
         my-packages)))

(el-get 'sync my-packages)
;; init-el-get.el ends here
