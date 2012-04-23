;;; init-message.el
;;
;;    File: init-message.el
;; Created: Wednesday, December  7 2011

;;; Description:
;; message mode

;;; --------------------------------------------------------
;;; auto hello thank you
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

(add-hook 'message-send-hook 'ispell-message)

(add-hook 'message-mode-hook 'turn-on-orgstruct++)
(add-hook 'message-mode-hook 'turn-on-orgtbl)

(add-hook 'message-mode-hook
          (lambda ()
            (setq fill-column 78)
            (turn-on-auto-fill)))

(setq gnus-confirm-mail-reply-to-news t
      message-kill-buffer-on-exit t
      message-elide-ellipsis "[…]\n")

;;; --------------------------------------------------------
;; sent copy
(setq gnus-message-archive-group
      '((if (message-news-p)
            "nnml:mail.sent.news"
          "nnml:mail.sent.mail")))


;;; footnotes
(autoload 'footnote-mode "footnote" nil t)
(add-hook 'message-mode-hook 'footnote-mode)

;;; init-message.el ends here
