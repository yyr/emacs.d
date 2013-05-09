;;; init-twit.el
;; Created: Friday, April 12 2013

;;; twitter
(el-get 'sync 'twittering-mode)
(setq twittering-username "kindahero")
(setq twittering-use-master-password t)
(setq twittering-icon-mode t)
(setq twittering-use-icon-storage t)
;; (twittering-enable-unread-status-notifier)

(defun my-twit-keys ()
  (define-key twittering-mode-map "F" 'twittering-follow)
  (define-key twittering-mode-map "U" 'twittering-unfollow))

(my-twit-keys)

(setq twittering-status-format
      "%FOLD{%RT{%FACE[bold]{RT}}%i%s>>%r @%C{%Y-%m-%d %H:%M:%S} %@{}\n%FOLD[ ]{%T%RT{\nretweeted by %s @%C{%Y-%m-%d %H:%M:%S}}}}\n")


;;; Jabber
(el-get 'sync 'emacs-jabber)
(require 'jabber)
(setq jabber-account-list
      '(("yagneshmsc@gmail.com"
         (:network-server . "talk.google.com")
         (:connection-type . ssl))))

;;; init-twit.el ends here
