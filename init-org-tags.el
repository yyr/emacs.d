;;; Tags stuff

;; Tags with fast selection keys
(setq org-tag-alist '(
                      ;; where
                      (:startgroup)
                      ("@home" . ?h)
                      ("@lab" . ?l)
                      ("@shop" . ?s)
                      ("@out" . ?o)
                      (:endgroup)

                      ;; when
                      (:startgroup)
                      ("@night" . ?n)
                      ("@wend" . ?w)    ; weekend
                      ("@day"  . ?d)
                      (:endgroup)

                      ;; type
                      ("MAIL" . ?E)
                      ("READ" . ?r)
                      ("WRITE" . ?R)
                      ("WORK" . ?W)
                      ("PHONE" . ?P)
                      ("HOME" . ?H)
                      ))

;; Allow setting single tags without the menu
(setq org-fast-tag-selection-single-key (quote expert))

;; For tag searches ignore tasks with scheduled and deadline dates
(setq org-agenda-tags-todo-honor-ignore-options t)

;; Use IDO for target completion
(setq org-completion-use-ido t)
