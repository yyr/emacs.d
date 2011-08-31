;;; init-bbdb.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;;

(require 'bbdb)
(require 'bbdb-autoloads)

(setq bbdb-file "~/git/org/.bbdb")
(bbdb-initialize)

(setq
 bbdb-offer-save 'auto
 bbdb-notice-auto-save-file t
 bbdb-expand-mail-aliases t
 bbdb-canonicalize-redundant-nets-p t
 bbdb-always-add-addresses t
 bbdb-complete-name-allow-cycling t
 )

;; (require 'bbdb)
;; (add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
;; (require 'bbdb-hooks)
;; (bbdb-initialize 'gnus 'message)
;; (bbdb-insinuate-message)
;; ;; (setq bbdb-use-pop-up t)
;; (setq gnus-extra-headers '(To))

(provide 'init-bbdb)
;;; init-bbdb.el ends here
