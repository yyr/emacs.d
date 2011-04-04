;;; init-gnus.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;;

;;; Citation
;; See the end

(require 'smtpmail)
(require 'nnimap)
(require 'starttls)

;;; Sources
;;; --------------------------------------------------------
;;; news
;;; --------------------------------------------------------
(setq gnus-select-method '(nntp "localhost"))

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


;;; bbdb
;;; --------------------------------------------------------
(require 'bbdb)
(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
(require 'bbdb-hooks)
(bbdb-initialize 'gnus 'message)
(bbdb-insinuate-message)
;; (setq bbdb-use-pop-up t)
(setq gnus-extra-headers '(To))


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


(setq gnus-group-line-format "%M\%S\%p\%5y: %G\n")


;;; summary mode
;;; --------------------------------------------------------
(setq
 gnus-sum-thread-tree-single-indent   "◎ "
 gnus-sum-thread-tree-false-root      "◯ " 
 gnus-sum-thread-tree-root            "● "
 gnus-sum-thread-tree-vertical        "│ "
 gnus-sum-thread-tree-leaf-with-other "├─► "
 gnus-sum-thread-tree-single-leaf     "╰─► "
 gnus-sum-thread-tree-indent          "  ")


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
      (insert (concat  "\n" (capitalize first) ",\n\n")))))

(setq message-signature (lambda () (shell-command-to-string "/usr/games/fortune -n perl")))

(add-hook 'message-mode-hook 'turn-on-orgtbl)
(add-hook 'message-mode-hook 'turn-on-orgstruct++)


(provide 'init-gnus)

;;; Citation
;; nibrahim https://github.com/nibrahim/Config-files/raw/master/emacs/.gnus

;;; init-gnus.el ends here

