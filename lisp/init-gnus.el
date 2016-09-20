;;; init-gnus.el
;; http://yagnesh.org

(require 'nnimap)
(require 'starttls)

;; (require 'registry)

;;; load my bbdb settings
(load "init-bbdb")

;;; some mail secrets ;)
(if (file-exists-p "~/git/org/gnus-secret.el")
    (load-file "~/git/org/gnus-secret.el"))

;;; cache
(setq gnus-use-cache t)
(setq gnus-cacheable-groups "^gmane")

;;; Sources
;;; --------------------------------------------------------
;;; news
;;; --------------------------------------------------------
(when (not on-lab-server)
  ;; only laptop has leafnode installed
  ;;  (setq gnus-select-method '(nntp "localhost"))
  (setq gnus-select-method '(nntp "news.gmane.org")))

;;; -----------------------------------------------------------------------
;;; Mail
;;; -----------------------------------------------------------------------
;; Configure incoming mail (IMAP)
(setq gnus-secondary-select-methods '((nnml "")))

(add-to-list 'gnus-secondary-select-methods
             '(nnimap "yagmsc"
                      (nnir-search-engine imap)
                      (nnimap-address "imap.gmail.com")))

(add-to-list 'gnus-secondary-select-methods
             '(nnimap "hc"
                      (nnimap-address "mail.hcoop.net")))

(add-to-list 'gnus-secondary-select-methods
             '(nnimap "tropmet"
                      (nnimap-address "mail.tropmet.res.in")
                      (nnimap-stream network)
                      (nnimap-server-port 143)))


;;; localhost dovecot IMAP

;; (setq imap-shell-program '("/usr/lib/dovecot/imap 2> /dev/null"))
;; (if (file-directory-p "~/Maildir")
;;     (add-to-list 'gnus-secondary-select-methods
;;                  '(nnimap "localimap"
;;                           (nnimap-address "localhost")
;;                           (nnimap-stream ssl))))

(when on-lab-computer
  (add-to-list 'mail-sources '(pop :server "pop.hines.hokudai.ac.jp"
                                   :user "vh0004"
                                   :leave 14)))

;; (setq mail-source-delete-incoming t)
;; (setq mail-sources
;;       '((maildir :path "~/Maildir/live/")
;;         (maildir :path "~/Maildir/uni/")))

;; (setq gnus-invalid-group-regexp "[:`'\"]\\|^$")
;; (setq gnus-ignored-newsgroups "")

;;; -----------------------------------------------------------------------
;;; Gravatar
;;; -----------------------------------------------------------------------
;;; gravatar set up by TH from ding@gnus.org list
(require 'gravatar)
(require 'gnus-gravatar)

(defun th-gnus-article-prepared ()
  (gnus-treat-from-gravatar)
  (gnus-treat-mail-gravatar))
(add-hook 'gnus-article-prepare-hook 'th-gnus-article-prepared)

;;; -----------------------------------------------------------------------
;;; search
;;; -----------------------------------------------------------------------
(require 'nnir)

;;; -----------------------------------------------------------------------
;;;DEBUG
;;; --------------------------------------------------------
;; (defadvice gnus-group-get-new-news (around gnus-timeout activate)
;;   "Timeout for Gnus."
;;   (with-timeout
;;       (5 (message "Gnus timed out.") (debug))
;;     ad-do-it))

;;; -----------------------------------------------------------------------
;;; Group buffer
;;; -----------------------------------------------------------------------

;; Don't show me a group that has no new messages
(setq gnus-group-list-inactive-groups nil
      gnus-permanently-visible-groups nil
      gnus-list-groups-with-ticked-articles nil)

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

;;; http://www.randomsample.de/dru5/node/64
;; 0: gmane.emacs.gnus.user
;; 0:   .  .  .announce
;; 0:   .  .w3m
;; 0:   .  .devel
;; 0:   .  .bugs
;; 0:   .mail.getmail.announce
;; 0:   .  .mairix.user
;; 0:   .linux.debian.user.security.announce
;; 0: de.comm.software.gnus
(defun DE-collapse-group-names ()
  (save-excursion
    (let (previous-group current-group common-prefix
                         common-dot-count prefix suffix)
      (goto-char (point-min))
      (while (not (eobp))
        (when (setq current-group
                    (get-text-property (point) 'gnus-group))
          (setq current-group (symbol-name current-group))
          (when (string-match "\\(.+\\):\\(.+\\)" current-group)
            (setq current-group (match-string 2 current-group)))
          (setq common-prefix (substring current-group 0
                                         (mismatch previous-group current-group))
                common-dot-count (count ?. common-prefix)
                prefix (mapconcat (lambda (x) x)
                                  (make-list common-dot-count "  .") "")
                suffix (and (string-match
                             (format "\\([^.]*[.]\\)\\{%d\\}\\(.+\\)" common-dot-count)
                             current-group)
                            (match-string 2 current-group))
                previous-group current-group)
          (unless (zerop (length prefix))
            (when (search-forward current-group (point-at-eol) t)
              (let ((props (text-properties-at (1- (point)))))
                (replace-match (apply 'propertize (concat prefix suffix)
                                      props))))))
        (forward-line 1)))))

(add-hook 'gnus-group-prepare-hook 'DE-collapse-group-names)
(add-hook 'gnus-group-update-group-hook 'DE-collapse-group-names)

;;; -----------------------------------------------------------------------
;;; Summary Buffer
;;; -----------------------------------------------------------------------
(setq gnus-summary-gather-subject-limit 'fuzzy)
(setq gnus-summary-display-arrow t)

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

;;; Gmail envy http://emacs.wordpress.com/2007/10/07/gmail-envy/
(defun gnus-user-format-function-j (headers)
  (let ((to (gnus-extra-header 'To headers)))
    (if (string-match *yag-mails-regex* to)
        (if (string-match "," to) "~" "»")
      (if (or (string-match *yag-mails-regex*
                            (gnus-extra-header 'Cc headers))
              (string-match *yag-mails-regex*
                            (gnus-extra-header 'BCc headers)))
          "~"
        " "))))

(setq gnus-summary-line-format
      (concat
       "%0{%U%R%z%}"
       "%3{│%}" "%1{%d%}" "%3{│%}" ;; date
       " " "%uj" " "                    ; gmail style
       "%4{%-20,20f%}"               ;; name
       "  "
       "%3{│%}"
       "%1{%B%}"
       "%s\n"))

;;; -----------------------------------------------------------------------
;;; Article Buffer
;;; -----------------------------------------------------------------------
(require 'gnus-cite)

(setq gnus-visible-headers
      "^From:\\|^Newsgroups:\\|^Subject:\\|^Date:\\|^Followup-To:\\|^Reply-To:\\|^Organization:\\|^Summary:\\|^Keywords:\\|^To:\\|^[BGF]?Cc:\\|^Posted-To:\\|^Mail-Copies-To:\\|^Mail-Followup-To:\\|^Apparently-To:\\|^Gnus-Warning:\\|^Resent-From:\\|^X-Sent:\\|^User-Agent:\\|^X-Mailer:\\|^X-Newsreader:")

(setq gnus-article-update-date-headers nil)
(setq gnus-extra-headers  '(To Cc Bcc Keywords Gcc Newsgroups)
      nnmail-extra-headers gnus-extra-headers)
(setq gnus-break-pages nil)

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
             (gnus-article-date-local)))

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
                  (lambda (s)
                    (if (string-match " " s)
                        ""
                      (propertize s 'face (pop current-cflist))))
                  (make-vector depth (cadr my-citation-look)) "")
                 (caddr my-citation-look))))
          (dolist (line (cdr prefix))
            (goto-char (point-min)) (forward-line (1- line))
            (put-text-property (point) (+ (point) len) 'display look)))))
    (widen)))

(add-hook 'gnus-article-prepare-hook 'my-citation-style)

;;; -----------------------------------------------------------------------
;;; Gnus layout
;;; -----------------------------------------------------------------------
;; (gnus-add-configuration '(article
;;                           (vertical 1.0 (summary .35 point) (article 1.0))))

(mapc 'gnus-add-configuration
      '((group (horizontal 1.0 (group 1.0 point)))
        (summary (horizontal 1.0 (group 0.3)  (summary 1.0 point)))
        (article (horizontal 1.0 (summary 0.5 point) (article 1.0)))
        (forward (horizontal 1.0 (message 0.5 point) (article 1.0)))
        (server (vertical 1.0 (server 1.0 point)))
        (message (horizontal 1.0 (message 0.5 point) (article 1.0)))
        (reply (horizontal 1.0 (message 0.5 point) (article 1.0)))
        (reply-yank (horizontal 1.0 (message 0.5 point) (article 1.0)))))


;;; -----------------------------------------------------------------------
;;; Gnus Daemon
;;; -----------------------------------------------------------------------
(gnus-demon-add-handler 'gnus-demon-scan-news 15 t)


;;; -----------------------------------------------------------------------
;;; Gnus Agent
;;; -----------------------------------------------------------------------
(setq gnus-plugged t)

;;; -----------------------------------------------------------------------
;;; Spam
;;; -----------------------------------------------------------------------
(require 'spam)
(spam-initialize)
(setq spam-directory "~/gnus/spam/")

(setq gnus-spam-process-newsgroups
      '(("^gmane\\." . (((spam spam-use-gmane))))))

;;; MIME
;;; --------------------------------------------------
(setq mm-verify-option 'known)
(setq mm-decrypt-option 'known)
(add-to-list 'mm-attachment-override-types "image/.*")
(add-to-list 'mm-attachment-override-types "message/rfc822")
(add-to-list 'mm-attachment-override-types "text/x-patch")
(setq mm-inline-large-images 'resize)
(setq mm-discouraged-alternatives '("text/html" "text/richtext"))

;;; misc
;;; --------------------------------------------------
(setq gnus-expert-user 't)      ;dont prompt me when i want to quit gnus

;;; Guess url of gnus news article
(defun gnus-summary-guess-article-url ()
  "guess url of the article"
  (interactive)
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
                    (concat "http://article.gmane.org/"
                            (second msgids) "/" (third msgids))))))))
    (if url
        (browse-url (message url))
      (message "Couldn't find any likely url"))))

(add-hook 'gnus-startup-hook
          (lambda ()
            (define-key gnus-summary-mode-map
              (kbd "C-c C-o") 'gnus-summary-guess-article-url)))


(setq gnus-exit-gnus-hook '(mm-temp-files-delete mm-destroy-postponed-undisplay-list))

;; (when on-laptop
;;   (add-to-list 'gnus-exit-gnus-hook
;;                (lambda () (start-process "unison" nil "unison"))))

;;; footnotes
;;; --------------------------------------------------------
(setq footnote-section-tag "")
(setq footnote-style 'unicode)
(setq footnote-start-tag "")
(setq footnote-end-tag "")

;;; init-gnus.el ends here
