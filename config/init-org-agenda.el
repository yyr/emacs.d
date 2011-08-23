;;; init-org-agenda.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;; Licence: GPL v3 or later

;;;  Org Agenda files and org-dir
(setq org-directory "~/git/org/")

;;; load agenda files
(setq agenda-file "~/git/org/agenda-files.el")
(if (file-regular-p agenda-file)
    (load-file agenda-file))

;;;  Custom Key Bindings
(global-set-key (kbd "<f12>") 'org-agenda)

;;; agenda props
(custom-set-variables
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-skip-timestamp-if-done t)
 '(org-agenda-todo-ignore-scheduled t)
 '(org-agenda-todo-ignore-with-date t)
 '(org-agenda-include-diary t))

;;;  Custom Agenda views
;; dont show deadlines every day
(setq org-deadline-warning-days 2)
(setq org-agenda-ndays 10)

(setq org-agenda-custom-commands
      (quote (
              ;; @ nights & weekend
              ("w" "Works for weekend" tags "@night|@weekend!"
               ((org-agenda-overriding-header "weekend works")
		(org-tags-match-list-sublevels 'indented)))

              ;; @ day tag
              ("d" "At WORK" tags "@day!"
               ((org-agenda-overriding-header "at Work")
		(org-tags-match-list-sublevels 'indented)))

              ;; @ night tags
              ("n" "Evening" tags "@night!"
               ((org-agenda-overriding-header "Night time")
		(org-tags-match-list-sublevels 'indented)))

              ;; entries to refile
              ("r" "Refile New Notes and Tasks" tags "LEVEL>1+REFILE"
               ((org-agenda-overriding-header "Tasks to Refile")
		(org-tags-match-list-sublevels 'indented)))
	      

              ;; Next items
              ("N" "Next" tags-todo "/!NEXT"
	       ((org-tags-match-list-sublevels 'indented)))

              ;; entries to archived
              ("A" "Tasks to be Archived" tags "LEVEL>1-REFILE/DONE|CANCELLED"))))



(provide 'init-org-agenda)
;;; init-org-agenda.el ends here
