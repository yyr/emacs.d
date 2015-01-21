;; init-yasnip.el

;;; load
(el-get 'sync '(yasnippet))
(yas-global-mode 1)

;;; snippet dir
(add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets/")
(el-get 'sync 'yasnippet-snippets)
(add-to-list 'yas-snippet-dirs "~/.emacs.d/el-get/yasnippet-snippets/" t)

;;; Stop blabbering
(setq yas-verbosity 1)
(add-to-list 'auto-mode-alist
             '("\\.yasnippet$" . snippet-mode))
;;; init-yasnip.el ends here
