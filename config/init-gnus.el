;;; init-gnus.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;;

;; Configure incoming mail (IMAP)
;; (setq gnus-select-method '(nntp "news.gmane.org"))
(setq gnus-select-method '(nntp "localhost"))
(add-to-list 'gnus-secondary-select-methods '(nnml ""))

(require 'smtpmail)
(require 'nnimap)
(require 'starttls)

(setq gnus-secondary-select-method '(nnimap "imap.gmail.com"
				  (nnimap-address "imap.gmail.com")
				  (nnimap-server-port 993)
				  (nnimap-authinfo-file "~/.authinfo")
				  (nnimap-stream ssl)))

;; (setq smtpmail-smtp-server "smtp.hines.hokudai.ac.jp"
;;       smtpmail-default-smtp-server "smtp.hines.hokudai.ac.jp"
;;       send-mail-function 'smtpmail-send-it
;;       message-send-mail-function 'smtpmail-send-it
;;       smtpmail-smtp-service 25
;;       )

(setq smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-default-smtp-server "smtp.gmail.com"
      send-mail-function 'smtpmail-send-it
      message-send-mail-function 'smtpmail-send-it
      smtpmail-smtp-service 587
      )

(add-hook 'gnus-topic-mode-hook 'gnus-topic-mode)
;; (setq gnus-invalid-group-regexp "[:`'\"]\\|^$")
;; (setq gnus-ignored-newsgroups "")
;; (setq gnus-outgoing-message-group "[Google Mail]/Sent Mail")

;;; gravatar set up by TH from ding@gnus.org list
(require 'gravatar)
(require 'gnus-gravatar)
(defun th-gnus-article-prepared ()
  (gnus-treat-from-gravatar)
  (gnus-treat-mail-gravatar))
(add-hook 'gnus-article-prepare-hook 'th-gnus-article-prepared)


(provide 'init-gnus)
;;; init-gnus.el ends here
