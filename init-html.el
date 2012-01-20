;;; init-html.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;;

(add-hook 'html-mode-hook
          '(lambda ()
             (define-key html-mode-map (kbd "<f5>")
               'browse-url-firefox)))

;;; init-html.el ends here
