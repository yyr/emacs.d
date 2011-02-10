;;; init-gnus.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;;

;; Configure incoming mail (IMAP)
(setq gnus-select-method '(nntp "news.gmane.org"))

(setq gnus-secondary-select-method '(nnimap "gmail"
					    (nnimap-address "imap.gmail.com")
					    (nnimap-server-port 993)
					    (nnimap-authinfo-file "~/.imap-authinfo")
					    (nnimap-stream ssl)))

;;; init-gnus.el ends here
