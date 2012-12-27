;;; init-org-agenda.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
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
(setq org-agenda-todo-ignore-with-date t)
(setq org-agenda-include-diary t)
(setq org-agenda-start-on-weekday nil)

;;;  Custom Agenda views
;; dont show deadlines every day
(setq org-deadline-warning-days 2)

(setq org-agenda-custom-commands
      (quote (
              ;;
              ("l" "Agenda and all TODO's"
               ((alltodo)))

              ;; backlogs
              ("b" "Backlogs" tags-todo "/!BACKLOG"
               ((org-tags-match-list-sublevels 'indented)))

              ;; in queue
              ("t" "Queued Up" tags-todo "/!TODO"
               ((org-tags-match-list-sublevels 'indented)))

              ;; Next items
              ("n" "Next" tags-todo "/!NEXT"
               ((org-tags-match-list-sublevels 'indented)))

              ;; entries to archived
              ("A" "Tasks to be Archived" todo "DONE|CANCELLED|EXPIRED")

              ;; entries to refile
              ("r" "Refile New Notes and Tasks" tags "LEVEL=2+REFILE"
               ((org-agenda-overriding-header "Tasks to Refile")
                (org-tags-match-list-sublevels 'indented)))

              ;; tags WORK
              ("w" "WORK related" tags "LEVEL>1+WORK"
               ((org-agenda-overriding-header "Work")
                (org-tags-match-list-sublevels 'indented)))

              ;; @ nights & weekend
              ("W" "Works for weekend" tags "LEVEL>1+@night|@weekend!"
               ((org-agenda-overriding-header "weekend works")
                (org-tags-match-list-sublevels 'indented)))

              ;; @ day tag
              ("d" "At WORK" tags "@day!"
               ((org-agenda-overriding-header "at Work")
                (org-tags-match-list-sublevels 'indented)))

              ;; @ night tags
              ("N" "Evening" tags "LEVEL>1+@night!"
               ((org-agenda-overriding-header "Night time")
                (org-tags-match-list-sublevels 'indented)))

              ("o" "runs"
               ((tags "LEVEL>1+CATEGORY=\"runs\"")))

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

(defun org-agenda-quit-and-bury ()
  "while quitting agenda, bury all the agenda file buffers to make agenda-file
   to be last choice when switching buffer."
  (interactive)
  (progn
    (save-excursion
      (mapcar (lambda (f)
                (bury-buffer (find-file-noselect (file-truename f))))
              org-agenda-files))
    (org-agenda-quit)))

(global-set-key (kbd "C-<f12>") (lambda ()
                                  (interactive)
                                  (org-agenda nil "t" t)))


(eval-after-load "org-agenda"
  `(let ((map org-agenda-mode-map))
     (define-key map "Q" 'org-agenda-quit-and-bury)))

(setq org-agenda-tags-column -105)
(setq org-agenda-window-setup 'current-window)

;;; init-org-agenda.el ends here
