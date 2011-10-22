;;; init-gnus.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;;

;;; Citation
;; See the end

(require 'nnimap)
(require 'starttls)
(require 'registry)

;;; load my bbdb settings
(load "init-bbdb")

;;; folders
(setq gnus-home-directory "~/gnus")
(setq gnus-directory "~/gnus/News")
(setq message-directory "~/gnus/Mail")

;;; Sources
;;; --------------------------------------------------------
;;; news
;;; --------------------------------------------------------
(when on-laptop
  ;; only laptop has leafnode installed
  (setq gnus-select-method '(nntp "news.gmane.org"))
                                        ;  (setq gnus-select-method '(nntp "localhost"))
  )

;;; Mail
;;; --------------------------------------------------------
;; Configure incoming mail (IMAP)
(add-to-list 'gnus-secondary-select-methods '(nnml ""))

(add-to-list 'gnus-secondary-select-methods
             '(nnimap "yagmsc"
                      (nnir-search-engine imap)
                      (nnimap-address "imap.gmail.com")))

;; (setq gnus-invalid-group-regexp "[:`'\"]\\|^$")
;; (setq gnus-ignored-newsgroups "")

;;; gravatar set up by TH from ding@gnus.org list
(require 'gravatar)
(require 'gnus-gravatar)
(defun th-gnus-article-prepared ()
  (gnus-treat-from-gravatar)
  (gnus-treat-mail-gravatar))
(add-hook 'gnus-article-prepare-hook 'th-gnus-article-prepared)


;;; group mode
;;; --------------------------------------------------------
(defun gnus-topic-select-group (&optional all)
  "Select this newsgroup.
No article is selected automatically.
If the group is opened, just switch the summary buffer.
If ALL is non-nil, already read articles become readable.
If ALL is a number, fetch this number of articles.

pIf performed over a topic line, toggle folding the topic."
  (interactive "P")
  (when (and (eobp) (not (gnus-group-group-name)))
    (forward-line -1))
  (if (gnus-group-topic-p)
      (let ((gnus-group-list-mode
             (if all (cons (if (numberp all) all 7) t) gnus-group-list-mode)))
        (gnus-topic-fold all)
        (gnus-dribble-touch))
    (gnus-group-select-group all)))

(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

(setq gnus-group-line-format "%M\%S\%p\%5y: %G\n")


;;; summary mode
;;; --------------------------------------------------------

(setq-default
 ;; gnus-summary-line-format "%U%R%z %(%&user-date;  %-15,15f %* %B%s%)\n"
 ;; gnus-user-date-format-alist '((t . "%Y-%m-%d %H:%M"))
 gnus-user-date-format-alist '((t . "%m-%d %H:%M"))

 gnus-summary-thread-gathering-function 'gnus-gather-threads-by-references
 gnus-thread-sort-functions '(gnus-thread-sort-by-date)
 gnus-summary-display-arrow t
 gnus-summary-same-subject ""
 gnus-sum-thread-tree-single-indent   "● "
 gnus-sum-thread-tree-false-root      "☆ "
 gnus-sum-thread-tree-root            "◎ "
 gnus-sum-thread-tree-indent          "  "
 gnus-sum-thread-tree-vertical        "│ "
 gnus-sum-thread-tree-leaf-with-other "├► "
 gnus-sum-thread-tree-single-leaf     "╰► "
 )

(setq gnus-summary-line-format
      (concat
       "%0{%U%R%z%}"
       "%3{│%}" "%1{%d%}" "%3{│%}" ;; date
       "  "
       "%4{%-20,20f%}"               ;; name
       "  "
       "%3{│%}"
       " "
       "%1{%B%}"
       "%s\n"))
(setq gnus-summary-display-arrow t)


(defalias 'gnus-user-format-function-M 'gnus-registry-user-format-function-M)

;;; article mode
;;; --------------------------------------------------------
(add-hook 'gnus-article-display-hook
          '(lambda ()
             (gnus-article-de-quoted-unreadable)
             (gnus-article-emphasize)
             (gnus-article-hide-boring-headers)
             (gnus-article-hide-headers-if-wanted)
             (gnus-article-hide-pgp)
             (gnus-article-highlight)
             (gnus-article-highlight-citation)
             (gnus-article-date-local)              ; will actually convert timestamp from other timezones to yours
             ))

(setq gnus-article-update-date-headers nil)


;;; message mode
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

;;; spam
;;; --------------------------------------------------
(spam-initialize)
(setq gnus-spam-process-newsgroups
      '(("^gmane\\." . (((spam spam-use-gmane))))))

;; Smtp
;;;------------------------------------------------
(require 'smtpmail)

(setq send-mail-function 'smtpmail-send-it) ; if you use `mail'
(setq message-send-mail-function 'smtpmail-send-it) ; if you use message/Gnus

;; (setq smtpmail-default-smtp-server "smtp.gmail.com")
(setq smtpmail-smtp-server "smtp.gmail.com")
;; (setq smtpmail-local-domain "YOUR DOMAIN NAME")
;; (setq smtpmail-sendto-domain "YOUR DOMAIN NAME")
(setq smtpmail-debug-info t) ; only to debug problems
(setq smtpmail-stream-type 'starttls)


;;; misc
;;; --------------------------------------------------
(setq gnus-expert-user 't)      ;dont prompt me when i want to quit gnus




;;; Citation
;; nibrahim https://github.com/nibrahim/Config-files/raw/master/emacs/.gnus

;;; init-gnus.el ends here
