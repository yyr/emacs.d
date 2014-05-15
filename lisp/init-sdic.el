;;; init-sdic.el
;; -*- coding: utf-8; -*-
;;
;; Author: Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: init-sdic.el
;; Created: Thursday, July 26 2012

;;; Description:
;;

;; (setq sdic-default-coding-system 'euc-japan-unix)

(defvar sdic-install-dir (expand-file-name "~/git/sdic"))

;;; sdic-mode 用の設定
;;; autoload
(setq load-path (cons "/home/yagnesh/git/sdic/" load-path))
(autoload 'sdic-describe-word "sdic" "英単語の意味を調べる" t nil)
(autoload 'sdic-describe-word-at-point "sdic" "カーソルの位置の英単語の意味を調べる" t nil)

;;; global key binding
(global-set-key "\C-cw" 'sdic-describe-word)
(global-set-key "\C-cW" 'sdic-describe-word-at-point)


;; (el-get 'sync 'sdic-inline-pos-tip)
;;; setup dict
(setq sdic-eiwa-dictionary-list
      `((sdicf-client ,(expand-file-name
                        (concat sdic-install-dir "/dicts/gene.sdic")))
        (sdicf-client ,(expand-file-name
                        (concat sdic-install-dir "/dicts/eiji-126.sdic")))))

(setq sdic-waei-dictionary-list
      `((sdicf-client ,(expand-file-name
                        (concat sdic-install-dir "/dicts/edict.sdic")))
        (sdicf-client ,(expand-file-name
                        (concat sdic-install-dir "/dicts//waeiji-126.sdic"))
                      (add-keys-to-headword t))))

(setq sdic-inline-eiwa-dictionary "/home/yagnesh/git/sdic/dicts/eiji-126-utf8.sdic")
(setq sdic-inline-waei-dictionary "/home/yagnesh/git/sdic/dicts/waeiji-126-utf8.sdic")

(setq sdic-inline-search-func 'sdic-inline-search-word-with-stem)
(setq sdic-inline-dictionary-encoding 'utf-8-unix)


;;; init-sdic.el ends here
