;;; init-cc.el
;;    File: init-cc.el
;; Created: 月曜日, 7月 15 2013

;;; gdb
(setq gdb-many-windows t)
(setq gdb-use-separate-io-buffer t)

(defun my-c-mode-custom-vars ()
  (setq c-default-style "k&r"
        c-basic-offset 4)
  ;; (setq-default tab-width 4
  ;;               indent-tabs-mode t)

  ;; headers
  (setq cc-search-directories
        '("." "/usr/include" "/usr/local/include/*" "../include" "../*/include"))
  (setq-default compilation-ask-about-save nil
                compilation-auto-jump-to-first-error t))

(defun my-c-mode-keys ()
  (local-set-key (kbd "C-c -") 'hs-hide-block)
  (local-set-key (kbd "C-c =") 'hs-show-block)
  (local-set-key (kbd "C-x C-o") 'ff-find-other-file)
  (local-set-key (kbd "C-c g") 'gdb)
  (local-set-key (kbd "C-c C-c") 'recompile))

(defun my-c-mode-common-hook ()
  (my-c-mode-custom-vars)
  (my-c-mode-keys))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;;; init-cc.el ends here
