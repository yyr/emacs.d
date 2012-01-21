;;; minimal.el
;;
;;; Description:
;; minimal setup; to report any bugs come across

;;; call emacs like this
;; emacs -Q -l ~/.emacs.d/minimal.el

(setq user-full-name "Yagnesh Raghava Yakkala")

;;; some convinience
(ido-mode)
(defalias 'yes-or-no-p 'y-or-n-p)

;;; minimal.el ends here
