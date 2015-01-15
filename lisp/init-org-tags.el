;;; Org TAGS stuff

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
                      ("mail" . ?E)
                      ("read" . ?r)
                      ("write" . ?R)
                      ("work" . ?W)
                      ("phone" . ?P)
                      ("home" . ?H)))

;; Allow setting single tags without the menu
(setq org-fast-tag-selection-single-key (quote expert))

;; For tag searches ignore tasks with scheduled and deadline dates
(setq org-agenda-tags-todo-honor-ignore-options t)
