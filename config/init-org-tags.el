;;; Tags stuff

;; Tags with fast selection keys
(setq org-tag-alist (quote ((:startgroup)
                            ("@home" . ?h)
                            ("@lab" . ?l)
                            ("@xhome" . ?x)
                            ("@shop" . ?S)
			    (:endgroup)
			    (:startgroup)
			    ("@evening" . ?e)
			    ("@weekend" . ?W)
			    ("@day"  . ?d)
			    (:endgroup)
                            ("PHONE" . ?P)
			    ("EMAIL" . ?m)
			    ("WORK" . ?w)
			    ("GIT" . ?g)
                            ("READ" . ?r)
			    ("EMACS" . ?E)
                            ("HOME" . ?H)
			    ("KIRTI" . ?k)
			    ("CANCELLED" . ?C))))


; Allow setting single tags without the menu
(setq org-fast-tag-selection-single-key (quote expert))

; For tag searches ignore tasks with scheduled and deadline dates
(setq org-agenda-tags-todo-honor-ignore-options t)

;; Use IDO for target completion
(setq org-completion-use-ido t)

(provide 'init-org-tags)
