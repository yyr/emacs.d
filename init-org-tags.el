;;; Tags stuff

;; Tags with fast selection keys
(setq org-tag-alist '(
                      ;; where
                      (:startgroup)
                      ("@home" . ?h)
                      ("@lab" . ?l)
                      ("@shop" . ?S)
                      ("@out" . ?o)
                      (:endgroup)

                      ;; when
                      (:startgroup)
                      ("@night" . ?n)
                      ("@weekend" . ?W)
                      ("@day"  . ?d)
                      (:endgroup)

                      ;; type
                      ("EMAIL" . ?m)
                      ("READ" . ?r)
                      ("WRITE" . ?w)
                      ("WORK" . ?W)
                      ))

;; Allow setting single tags without the menu
(setq org-fast-tag-selection-single-key (quote expert))

;; For tag searches ignore tasks with scheduled and deadline dates
(setq org-agenda-tags-todo-honor-ignore-options t)

;; Use IDO for target completion
(setq org-completion-use-ido t)

(provide 'init-org-tags)
