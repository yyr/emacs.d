;;; init-bbdb.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;;

(require 'bbdb)

(setq bbdb-file "~/git/org/.bbdb")
(bbdb-initialize 'gnus)

(setq
 bbdb-offer-save 'auto
 bbdb-notice-auto-save-file t
 bbdb-expand-mail-aliases t
 bbdb-canonicalize-redundant-nets-p t
 bbdb-always-add-addresses t
 bbdb-complete-name-allow-cycling t
 )


(defun bbdb/gnus-update-selectively ()
  "Update BBDB record selectively"
  (interactive)
  (if
      (gnus-news-group-p gnus-newsgroup-name)
      (setq bbdb/gnus-update-records-p nil)
    (setq bbdb/gnus-update-records-p 'query)
    ))

(add-hook 'gnus-summary-prepare-hook 'bbdb/gnus-update-selectively)

;; (require 'bbdb)
;; (add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
;; (require 'bbdb-hooks)
;; (bbdb-initialize 'gnus 'message)
;; (bbdb-insinuate-message)
;; ;; (setq bbdb-use-pop-up t)
;; (setq gnus-extra-headers '(To))

;;; init-bbdb.el ends here
