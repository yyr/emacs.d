;;; init-org-agenda.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;; License: GPL v3 or later

;;;  Org Agenda files and org-dir
(setq org-directory "~/git/org/")

;;; load agenda files
(setq agenda-file "~/git/org/agenda-files.el")
(if (file-regular-p agenda-file)
    (load-file agenda-file))

;;;  Custom Key Bindings
(global-set-key (kbd "<f12>") 'org-agenda)

;;; agenda props
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-skip-timestamp-if-done t)
(setq org-agenda-todo-ignore-scheduled t)
(setq org-agenda-todo-ignore-with-date t)
(setq org-agenda-include-diary t)

;;;  Custom Agenda views
;; dont show deadlines every day
(setq org-deadline-warning-days 2)
(setq org-agenda-ndays 7)

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
              ("r" "Refile New Notes and Tasks" tags "LEVEL=2+REFILE"
               ((org-agenda-overriding-header "Tasks to Refile")
                (org-tags-match-list-sublevels 'indented)))


              ;; Next items
              ("N" "Next" tags-todo "/!NEXT"
               ((org-tags-match-list-sublevels 'indented)))

              ;; entries to archived
              ("A" "Tasks to be Archived" tags "LEVEL>1-REFILE/DONE|CANCELLED")

              ;; Block Agenda
              (" " "Block Agenda"
               ((agenda " " nil)
                (tags-todo "/!NEXT"
                           ((org-tags-match-list-sublevels 'indented))
                           (org-agenda-overriding-header "Next Tasks"))
                (tags "LEVEL=2+REFILE"
                      ((org-agenda-overriding-header "Entries to be Refiled")))

                ;; (todo "TODO"
                ;;       ((org-tags-match-list-sublevels 'indented)
                ;;        (org-agenda-overriding-header "All Global TODOS")))

                (tags "LEVEL>1-REFILE/DONE|CANCELLED"
                      ((org-agenda-overriding-header "Entires can be Archived"))))))))



(provide 'init-org-agenda)
;;; init-org-agenda.el ends here