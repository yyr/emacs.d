;;; init-message.el
;;
;;    File: init-message.el
;;  Author: Yagnesh Raghava Yakkala <yagnesh@NOSPAM.live.com>
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
    )
  (let* ((to (message-fetch-field "To"))
         (address-comp (mail-extract-address-components to))
         (name (car address-comp))
         (first (or (and name (concat "" (car (split-string name))))
                    "")))
    (when first
      (message-goto-body)
      (insert (concat  "\nHi " (capitalize first) ",\n\n")))))

(setq message-signature t
      message-signature-file "~/.signature")
;; (setq message-signature (lambda () (shell-command-to-string "/usr/games/fortune -n perl")))

(add-hook 'message-mode-hook 'turn-on-orgstruct++)
(add-hook 'message-mode-hook 'turn-on-orgtbl)

;;; footnotes
(autoload 'footnote-mode "footnote" nil t)
(add-hook 'message-mode-hook 'footnote-mode)

;;; init-message.el ends here
