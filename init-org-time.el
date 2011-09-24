;;; init-org-time.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;;    File: org-time.el
;;  Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;; Created: Wednesday, April 27 2011
;; License: GPL v3 or later. You should get a copy from <http://www.gnu.org/licenses/gpl.html>

;;; Description:

(add-to-list 'org-modules 'org-timer)
(setq org-timer-default-timer 25)

(add-hook 'org-clock-in-hook '(lambda ()
                                (if (not org-timer-current-timer)
                                    (org-timer-set-timer '(16)))))


;;; init-org-time.el ends here
