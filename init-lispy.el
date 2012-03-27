;;; init-lispy.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: init-lispy.el
;; Created: Monday, December 26 2011
;; License: GPL v3 or later. <http://www.gnu.org/licenses/gpl.html>

;;; Description:
;; common things to load to all lispies

;;; load some minor modes first
(el-get 'sync '(paredit
                hl-sexp
                highlight-parentheses))


;; pretty lambda (see also slime) ->  "λ"
;;  'greek small letter lambda' / utf8 cebb / unicode 03bb -> \u03BB / mule?!
;; in greek-iso8859-7 -> 107  >  86 ec
(defun pretty-lambdas ()
  (font-lock-add-keywords
   nil `(("(\\(lambda\\>\\)"
          (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                    ,(make-char 'greek-iso8859-7 107))
                    'font-lock-keyword-face))))))

(autoload 'enable-paredit-mode "paredit" "Turn on paredit mode" t)

(defadvice enable-paredit-mode (before disable-autopair activate)
  (setq autopair-dont-activate t)
  (autopair-mode -1))

(defun maybe-map-paredit-newline ()
  (unless (or (eq major-mode 'inferior-emacs-lisp-mode) (minibufferp))
    (local-set-key (kbd "RET") 'paredit-newline)))

(add-hook 'paredit-mode-hook 'maybe-map-paredit-newline)

(defun warn-disabled-command ()
  (interactive)
  (message "Command disabled")
  (ding))

(eval-after-load "paredit"
  '(progn
     ;; These are handy everywhere, not just in lisp modes
     (define-key lisp-mode-map (kbd "M-(") 'paredit-wrap-round)
     (define-key lisp-mode-map (kbd "M-[") 'paredit-wrap-square)
     (define-key lisp-mode-map (kbd "M-{") 'paredit-wrap-curly)

     (define-key lisp-mode-map (kbd "M-)") 'paredit-close-round-and-newline)
     (define-key lisp-mode-map (kbd "M-]") 'paredit-close-square-and-newline)
     (define-key lisp-mode-map (kbd "M-}") 'paredit-close-curly-and-newline)

     (define-key lisp-mode-map (kbd "C-<right>") 'paredit-forward-slurp-sexp)
     (define-key lisp-mode-map (kbd "C-<left>") 'paredit-forward-barf-sexp)
     (define-key lisp-mode-map (kbd "C-M-<left>") 'paredit-backward-slurp-sexp)
     (define-key lisp-mode-map (kbd "C-M-<right>") 'paredit-backward-barf-sexp)))


;; When editing lisp code, highlight the current sexp
(dolist (hook '(emacs-lisp-mode-hook scheme-mode-hook))
  (add-hook hook (lambda ()
                   (progn
                     (require 'hl-sexp)
                     (hl-sexp-mode 1)
                     (highlight-parentheses-mode 1)))))

;;; init-lispy.el ends here
