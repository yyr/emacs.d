;;; init-org-agenda.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;;

;;;  Custom Agenda views

(custom-set-variables
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-skip-timestamp-if-done t)
 '(org-agenda-todo-ignore-scheduled t)
 '(org-agenda-todo-ignore-with-date t)
 '(org-agenda-include-diary t))

;;; dont show deadlines every day
(setq org-deadline-warning-days 2)

(setq org-agenda-custom-commands
      (quote (
	      ;; @ nights & weekend
	      ("w" "Works for weekend" tags "@night|@weekend!"
	       ((org-agenda-overriding-header "weekend works")))

	      ;; @ day tag
	      ("d" "At WORK" tags "@day!"
	       ((org-agenda-overriding-header "at Work")))

	      ;; @ night tags
	      ("n" "Evening" tags "@night!"
	       ((org-agenda-overriding-header "Night time")))

	      ;; entries to refile
	      ("r" "Refile New Notes and Tasks" tags "LEVEL=1+REFILE"
	       ((org-agenda-overriding-header "Tasks to Refile")))

	      ;; Next items
	      ("N" "Next" tags-todo "/!NEXT")

	      ;; entries to archived
	      ("A" "Tasks to be Archived" tags "LEVEL=2-REFILE/DONE|CANCELLED"))))


(provide 'init-org-agenda)
;;; init-org-agenda.el ends here
