;;; init-message.el
;; Created: Wednesday, December  7 2011

;; message mode
(add-hook 'message-setup-hook 'bbdb-get-mail-aliases)

;;; --------------------------------------------------------
;;; Auto hello thank you
(defadvice gnus-summary-reply (after formalities () activate)
  (de-add-formalities))

(defun de-add-formalities ()
  "Add hello and Thank you to my emails"
  (save-excursion
    (message-goto-signature)
    (previous-line 2)
    (insert "\n\nThanks.,"))

  (let* ((to (message-fetch-field "To"))
         (address-comp (mail-extract-address-components to))
         (name (car address-comp))
         (first (or (and name (concat "" (car (split-string name))))
                    "")))
    (when first
      (message-goto-body)
      (insert (concat  "\nHello " (capitalize first) ",\n\n")))))

(setq message-signature t
      message-signature-file "~/.signature")

;; (setq message-signature (lambda () (shell-command-to-string "/usr/games/fortune -n perl")))
;; (add-hook 'message-send-hook 'ispell-message)

;;; Every mail sent from gnus will have a Bcc and equal to From id So server
;;; has a copy of outgoing email. This also allows to use a localhost smtp
;;; server.
(setq message-default-mail-headers "Bcc: \n")
(defun message-update-bcc-from-from ()
  (let ((from
         (save-restriction
           (message-narrow-to-headers)
           (message-fetch-field "From"))))
    (message-goto-bcc)
    (unless (message-fetch-field "Bcc")
        (insert (format " %s" from)))))

(setq gnus-message-setup-hook 'message-update-bcc-from-from)

(setq gnus-confirm-mail-reply-to-news t
      message-kill-buffer-on-exit t
      message-elide-ellipsis "[…]\n")

;;; quoting style in reply
(setq message-citation-line-function 'message-insert-formatted-citation-line)
(setq message-citation-line-format "On %b %d %Y, %f wrote:\n")

;;; --------------------------------------------------------
;; sent copy
(setq gnus-message-archive-group
      '((if (message-news-p)
            "nnml:mail.sent.news"
          "nnml:mail.sent.mail")))

(setq message-user-agent 'gnus-user-agent)
(setq mail-user-agent 'gnus-user-agent)

;;; footnotes
(autoload 'footnote-mode "footnote" nil t)
(add-hook 'message-mode-hook 'footnote-mode)

;;; init-message.el ends here
