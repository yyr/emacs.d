;;; init-flyspell.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;; License: GPL v3 or later

;;; dont use M-TAB for flyspell , I reserve it for other LaTex mode
(setq flyspell-use-meta-tab nil)

;;; turn on flyspell mode
(dolist (hook '(org-mode-hook
                text-mode-hook
                erc-mode-hook
                message-mode-hook))
  (add-hook hook (lambda ()
                   (flyspell-mode 1))))

;;; for prog modes turn on flyspell-prog-mode (checks spell only in comments)
(dolist (hook '(lisp-mode-hook
                emacs-lisp-mode-hook
                ruby-mode-hook
                yaml-mode
                python-mode-hook
                shell-mode-hook
                php-mode-hook
                css-mode-hook
                nxml-mode-hook
                crontab-mode-hook
                perl-mode-hook
                javascript-mode-hook
                LaTeX-mode-hook))
  (add-hook hook 'flyspell-prog-mode))

(add-hook 'nxml-mode-hook
          (lambda ()
            (add-to-list 'flyspell-prog-text-faces 'nxml-text-face)))

(provide 'init-flyspell)
;;; init-flyspell.el ends here
