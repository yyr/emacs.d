;; init-yasnip.el

(require 'yasnippet)

(setq yas/snippet-dirs "~/.emacs.d/snippets/")
(yas/initialize)

(setq yas/root-directory
      '("~/.emacs.d/mysnippets/"
        "~/.emacs.d/snippets/"
        "~/.emacs.d/el-get/yasnippet/snippets/"))

(mapc 'yas/load-directory yas/root-directory)

(add-to-list 'auto-mode-alist
             '("\\.yasnippet$" . snippet-mode))

;;; init-yasnip.el ends here
