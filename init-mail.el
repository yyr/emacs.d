;;; init-mail.el
;; Created: Thursday, November 10 2011

;;; Description:
;; mail settings
;; apply even before gnus starts.

;;; msmtp
;;---------------------
(setq mail-user-agent 'gnus-user-agent)

(require 'smtpmail)
(setq message-send-mail-function 'message-send-mail-with-sendmail)
;; we substitute sendmail with msmtp
(setq sendmail-program "/usr/bin/msmtp")

(defun msmtp-switch-args ()
  "Switches msmtp args by looking at the `From' address in the mail headers,
NOTE: for a \"gmail\" switch there should be corresponding
\"gmail\" account in your ~/.msmtprc.
"
  (if (message-mail-p)
      (save-excursion
        (let* ((from
                (save-restriction
                  (message-narrow-to-headers)
                  (message-fetch-field "From")))

               (account
                (cond
                 ;; live
                 ((string-match "live.com" from)
                  "live")

                 ;; gmail
                 ((string-match "yagneshmsc" from)
                  "gmail")

                 ;; lab mail
                 ((string-match "yagnesh@hokudai" from)
                  "hokudai")

                 (t
                  "default"))))
          (message "mstmp args given: -a %s" account)
          (setq message-sendmail-extra-arguments (list '"-a" account))))))

(add-hook 'message-send-mail-hook 'msmtp-switch-args)
(setq message-sendmail-envelope-from 'header)

(add-to-list 'auto-mode-alist '("\\.eml$" . message-mode))
;;; init-mail.el ends here
