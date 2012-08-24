;; init-yasnip.el

;;; load
(el-get 'sync '(yasnippet))
(require 'yasnippet)

;;; Snippet Dir
(setq yas/snippet-dirs '("~/.emacs.d/mysnippets/"
                         "~/.emacs.d/snippets/"
                         "~/.emacs.d/el-get/yasnippet/snippets/"))

;;; Stop blabbering
(setq yas-verbosity 1)

;;; load snippets at the end
;(add-hook 'after-init-hook 'yas/initialize)

(yas-global-mode)

(add-to-list 'auto-mode-alist
             '("\\.yasnippet$" . snippet-mode))
;;; init-yasnip.el ends here
