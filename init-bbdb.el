;;; init-bbdb.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;;

(setq bbdb-file "~/git/org/.bbdb")
(el-get 'sync 'bbdb)

(require 'bbdb)
(bbdb-initialize 'gnus 'message)

(setq
 ;; bbdb-offer-save 'auto
 bbdb-offer-save 1                        ;; 1 means save-without-asking

 bbdb-notice-auto-save-file t
 bbdb-expand-mail-aliases t

 bbdb-offer-save (quote savenoprompt)
 bbdb-layout 'one-line
 bbdb-pop-up-layout 'pop-up-multi-line

 bbdb-use-pop-up t                        ;; allow popups for addresses
 bbdb-electric-p t                        ;; be disposable with SPC
 bbdb-popup-target-lines  1               ;; very small
 bbdb-dwim-net-address-allow-redundancy t ;; always use full name
 bbdb-quiet-about-name-mismatches 2       ;; show name-mismatches 2 secs

 bbdb-always-add-address t                ;; add new addresses to existing...
 ;; ...contacts automatically
 bbdb-canonicalize-redundant-nets-p t     ;; x@foo.bar.cx => x@bar.cx

 bbdb-completion-type nil                 ;; complete on anything

 bbdb-complete-name-allow-cycling t       ;; cycle through matches
 ;; this only works partially
 bbdb-phone-style nil

 bbbd-message-caching-enabled t           ;; be fast
 bbdb-use-alternate-names t               ;; use AKA
 bbdb-elided-display t                    ;; single-line addresses
 bbdb-completion-display-record nil     ; don't display window after completion

 ;; auto-create addresses from mail
 bbdb/message-update-records-p  t ; mua specific option, store all sent mail ids

 bbdb-ignore-some-messages-alist ;; don't ask about fake addresses
 '(( "From" . "no.?reply\\|DAEMON\\|daemon\\|facebookmail"))
 )

(defun bbdb/gnus-update-selectively ()
  "Update BBDB record selectively"
  (interactive)
  (if (gnus-news-group-p gnus-newsgroup-name)
      (setq bbdb/gnus-update-records-p nil)
    (setq bbdb/gnus-update-records-p 'query)))

(add-hook 'gnus-summary-prepare-hook
          (defun my-bbdb-hook ()
            (bbdb/gnus-update-selectively)
            (local-set-key (kbd "\"")
                           (lambda ()
                             (interactive)
                             (bbdb-mua-update-records)))))

(bbdb-mua-auto-update-init 'gnus 'message)
(setq bbdb-mua-update-interactive-p '(query . create))
(define-key gnus-summary-mode-map (kbd ":")
  'bbdb-mua-display-records)

;;; init-bbdb.el ends here
