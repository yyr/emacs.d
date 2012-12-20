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

(defun domain-whois ()
  (interactive)
  (let* ((q (read-from-minibuffer "Domain name: "))
         (q-url (format "%s%s%s" "http://reports.internic.net/cgi/whois?whois_nic="
                        q "&type=domain")))
    (message "Browsing: %s" q-url)
    (browse-url q-url)))

;;; init-webjump.el ends here
