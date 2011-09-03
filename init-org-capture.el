;; -----------------------------------------------------------------------------
;; org capture settings
;; -----------------------------------------------------------------------------
;; Load Org capture Stuff
;; ------------------------
(global-set-key (kbd "C-M-r") 'org-capture)
(global-set-key (kbd "<f6>") 'org-capture)

;; 3 capture templates for TODO tasks, Notes, and org-protocol (untested)
(setq
 org-capture-templates
 (quote
  (
   ;; todo --> refile/Tasks
   ("t" "todo" entry (file+headline "~/git/org/refile.org" "Tasks") "* TODO %?
  %U   %a
  :CLOCK:
  :END:" :clock-in t :clock-resume t)
   ;; note --> refile/Notes
   ("n" "note" entry (file+headline "~/git/org/refile.org" "Notes") "* %?                                                                            :NOTE:
  %U  a%
  :CLOCK:
  :END:" :clock-in t :clock-resume t)
   ;; log --> refile/LOG
   ("l" "log" entry (file+headline "~/git/org/refile.org" "LOG") "* %?                                                                        :LOG:
    %T")
   ;; log --> refile/LOG
   ("V" "WRF log" entry (file+headline "~/git/org/wrf-log.org" "LOG") "* %?
    %T" :prepand t)
   ;; log --> regcm-log/LOG
   ("R" "RegCM log" entry (file+headline "~/git/org/regcm-log.org" "LOG") "* %?
    %T")
   ;; log --> wrfstff-log/LOG
   ("W" "Webstuff log" entry (file+headline "~/git/org/webstuff-log.org" "LOG") "* %? 
    %T" :prepand t)
   ;; log --> refile/

   )))

;; capture Templages
(setq org-default-notes-file "~/git/org/refile.org")

;; C-c C-c stores the note immediately
(setq org-capture-store-without-prompt t)

;; I don't use this -- but set it in case I forget to specify a location in a future template
(setq org-capture-default-headline "Tasks")

(provide 'init-org-capture)
