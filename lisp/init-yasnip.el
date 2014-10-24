;; init-yasnip.el

;;; load
(el-get 'sync '(yasnippet))

;;; Snippet Dir
(setq yas/snippet-dirs '("~/.emacs.d/mysnippets/"
                         "~/.emacs.d/snippets/"
                         "~/.emacs.d/el-get/yasnippet/snippets/"))

;;; Stop blabbering
(setq yas-verbosity 1)
(yas-global-mode 1)

(add-to-list 'auto-mode-alist
             '("\\.yasnippet$" . snippet-mode))
;;; init-yasnip.el ends here
