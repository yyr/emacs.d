;;; init-webjump.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; License: GPL v3 or later

(after 'webjump
  (setq webjump-sites
        (append '(("yorg" . "yagnesh.org")
                  ("sap" . "sapporoindians.net"))
                webjump-sample-sites)))

(global-set-key "\C-cj" 'webjump)

;;; init-webjump.el ends here
