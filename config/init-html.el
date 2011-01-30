;;; init-html.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;;

(add-hook 'html-mode-hook
	  '(lambda ()
	     (define-key html-mode-map (kbd "f5")
	       'browse-url-firefox)))

(provide 'init-html)
;;; init-html.el ends here
