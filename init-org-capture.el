;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;; License: GPL v3 or later
;;

;; org capture settings
;; -----------------------------------------------------------------------------

(global-set-key (kbd "C-M-r") 'org-capture)
(global-set-key (kbd "<f6>") 'org-capture)

;; Capture Templates
(setq
 org-capture-templates
 '(
   ;; todo --> refile/Tasks
   ("t" "todo" entry (file+headline "~/git/org/refile.org" "Tasks")
    "* TODO %?\n%U   %a%i" )

   ("C" "todo under current clock" entry (clock)
    "* TODO %?\n%U   %a%i" )

   ;; note --> refile/Notes
   ("n" "note" entry (file+headline "~/git/org/refile.org" "Notes")
    "* %?\n%U   %a%i" )

   ;; journal notes --> diary.org
   ("j" "Journal" item (file+datetree "~/git/org/journal.org")
    "%?\n%U\n%i")

   ;; Lab note book
   ("c" "Lab note book"
   item (file+datetree "~/git/org/lab/notebook.org")
    "%?\n%U\n%i")


   ("o" "Flow todos/ideas" entry (file+headline "~/git/org/refile.org" "overflows")
    "* TODO %?\n%U   %a%i" )

   ("m" "mailnote" entry (file+headline "~/git/org/mails.org" "Mails")
    "** TODO Mail From: %:from Subject: %:subject\n   %a" :kill-buffer t)

   ("C" "TODO under Task in the current buffer "
    entry (file+headline (buffer-file-name (org-capture-get :original-buffer)) "Tasks")
    "* TODO %?
  %U %a %n" :prepend t)))

;; capture Templages
(setq org-default-notes-file "~/git/org/refile.org")

;; C-c C-c stores the note immediately
(setq org-capture-store-without-prompt t)
(setq org-capture-default-headline "Tasks")
