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

   ("c" "todo under current clock" entry (clock)
    "* TODO %?\n%U   %a%i" )

   ;; note --> refile/Notes
   ("n" "note" entry (file+headline "~/git/org/refile.org" "Notes")
    "* %?\n%U   %a%i" )

   ;; journal notes --> diary.org
   ("j" "Journal" item (file+datetree "~/git/org/diary.org")
    "%?\n%U\n%i")

   ("o" "Flow todos/ideas" entry (file+headline "~/git/org/refile.org" "overflows")
    "* TODO %?\n%U   %a%i" )
))

;; capture Templages
(setq org-default-notes-file "~/git/org/refile.org")

;; C-c C-c stores the note immediately
(setq org-capture-store-without-prompt t)
(setq org-capture-default-headline "Tasks")
