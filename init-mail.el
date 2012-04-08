;;; init-mail.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: init-mail.el
;; Created: Thursday, November 10 2011
;; License: GPL v3 or later. <http://www.gnu.org/licenses/gpl.html>

;;; Description:
;; mail settings
;; apply even before gnus starts.

;;; msmtp
;;---------------------
(require 'smtpmail)

(setq message-send-mail-function 'message-send-mail-with-sendmail)
;; we substitute sendmail with msmtp
(setq sendmail-program "/usr/bin/msmtp")

(defun cg-feed-msmtp ()
  "Switch msmtp args by looking at the `From' address in the mail headers,
"
  (if (message-mail-p)
      (save-excursion
        (let* ((from
                (save-restriction
                  (message-narrow-to-headers)
                  (message-fetch-field "From")))
               (account
                (cond
                 ;; CHANGE HERE according to your mail .msmtprc
                 ((string-match "live.com" from)
                  "live")
                 ;; CHANGE HERE according to your mail id
                 ((string-match "yagneshmsc" from)
                  "gmail"))))
          (message "mstmp args given: -a %s" account)
          (setq message-sendmail-extra-arguments (list '"-a" account))))))

(add-hook 'message-send-mail-hook 'cg-feed-msmtp)
(setq message-sendmail-envelope-from 'header)


(add-to-list 'auto-mode-alist '("\\.eml$" . message-mode))
;;; init-mail.el ends here
