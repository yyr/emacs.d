;;; init-web.el

(after 'webjump
  (setq webjump-sites
        (append '(("yorg" . "yagnesh.org")
                  ("sap" . "sapporoindians.net"))
                webjump-sample-sites)))

(global-set-key "\C-cj" 'webjump)

(el-get 'sync 'sx)

;;; init-web.el ends here
