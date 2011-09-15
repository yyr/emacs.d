;;; Tags stuff

;; Tags with fast selection keys
(setq org-tag-alist '((:startgroup)
                      ("@home" . ?h)
                      ("@lab" . ?l)
                      ("@xhome" . ?x)
                      ("@shop" . ?S)
                      (:endgroup)

                      (:startgroup)
                      ("@night" . ?n)
                      ("@weekend" . ?W)
                      ("@day"  . ?d)
                      (:endgroup)
                      ("EMAIL" . ?m)
                      ("WORK" . ?w)
                      ("READ" . ?r)))

;; Allow setting single tags without the menu
(setq org-fast-tag-selection-single-key (quote expert))

;; For tag searches ignore tasks with scheduled and deadline dates
(setq org-agenda-tags-todo-honor-ignore-options t)

;; Use IDO for target completion
(setq org-completion-use-ido t)

(provide 'init-org-tags)
