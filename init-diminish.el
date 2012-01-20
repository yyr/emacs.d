;;; init-diminish.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;;

(autoload 'diminish "diminish" nil t)

(eval-after-load "eldoc"
  '(diminish 'eldoc-mode "ed"))

(eval-after-load "paredit"
  '(diminish 'paredit-mode "pe"))

;;; init-diminish.el ends here
