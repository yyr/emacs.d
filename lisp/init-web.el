;;; init-web.el

(ensure-package-installed 'tinkerer)

(after 'webjump
  (setq webjump-sites
        (append '(("yorg" . "yagnesh.org"))
                webjump-sample-sites)))

(global-set-key "\C-cj" 'webjump)
(setq browse-url-firefox-program "firefox")

;;; sx
;; (el-get 'sync 'sx)

;;; Tinkerer
(setq tinkerer-root-path "~/git/yorg/")

;;; init-web.el ends here
