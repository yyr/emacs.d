;;; init-erc.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: init-erc.el
;; Created: Saturday, August 20 2011
;; License: GPL v3 or later. You should get a copy from <http://www.gnu.org/licenses/gpl.html>

;;; Description:
;;;

;;; http://delysid.org/emacs/erc.html
(eval-after-load "erc"
  '(progn
     (setq erc-auto-query t
           erc-bbdb-auto-create-on-whois-p t
           erc-fill-column (- (window-width) 2)
           erc-pals '("" "")
           erc-notify-list erc-pals)

                                        ;    (require 'erc-bbdb)
     ;; Set personal information
     (setq erc-nick "kindahero")
     (setq erc-user-full-name "dontknow")

     ;; Set autojoin channels
     (setq erc-autojoin-channels-alist
           '(("freenode.net" "#emacs")))
     (require 'erc-imenu)
     (require 'erc-menu)
     (require 'erc-notify)
     (require 'erc-ring)
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


;;; init-erc.el ends here
