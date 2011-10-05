;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@NOSPAM.live.com>
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
  ("t" "todo" entry (file+headline "~/git/org/refile.org" "Tasks") "* TODO %?
  %U   %a" )
  ;; note --> refile/Notes
  ("n" "note" entry (file+headline "~/git/org/refile.org" "Notes") "* %?
  %U   %a" )
))

;; capture Templages
(setq org-default-notes-file "~/git/org/refile.org")

;; C-c C-c stores the note immediately
(setq org-capture-store-without-prompt t)
(setq org-capture-default-headline "Tasks")

(provide 'init-org-capture)
