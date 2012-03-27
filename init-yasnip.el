;; init-yasnip.el

;;; load
(el-get 'sync '(yasnippet))

;;; Snippet Dir
(setq yas/snippet-dirs '("~/.emacs.d/mysnippets/"
                         "~/.emacs.d/snippets/"
                         "~/.emacs.d/el-get/yasnippet/snippets/"))

;;; load snippets at the end
(add-hook 'after-init-hook 'yas/initialize)

(add-to-list 'auto-mode-alist
             '("\\.yasnippet$" . snippet-mode))
;;; init-yasnip.el ends here
