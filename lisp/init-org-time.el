;;; init-org-time.el
;; Author: Yagnesh Raghava Yakkala. http://yagnesh.org
;; Created: Wednesday, April 27 2011

;;; Description:

(add-to-list 'org-modules 'org-timer)
(setq org-timer-default-timer 25)

(add-hook 'org-clock-in-hook '(lambda ()
                                (if (not org-timer-current-timer)
                                    (org-timer-set-timer '(16)))))

;;; init-org-time.el ends here
