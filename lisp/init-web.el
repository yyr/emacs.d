;;; init-web.el

(after 'webjump
  (setq webjump-sites
        (append '(("yorg" . "yagnesh.org")
                  ("sap" . "sapporoindians.net"))
                webjump-sample-sites)))

(global-set-key "\C-cj" 'webjump)
(setq browse-url-firefox-program "firefox")

;;; sx
(el-get 'sync 'sx)

;;; Tinkerer
(el-get 'sync 'tinkerer)
(setq tinkerer-root-path "~/git/yorg/")

;;; init-web.el ends here
