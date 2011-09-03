;;; init-org-refile.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;;    File: init-org-refile.el
;;  Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;; Created: Tuesday, May 17 2011
;; Licence: GPL v3 or later. You should get a copy from <http://www.gnu.org/licenses/gpl.html>

;;; Description:
;;  refile stuff

;;;  Targets include this file and any file contributing to the agenda - up to 5 levels deep
(setq org-refile-targets (quote ((org-agenda-files :maxlevel . 5) (nil :maxlevel . 5))))

;;;  Targets start with the file name - allows creating level 1 tasks
(setq org-refile-use-outline-path (quote file))

;;;  Targets complete in steps so we start with filename, TAB shows the next level of targets etc
(setq org-outline-path-complete-in-steps t)

;;;  Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes (quote confirm))

(provide 'init-org-refile)

;;; init-org-refile.el ends here
