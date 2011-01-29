;;; General

;;; ### Coding ###
;; I dont what this means. but looks imp
(setq default-buffer-file-coding-system 'utf-8-unix)            
(setq default-file-name-coding-system 'utf-8-unix)              
(setq default-keyboard-coding-system 'utf-8-unix)               
(setq default-process-coding-system '(utf-8-unix . utf-8-unix)) 
(setq default-sendmail-coding-system 'utf-8-unix)               
(setq default-terminal-coding-system 'utf-8-unix)               

;;; ### Advice ###
;;; yank with indent
(defadvice yank (after indent-region activate)
  "To make yank content indent automatically."
  (if (member major-mode '(emacs-lisp-mode
                           scheme-mode
                           lisp-mode
                           lisp-interaction-mode
                           c-mode
                           c++-mode
                           objc-mode
                           latex-mode
                           plain-tex-mode))
      (indent-region (region-beginning) (region-end) nil)))

;; stop welcome screen
(custom-set-variables
 '(inhibit-startup-screen t))

;; Always end a file with a newline
(setq require-final-newline t)

;; Stop at the end of the file, not just add lines
;(setq next-line-add-newlines nil)

;;save everything to a folder 
(setq
 backup-by-copying t ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.emacs.d/auto-save-list")) ; don't litter my fs tree
 delete-old-versions t
 kept-new-versionhs 6
 kept-old-versions 2
 version-control t) ; use versioned backups

(setq disabled-command-function nil)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(defalias 'yes-or-no-p 'y-or-n-p)

(provide 'init-general)
