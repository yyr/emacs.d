;;; init-pre-gnus.el

;;; t
(setq gnus-init-file (concat emacs-path "/init-gnus.el"))
(setq gnus-home-directory "~/gnus")
(setq gnus-startup-file "~/gnus/.newsrc")
(setq gnus-directory "~/gnus/News")
(setq message-directory "~/gnus/Mail")

(el-get 'sync 'door-gnus)
(require 'door-gnus)
(global-set-key (kbd "<f9> g") 'door-gnus)


;;; init-pre-gnus.el ends here
