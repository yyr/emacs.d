;;; init-diminish.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;;

(autoload 'diminish "diminish" nil t)

(eval-after-load "eldoc"
  '(diminish 'eldoc-mode "ed"))

(eval-after-load "paredit"
  '(diminish 'paredit-mode "pe"))

(provide 'init-diminish)
;;; init-diminish.el ends here
