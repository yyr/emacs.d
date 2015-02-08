;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org

;; org capture settings
;; -----------------------------------------------------------------------------

(global-set-key (kbd "C-M-r") 'org-capture)
(global-set-key (kbd "<f6>") 'org-capture)

;; Capture Templates
(setq
 org-capture-templates
 '(
   ;; todo --> refile/Tasks
   ("t" "todo entry in refile " entry (file+headline "~/git/org/agenda/refile.org" "Tasks")
    "* TODO %?\n%U   %a%i" )

   ("b" "backlog entry." entry (file+headline "~/git/org/agenda/refile.org" "Tasks")
    "* BACKLOG %?\n%U   %a%i" )

   ("T" "TODO under Task in the current buffer "
    entry (file+headline (buffer-file-name (org-capture-get :original-buffer)) "Tasks")
    "* TODO %?
  %U %a %n" :prepend t)

   ("c" "todo under current clock" entry (clock)
    "* TODO %?\n%U   %a%i" )

   ("n" "Note under current clock" entry (clock)
    "* %?   :note:\n%U   %a%i%" )

   ;; note --> refile/Notes
   ("N" "note" entry (file+headline "~/git/org/agenda/refile.org" "Notes")
    "* %?\n%U   %a%i" )

   ("o" "Flow todos/ideas" entry (file+headline "~/git/org/ideas/ideas.org" "overflows")
    "* %?\n%U   %a%i" )

   ("m" "mailnote" entry (file+headline "~/git/org/agenda/mails.org" "Mails")
    "** TODO Mail From: %:from Subject: %:subject\n   %a" :kill-buffer t)

   ;; journal notes --> diary.org
   ("j" "Journal" item (file+datetree "~/git/org/agenda/journal.org")
    "%?\n%U\n%i")

   ;; Lab note book
   ("l" "Lab note book"
    item (file+datetree "~/git/org/lab/notebook.org")
    "%?\n%U\n%i")))


;; capture Templages
(setq org-default-notes-file "~/git/org/agenda/refile.org")

;; C-c C-c stores the note immediately
(setq org-capture-store-without-prompt t)
(setq org-capture-default-headline "Tasks")


;;; refiling

;;;  Targets include this file and any file contributing to the agenda - up to
;;;  5 levels deep
(setq org-refile-targets
      '((org-agenda-files :maxlevel . 4)
        (nil :maxlevel . 4)))

;;;  Targets start with the file name - allows creating level 1 tasks
(setq org-refile-use-outline-path
      (quote file))

;;;  Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes
      (quote confirm))

;;; goto/navigate with org-refile (C-u c-c c-w)
(setq org-goto-max-level 3)
(setq org-goto-interface 'outline-path-completion)
(setq org-outline-path-complete-in-steps nil)

(global-set-key (kbd "C-c C-w") 'org-refile)  ; make it global


;;; init-org-refile.el ends here
