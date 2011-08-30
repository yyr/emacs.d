;;; init-color-theme.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;; License: GPL v3 or later

;; (set-background-color "black")
;; (set-face-background 'default "black")
;; (set-face-background 'region "black")
;; (set-face-foreground 'default "white")
;; (set-face-foreground 'region "gray60")
;; (set-foreground-color "white")
;; (set-cursor-color "red")

(defun set-colour-theme (theme)
  "Helper function to set a bunch of faces and ignore potential errors from missing faces."
  (mapc (lambda (setting)
          (condition-case nil
              (face-spec-set (car setting) (cdr setting))
            (error t)))
        theme))

(defun light-on-dark-theme ()
  "Setup the colors for a light-on-dark theme."
  (interactive)
  (set-colour-theme
   '((default . ((((type tty)) (:background "black" :foreground "white")) (t (:background "black" :foreground "grey"))))
     (cursor . ((t (:background "plum"))))
     (modeline . ((((type tty)) (:inverse-video t)) (t (:foreground "black" :background "grey75" :box (:style released-button)))))
     (font-lock-keyword-face . ((t (:foreground "white" :bold t))))
     (font-lock-comment-face . ((((type tty)) (:foreground "cyan")) (t (:foreground "steelblue" :italic t))))
     (font-lock-string-face . ((((type tty)) (:foreground "green")) (t (:foreground "lightgreen"))))
     (font-lock-doc-string-face . ((((type tty)) (:foreground "green")) (t (:foreground "lightgreen"))))
     (font-lock-doc-face . ((((type tty)) (:foreground "green")) (t (:foreground "lightgreen"))))
     (font-lock-function-name-face . ((((type tty)) (:foreground "red" :bold t)) (t (:foreground "coral" :bold t))))
     (font-lock-type-face . ((((type tty)) (:foreground "cyan" :bold t)) (t (:foreground "steelblue" :bold t))))
     (font-lock-variable-name-face . ((((type tty)) (:foreground "magenta")) (t (:foreground "orchid"))))
     (font-lock-warning-face . ((t (:foreground "red" :bold t))))
     (font-lock-reference-face . ((((type tty)) (:foreground "red")) (t (:foreground "coral"))))
     (font-lock-builtin-face . ((((type tty)) (:foreground "red")) (t (:foreground "coral"))))
     (font-lock-constant-face . ((((type tty)) (:foreground "red")) (t (:foreground "coral"))))
     (paren-match . ((((type tty)) (:background "blue")) (t (:background "midnightblue"))))
     (show-paren-match-face . ((((type tty)) (:background "blue")) (t (:background "midnightblue"))))
     (zmacs-region . ((((type tty)) (:background "magenta")) (t (:foreground "black" :background "lightcoral"))))
     (region . ((((type tty)) (:background "magenta")) (t (:foreground "black" :background "lightcoral"))))
     (isearch . ((t (:foreground "white" :background "red"))))
     (isearch-secondary . ((((type tty)) (:foreground "red" :background "white")) (t (:foreground "red3" :background "grey"))))
     (isearch-lazy-highlight-face . ((((type tty)) (:foreground "red" :background "white")) (t (:foreground "red3" :background "grey"))))
     (trailing-spaces-face . ((((type tty)) (:background "grey")) (t (:background "grey15")))))))

(defun dark-on-light-theme ()
  "Setup the colors for a dark-on-light theme."
  (interactive)
  (set-colour-theme
   '((default . ((((type tty)) (:background "unspecified-bg" :foreground "unspecified-fg")) (t (:background "white" :foreground "black"))))
     (cursor . ((t (:background "red"))))
     (modeline . ((((type tty)) (:inverse-video t)) (t (:foreground "black" :background "grey75" :box (:style released-button)))))
     (font-lock-keyword-face . ((t (:foreground "black" :bold t))))
     (font-lock-comment-face . ((t (:foreground "blue" :italic t :underline nil))))
     (font-lock-string-face . ((((type tty)) (:foreground "green")) (t (:foreground "green4"))))
     (font-lock-doc-string-face . ((((type tty)) (:foreground "green")) (t (:foreground "green4"))))
     (font-lock-doc-face . ((((type tty)) (:foreground "green")) (t (:foreground "green4"))))
     (font-lock-function-name-face . ((t (:foreground "red" :bold t))))
     (font-lock-type-face . ((((type tty)) (:foreground "blue" :bold t)) (t (:foreground "steelblue" :bold t))))
     (font-lock-variable-name-face . ((t (:foreground "magenta"))))
     (font-lock-warning-face . ((t (:foreground "red" :bold t))))
     (font-lock-reference-face . ((((type tty)) (:foreground "red")) (t (:foreground "red3"))))
     (font-lock-builtin-face . ((((type tty)) (:foreground "red")) (t (:foreground "red3"))))
     (font-lock-constant-face . ((((type tty)) (:foreground "red")) (t (:foreground "red3"))))
     (paren-match . ((((type tty)) (:background "cyan")) (t (:background "lightsteelblue"))))
     (show-paren-match-face . ((((type tty)) (:background "cyan")) (t (:background "lightsteelblue"))))
     (zmacs-region . ((((type tty)) (:background "magenta")) (t (:background "lightcoral"))))
     (region . ((((type tty)) (:background "magenta")) (t (:background "lightcoral"))))
     (isearch . ((t (:foreground "white" :background "red"))))
     (isearch-secondary . ((((type tty)) (:foreground "red" :background "white")) (t (:foreground "red3" :background "grey"))))
     (isearch-lazy-highlight-face . ((((type tty)) (:foreground "red" :background "white")) (t (:foreground "red3" :background "grey"))))
     (trailing-spaces-face . ((((type tty)) (:background "magenta")) (t (:background "mistyrose")))))))

;; (dark-on-light-theme)

;; init color-theme.el
(require 'color-theme-autoloads)
(color-theme-initialize)

(if (equal *system* "laptop")
    (setq *my-theme* "zenburn")
  (setq *my-theme* "unknown"))

;; (if (equal *my-theme* "zenburn")
;;     (progn
;;       (require 'zenburn)
;;       (color-theme-zenburn)))


(provide 'init-color-theme)
;;; init-color-theme.el ends here
