;;; auto-complete mode

(require 'auto-complete)
(require 'auto-complete-config)

(add-to-list 'load-path "~/.emacs.d/el-get/auto-complete/dict/")
(add-to-list 'ac-dictionary-directories "~/.emacs.d/el-get/auto-complete/dict/")
(ac-config-default)

(setq ac-auto-start 2)
(setq ac-dwim t)
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)
;(ac-start)

(dolist (mode '(emacs-lisp-mode lisp-interaction-mode
		magit-log-edit-mode log-edit-mode org-mode text-mode
		haml-mode sass-mode yaml-mode csv-mode espresso-mode
		haskell-mode html-mode nxml-mode sh-mode smarty-mode
		clojure-mode lisp-mode textile-mode markdown-mode
		tuareg-mode cperl-mode sass-mode))
  (add-to-list 'ac-modes mode))

(defmacro ac-define-dictionary-source (name list)
  "Define dictionary source named `NAME'.
`LIST' is a list of string.
This is useful if you just want to define a dictionary/keywords source."
  `(defvar ,name
     '((candidates . (lambda () (all-completions ac-prefix ,list))))))

;; ;; dirty fix for having AC everywhere emacswiki
;; (define-globalized-minor-mode real-global-auto-complete-mode
;;   auto-complete-mode (lambda ()
;;                        (if (not (minibufferp (current-buffer)))
;;                          (auto-complete-mode 1))
;;                        ))
;; (real-global-auto-complete-mode t)

;; Exclude very large buffers from dabbrev
(defun smp-dabbrev-friend-buffer (other-buffer)
  (< (buffer-size other-buffer) (* 1 1024 1024)))

(setq dabbrev-friend-buffer-function 'smp-dabbrev-friend-buffer)

(define-key ac-completing-map   "\t"    'ac-expand-common)
(define-key ac-completing-map   "\r"    'ac-complete)
(define-key ac-completing-map   "\M-/"  'ac-stop)


(provide 'init-auto-complete)
