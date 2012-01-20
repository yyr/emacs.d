;;; init-webjump.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; License: GPL v3 or later

(require 'webjump)
(setq webjump-sites
      (append '(
                ("yorg" . "yagnesh.org")
                ("wv" . "www.webvanitha.com ")
                ("sk" . "surabhikirti.com")
                ("sap" . "sapporoindians.net")
                ("huisa"   . "huisa.net")
                )
              webjump-sample-sites))
;(global-set-key "\C-cj" 'webjump)

;;; init-webjump.el ends here
