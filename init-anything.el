;;; init-anything.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: init-anything.el
;;  Author: Yagnesh Raghava Yakkala <yagnesh@NOSPAM.live.com>
;; Created: Monday, September 12 2011
;; Licence: GPL v3 or later.
;;  You should get a copy from <http://www.gnu.org/licenses/gpl.html>


;;; Description:
;; Anything configurations

(require 'anything-match-plugin)
(require 'anything-config)

(global-set-key
 (kbd "C-x b")
 (lambda() (interactive)
   (anything
    :prompt "Switch to: "
    :candidate-number-limit 10 ;; up to 10 of each
    :sources
    '(anything-c-source-buffers   ;; buffers
      anything-c-source-recentf   ;; recent files
      anything-c-source-bookmarks ;; bookmarks
      anything-c-source-files-in-current-dir+ ;; current dir
      ))))

(global-set-key
 (kbd "C-c I") ;; i -> info
 (lambda () (interactive)
   (anything
    :prompt "Info about: "
    :candidate-number-limit 3
    :sources
    '(anything-c-source-man-pages      ;; man pages
      anything-c-source-info-emacs)))) ;; emacs

(add-hook
 'emacs-lisp-mode-hook
 (lambda()
   ;; other stuff...
   ;; ...
   ;; put useful info under C-c i
   (local-set-key
    (kbd "C-c i")
    (lambda() (interactive)
      (anything
       :prompt "Info about: "
       :candidate-number-limit 5
       :sources
       '(anything-c-source-emacs-functions
         anything-c-source-emacs-variables
         anything-c-source-info-elisp
         anything-c-source-emacs-commands
         anything-c-source-emacs-source-defun
         anything-c-source-emacs-lisp-expectations
         anything-c-source-emacs-lisp-toplevels
         anything-c-source-emacs-functions-with-abbrevs
         anything-c-source-info-emacs))))))

(provide 'init-anything)
;;; init-anything.el ends here
