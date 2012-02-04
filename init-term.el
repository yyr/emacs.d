;;; init-term.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: init-term.el
;; Created: Saturday, February  4 2012
;; License: GPL v3 or later. <http://www.gnu.org/licenses/gpl.html>

;;; Description:
;;

;;; comint

;; (require 'comint)

(setq-default
 comint-scroll-to-bottom-on-input t    ; always insert at the bottom
 comint-scroll-to-bottom-on-output nil ; always add output at the bottom
 comint-scroll-show-maximum-output t ; scroll to show max possible output
 comint-input-ignoredups t          ; no duplicates in command history
 comint-completion-addsuffix t ; insert space/slash after file completion
 comint-buffer-maximum-size 20000  ; max length of the buffer in lines
 comint-input-ring-size 5000 ; max shell history size
 )

;; truncate buffers continuously
(add-hook 'comint-output-filter-functions 'comint-truncate-buffer)

;; interpret and use ansi color codes in shell output windows
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;; tramp
(setq tramp-default-method "ssh")

;;; init-term.el ends here
