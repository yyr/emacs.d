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



;;; init-erc.el ends here
