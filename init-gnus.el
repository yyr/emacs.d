;;; init-gnus.el
;; http://yagnesh.org
;;

(require 'nnimap)
(require 'starttls)
;; (require 'registry)

;;; load my bbdb settings
(load "init-bbdb")
(load "init-message")

;;; folders
(setq gnus-home-directory "~/gnus")
(setq gnus-directory "~/gnus/News")
(setq message-directory "~/gnus/Mail")

;;; Sources
;;; --------------------------------------------------------
;;; news
;;; --------------------------------------------------------
(when (not on-lab-server)
  ;; only laptop has leafnode installed
  ;;  (setq gnus-select-method '(nntp "localhost"))
  (setq gnus-select-method '(nntp "news.gmane.org")))

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


;;; -----------------------------------------------------------------------
(defadvice gnus-group-get-new-news (around gnus-timeout activate)
  "Timeout for Gnus."
  (with-timeout
      (5 (message "Gnus timed out.") (debug))
    ad-do-it))


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

;; (setq gnus-summary-line-format ":%U%R %B %s %-60=| %5L |%-10,8f |%&user-date; \n")
;; gnus-summary-line-format "%U%R%z %(%&user-date;  %-15,15f %* %B%s%)\n"
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

(setq gnus-summary-gather-subject-limit 'fuzzy)

;;; article mode
;;; --------------------------------------------------------
(require 'gnus-cite)

(add-hook 'gnus-article-display-hook
          '(lambda ()
             (gnus-article-de-quoted-unreadable)
             (gnus-article-emphasize)
             (gnus-article-hide-boring-headers)
             (gnus-article-hide-headers-if-wanted)
             (gnus-article-hide-pgp)
             (gnus-article-highlight)
             (gnus-article-highlight-citation)
             ;; will actually convert timestamp from other timezones to yours
             (gnus-article-date-local)
             ))

(setq gnus-article-update-date-headers nil)
(setq gnus-extra-headers '(To))

;;; Philipp Haselwarter from ding mailing list
(defcustom my-citation-look '("" "│" "")
  "(prefix citation-string suffix)" :group 'my)

(defun my-citation-style nil
  (let ((inhibit-read-only t)
        (alist gnus-cite-face-list)
        cflist face gnus-cite-prefix-alist)
    (save-excursion
      (gnus-narrow-to-body)
      (gnus-cite-parse)
      (dolist (prefix gnus-cite-prefix-alist) ;(reverse
        (setq cflist (append cflist (list (car alist)))
              alist (cdr alist))
        (let* ((current-cflist cflist)
               (depth (length cflist))
               (len (length (car prefix)))
               (look
                (concat
                 (car my-citation-look)
                 (mapconcat
                  (lambda (s) (propertize s 'face (pop current-cflist)))
                  (make-vector depth (cadr my-citation-look)) "")
                 (caddr my-citation-look))))
          (dolist (line (cdr prefix))
            (goto-char (point-min)) (forward-line (1- line))
            (put-text-property (point) (+ (point) len) 'display look)))))
    (widen)))

(add-hook 'gnus-article-prepare-hook 'my-citation-style)

;;; layout
;;; --------------------------------------------------
;; (gnus-add-configuration '(article (vertical 1.0 (summary .35 point) (article 1.0))))

(gnus-add-configuration
 '(article
   (horizontal 1.0
               (vertical 25
                         (group 1.0))
               (vertical 1.0
                         (summary 0.25 point)
                         (article 1.0)))))

(gnus-add-configuration
 '(summary
   (horizontal 1.0
               (vertical 25
                         (group 1.0))
               (vertical 1.0
                         (summary 1.0 point)))))

;;; gnus daemon
;;; --------------------------------------------------
(gnus-demon-add-handler 'gnus-demon-scan-news 15 t)

;;; spam
;;; --------------------------------------------------
(spam-initialize)
(setq gnus-spam-process-newsgroups
      '(("^gmane\\." . (((spam spam-use-gmane))))))


;;; url

(add-hook 'gnus-startup-hook
          (lambda nil
            (define-key gnus-summary-mode-map (kbd "C-c C-o")
              (lambda () (interactive)
                (let ((url
                       (with-current-buffer gnus-article-buffer
                         (let ((msgids (split-string (aref gnus-current-headers 8) "[ :]")))
                           (cond ((and (equal (substring (second msgids) 0 6)
                                              "gwene.")
                                       (goto-char (point-max))
                                       (search-backward "Link" (point-min) 'noerror))
                                  (w3m-active-region-or-url-at-point))
                                 ((equal (substring (second msgids) 0 6)
                                         "gmane.")
                                  (concat "http://comments.gmane.org/" (second msgids) "/" (third msgids))))))))
                  (if url
                      (browse-url (message url))
                    (message "Couldn't find any likely url")))))))

;;; misc
;;; --------------------------------------------------
(setq gnus-expert-user 't)      ;dont prompt me when i want to quit gnus


;;; init-gnus.el ends here
