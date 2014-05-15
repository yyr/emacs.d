;;; init-org-html.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;;

;;; emphasis set up latex
(setq org-emphasis-alist (quote (("*" bold "<b>" "</b>")
                                 ("/" italic "<i>" "</i>")
                                 ("_" underline "<span style=\"text-decoration:underline;\">" "</span>")
                                 ("=" org-code "<code>" "</code>" verbatim)
                                 ("~" org-verbatim "<code>" "</code>" verbatim)
                                 ("+" (:strike-through t) "<del>" "</del>")
                                 ("@" org-warning "<b>" "</b>"))))


;;; init-org-html.el ends here
