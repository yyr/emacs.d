;;; init-archive.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: init-archive.el
;; Created: Saturday, September 10 2011
;; License: GPL v3 or later.
;;  You should get a copy from <http://www.gnu.org/licenses/gpl.html>


;;; Description:
;; functions that are not using anymore

;;----------------------------------------------------------------------------
;; Easy way to check that we're operating on a specific file type
;;----------------------------------------------------------------------------
(defun filename-has-extension-p (extensions)
  (and buffer-file-name
       (string-match (concat "\\." (regexp-opt extensions t) "\\($\\|\\.\\)") buffer-file-name)))

;;----------------------------------------------------------------------------
;; Locate executables
;;----------------------------------------------------------------------------
(defun find-executable (name)
  "Return the full path of an executable file name `name'
in `exec-path', or nil if no such command exists"
  (locate-file name exec-path nil 'file-executable-p))

;;----------------------------------------------------------------------------
;; Handier way to add modes to auto-mode-alist
;;----------------------------------------------------------------------------
(defun add-auto-mode (mode &rest patterns)
  (dolist (pattern patterns)
    (add-to-list 'auto-mode-alist (cons pattern mode))))


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

;; (dark-on-light-theme)  ;this should go in custom.el

;;; init-archive.el ends here
