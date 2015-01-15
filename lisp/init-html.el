;;; init-html.el
;; Author: Yagnesh Raghava Yakkala. http://yagnesh.org

(add-hook 'html-mode-hook
          '(lambda ()
             (define-key html-mode-map (kbd "<f5>")
               'browse-url-firefox)))

;;; init-html.el ends here
