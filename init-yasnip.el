;; init-yasnip.el

(require 'yasnippet)

(setq yas/snippet-dirs '("~/.emacs.d/mysnippets/"
                         "~/.emacs.d/snippets/"
                         "~/.emacs.d/el-get/yasnippet/snippets/"))

(add-hook 'after-init-hook 'yas/initialize)

(add-to-list 'auto-mode-alist
             '("\\.yasnippet$" . snippet-mode))
;;; init-yasnip.el ends here
