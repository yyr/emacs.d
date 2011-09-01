;;; init-el-get.el
;; 
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: init-el-get.el
;;  Author: Yagnesh Raghava Yakkala <yagnesh@NOSPAM.live.com>
;; Created: 
;; Licence: GPL v3 or later. You should get a copy from <http://www.gnu.org/licenses/gpl.html>

;;; Description:
;;

;;from steves emacs.d git http://git.sanityinc.com/
(when (not (load "~/.emacs.d/el-get/el-get/el-get.el" t))
  (error
   "Please bootstrap el-get using the instructions here:
   http://github.com/dimitri/el-get/, then restart Emacs"))

(setq el-get-is-lazy 't)

;; compile at init if any source is not byte compiled
;; (setq el-get-byte-compile-at-init 't)

;; my sources
(setq el-get-sources
      '(
;;;; help typing
        (:name auto-complete
               :type git
               :url "git://github.com/m2ym/auto-complete.git")
        ))

;; el-get provided sources
(setq my-packages
      (append
       '(
;;;; Basics
         ;; package24
	 byte-code-cache

;;;; general
         dictem

;;;; navigation
	 smex
         dired-plus

;;;; help typing
         yasnippet
         ac-math
         ac-octave
         highlight-parentheses
         autopair

;;;; Cosmetics
         diminish
         boxquote
         
;;;; Org
         org-mode
         calfw
         epresent

;;;; DVC
         magit

;;;; langs
         ;; elisp
         paredit
         hl-sexp
         
         ;; python
         pymacs
         ;; ropemacs

         textile-mode
         markdown-mode
         haml-mode
         sass-mode
         yaml-mode

;;;; Sub
         auctex
         ebib

         ncl
         emacs-grads
         gnuplot-mode

;;;; web & mail
         bbdb
         emacs-w3m
         yaoddmuse

;;; sys
         crontab-mode
         screenshot

;;;; misc
         emms
	 profile-dotemacs

         el-get)
       
       (mapcar 'el-get-source-name el-get-sources)))


(el-get 'sync my-packages)

(provide 'init-el-get)
;; init-el-get.el ends here
