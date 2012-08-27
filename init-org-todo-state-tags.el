;;; init-org-todo-state-tags.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; License: GPL v3 or later

;;;  TODO key words
(setq org-todo-keywords
      '((sequence "BACKLOG(b!)" "TODO(t!)" "NEXT(n!)" "|" "DONE(d!)" "EXPIRED(e@/!)")
        (sequence "WAITING(w@/!)" "|" "CANCELLED(c@/!)" "EXPIRED(e@/!)")
        (sequence "RECURRENT(r)" "|" "DONE(d)")))

(setq org-todo-keyword-faces
      '(("BACKLOG" :foreground "goldenrod" :weight bold)
        ("NEXT" :foreground "yellow" :weight bold)
        ("TODO" :foreground "red" :weight bold)
        ("WAITING" :foreground "blue" :weight bold)
        ("CANCELLED" :foreground "magenta" :weight bold)
        ("DONE" :foreground "forest green" :weight bold)
        ("EXPIRED" :foreground "magenta" :weight bold)))

;;; change state
(setq org-use-fast-todo-selection t)
(setq org-treat-S-cursor-todo-selection-as-state-change nil)

;;; TODO state triggers
(setq org-todo-state-tags-triggers
      '(("CANCELLED" ("CANCELLED" . t))
        ("WAITING" ("WAITING" . t))
        ("SOMEDAY" ("WAITING" . t))
        ("DONE" ("WAITING"))
        ("TODO" ("WAITING") ("CANCELLED"))
        ("NEXT" ("WAITING"))
        ("DONE" ("WAITING") ("CANCELLED"))))

;;; init-org-todo-state-tags.el ends here
