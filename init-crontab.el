;;; init-crontab.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: init-cron.el
;; Created: Sunday, October 23 2011
;; License: GPL v3 or later. <http://www.gnu.org/licenses/gpl.html>

;;; Description:
;;

;;; load
(el-get 'sync '(crontab-mode))

(autoload 'crontab-mode "crontab-mode"
  "cron-tab mode to edit cron files" t)

;;; init-crontab.el ends here
