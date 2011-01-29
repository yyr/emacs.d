;; -----------------------------------------------------------------------------
;; Essential minors, Change Default behavior 
;; -----------------------------------------------------------------------------

;; enable narrowing w/out a prompt toggle -> c-x n n ; c-x n w
(put 'narrow-to-region 'disabled nil)

;; put off menu bar scroll bar
(scroll-bar-mode -1)
(menu-bar-mode -1)

;; minor modes
(tool-bar-mode -1)
(global-font-lock-mode 1)
(show-paren-mode 1)
(column-number-mode 1)
;(blink-cursor-mode -1)
(set-face-attribute 'default nil :height 95)
(setq visible-bell t)
(show-paren-mode 1)
(setq show-paren-style 'parenthesis)
(setq show-paren-delay 0)

(provide 'init-ess-minors)
