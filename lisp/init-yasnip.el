;; init-yasnip.el

;;; load
(el-get 'sync '(yasnippet
                yasnippet-snippets))

(add-hook 'prog-mode-hook #'yas-minor-mode)

;;; snippet dir
(eval-after-load "yasnippet"
  `(progn
     (add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets/")
     (add-to-list 'yas-snippet-dirs "~/.emacs.d/el-get/yasnippet-snippets/" t)
     (yas-reload-all)))

;;; Stop blabbering
(setq yas-verbosity 1)
(add-to-list 'auto-mode-alist
             '("\\.yasnippet$" . snippet-mode))
;;; init-yasnip.el ends here
