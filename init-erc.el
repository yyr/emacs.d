;;; init-erc.el
;;    File: init-erc.el
;; Created: Saturday, August 20 2011

(setq erc-anonymous-login nil)
(setq erc-beep-p t)

;; Set personal information
(setq erc-nick "kindahero")
(setq erc-user-full-name "dontknow")

(setq erc-server-coding-system '(utf-8 . undecided))
(setq erc-echo-notices-in-minibuffers-flag t)
(add-hook 'erc-echo-notice-hook 'erc-echo-notice-in-active-buffer)

;; Set autojoin channels
(setq erc-autojoin-channels-alist
      '((".*\\.freenode.net" "#emacs" "#hcoop" "#guile")))

;; check channels
(erc-track-mode t)
(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE"
                                "324" "329" "332" "333" "353" "477"))
;; don't show any of this
(setq erc-hide-list '("JOIN" "PART" "QUIT" "NICK"))

(eval-after-load "erc"
  '(progn
     ;; (require 'erc-bbdb)
     ;; Set personal information
     (setq erc-nick "kindahero")
     (setq erc-user-full-name "dontknow")

     (require 'erc-imenu)
     (require 'erc-menu)
     (require 'erc-notify)
     (require 'erc-ring)
     (require 'erc-log)

     (setq erc-auto-query t
           erc-bbdb-auto-create-on-whois-p t
           erc-fill-column (- (window-width) 2)
           erc-pals '("" "")
           erc-notify-list erc-pals
           erc-log-channels-directory "~/.emacs.d/.erc/logs/"
           erc-hide-timestamps nil
           erc-log-insert-log-on-open nil)

     (erc-button-mode 1)
     (erc-completion-mode 1)
     (erc-fill-mode 1)
     (erc-match-mode 1)
     (erc-netsplit-mode 1)
     (erc-services-mode 1)
     (erc-timestamp-mode 1)
     (erc-track-mode 1)
     (add-hook 'erc-mode-hook 'erc-add-scroll-to-bottom)))


;; Set autoconnect networks
(defun my-erc ()
  "Connect to my default ERC servers."
  (interactive)
  (erc-tls :server "irc.freenode.net" :port 7000))

(defun erc-start-or-switch ()
  (interactive)
  (if (get-buffer "irc.freenode.net:7000")
      (erc-track-switch-buffer 1)
    (when (y-or-n-p "Start ERC? ")
      (erc-tls :server "irc.freenode.net" :port 7000))))

(global-set-key (kbd "C-c e") 'erc-start-or-switch)

(defun erc/erc-autoaway ()
  "erc autoaway"
  (require 'erc-autoaway)
  (setq erc-auto-discard-away t)
  (setq erc-autoaway-idle-seconds 600)
  (setq erc-auto-set-away t)
  (setq erc-autoaway-use-emacs-idle t))

(add-hook 'erc-mode 'erc/erc-autoaway)
;;; init-erc.el ends here
