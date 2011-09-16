;;; auto-complete mode

(require 'auto-complete)
(require 'auto-complete-config)

(add-to-list 'load-path "~/.emacs.d/el-get/auto-complete/dict/")
(add-to-list 'ac-dictionary-directories "~/.emacs.d/el-get/auto-complete/dict/")
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict/")

(ac-config-default)


(setq ac-auto-start 2)
(setq ac-dwim t)
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)

(dolist (mode '(emacs-lisp-mode lisp-interaction-mode
		magit-log-edit-mode log-edit-mode org-mode text-mode
		haml-mode sass-mode yaml-mode csv-mode espresso-mode
		haskell-mode html-mode nxml-mode sh-mode smarty-mode
		clojure-mode lisp-mode textile-mode markdown-mode
		tuareg-mode cperl-mode sass-mode ncl-mode latex-mode))
  (add-to-list 'ac-modes mode))

(defun ac-cc-mode-setup ()
  (setq ac-sources (append '(ac-source-yasnippet ac-source-gtags) ac-sources)))

(add-hook 'auto-complete-mode-hook (lambda ()
				     (ac-flyspell-workaround)))

(define-key ac-completing-map   "\t"    'ac-expand-common)
(define-key ac-completing-map (kbd "RET") 'ac-complete)
;; (define-key ac-completing-map   "\r"    'ac-complete)
;; (define-key ac-completing-map   "\M-/"  'ac-stop)

;; Use Emacs' built-in TAB completion hooks to trigger AC (Emacs >= 23.2)
(setq tab-always-indent
      'complete) ;; use 'complete when auto-complete is disabled
(add-to-list 'completion-styles 'initials t)


;;; http://www.masteringemacs.org/articles/2010/11/29/evaluating-elisp-emacs/
;; define  sources for ielm
(defun ielm-auto-complete ()
  "Enables `auto-complete' support in \\[ielm]."
  (setq ac-sources '(ac-source-functions
                     ac-source-variables
                     ac-source-features
                     ac-source-symbols
                     ac-source-words-in-same-mode-buffers))
  (add-to-list 'ac-modes 'inferior-emacs-lisp-mode)
  (auto-complete-mode 1))
(add-hook 'ielm-mode-hook 'ielm-auto-complete)


(provide 'init-auto-complete)
;;; init-auto-complete.el ends here
