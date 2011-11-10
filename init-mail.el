;;; init-mail.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: init-mail.el
;; Created: Thursday, November 10 2011
;; License: GPL v3 or later. <http://www.gnu.org/licenses/gpl.html>

;;; Description:
;; mail settings
;; apply even before gnus starts.

;; Smtp
;;;------------------------------------------------
(setq send-mail-function 'smtpmail-send-it)
(require 'smtpmail)

(setq message-send-mail-function 'smtpmail-send-it)
(setq smtpmail-smtp-server "localhost")  ; use local server postfix
(setq smtpmail-smtp-service "smtp")     ; through localhost server

;(setq smtpmail-debug-info t) ; only to debug problems
(setq smtpmail-stream-type 'starttls)

;;; init-mail.el ends here
