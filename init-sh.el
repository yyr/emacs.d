(autoload 'flymake-shell-load "flymake-shell" "On-the-fly syntax checking of shell scripts" t)
;(add-hook 'sh-mode-hook 'flymake-shell-load)
(setq shell-file-name "bash") ;;use bash for shell

(provide 'init-sh)
