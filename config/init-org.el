;; -----------------------------------------------------------------------------
;; ORG MODE stuff day planner GTD
;; -----------------------------------------------------------------------------

(setq load-path (cons (expand-file-name "~/.emacs.d/el-get/org-mode/lisp") load-path))
(require 'org)

(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))

;; Standard key bindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-special-ctrl-a/e t)
(setq org-completion-use-ido t)
(setq font-lock-verbose nil)

;; Make TAB the yas trigger key in the org-mode-hook and turn on flyspell mode
(add-hook 'org-mode-hook
          (lambda ()
            ;; yasnippet
            (make-variable-buffer-local 'yas/trigger-key)
            (setq yas/trigger-key [tab])
            (define-key yas/keymap [tab] 'yas/next-field)
            ;; flyspell mode to spell check everywhere
            (flyspell-mode 1)))

;; Org Agenda files and org-dir
(setq org-directory "~/git/org/")
(setq org-agenda-files (quote ("~/git/org/regcm.org"
			       "~/git/org/fam.org"
			       "~/git/org/management.org"
			       "~/git/org/refile.org"
			       "~/git/org/todo.org"
			       "~/git/org/webstuff.org"
			       "~/git/org/wrf.org"
			       )))

;; Custom Key Bindings
(global-set-key (kbd "<f12>") 'org-agenda)
(global-set-key (kbd "C-<f8>") 'org-cycle-agenda-files)
(global-set-key (kbd "<f9> c") 'calendar)
(global-set-key (kbd "<f9> g") 'gnus)
(global-set-key (kbd "<f9> s") 'bh/go-to-scratch)

(global-set-key (kbd "<f9> f") 'boxquote-insert-file)
(global-set-key (kbd "<f9> b") 'bbdb)
(global-set-key (kbd "<f9> r") 'boxquote-region)
(global-set-key (kbd "<f9> v") 'visible-mode)
(global-set-key (kbd "C-<f9>") 'previous-buffer)
(global-set-key (kbd "C-<f10>") 'next-buffer)
(global-set-key (kbd "M-<f9>") (lambda ()
                                 (interactive)
                                 (unless (buffer-modified-p)
                                   (kill-buffer (current-buffer)))
;;                                 (delete-frame)))
				 ))

;; defuns (finally integrate into other sections)
;; ---------------------------------------------
(defun bh/go-to-scratch ()
  (interactive)
  (switch-to-buffer "*scratch*")
  ;; (delete-other-windows))
  )

;; TODO key words
(setq org-todo-keywords (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!/!)")
 (sequence "WAITING(w@/!)" "SOMEDAY(s!)" "|" "CANCELLED(c@/!)"))))


(setq org-todo-keyword-faces (quote (("TODO" :foreground "red" :weight bold)
 ("NEXT" :foreground "blue" :weight bold)
 ("DONE" :foreground "forest green" :weight bold)
 ("WAITING" :foreground "yellow" :weight bold)
 ("SOMEDAY" :foreground "goldenrod" :weight bold)
 ("CANCELLED" :foreground "orangered" :weight bold)
 ("OPEN" :foreground "magenta" :weight bold)
 ("CLOSED" :foreground "forest green" :weight bold))))

;;change state
(setq org-use-fast-todo-selection t)
(setq org-treat-S-cursor-todo-selection-as-state-change nil)

;;ToDo state triggers 
(setq org-todo-state-tags-triggers
      (quote (("CANCELLED"
               ("CANCELLED" . t))
              ("WAITING"
               ("WAITING" . t))
              ("SOMEDAY"
               ("WAITING" . t))
              (done
               ("WAITING"))
              ("TODO"
               ("WAITING")
               ("CANCELLED"))
              ("NEXT"
               ("WAITING"))
              ("DONE"
               ("WAITING")
               ("CANCELLED")))))



;; Narrowing to subtree
(global-set-key (kbd "<f5>") 'bh/org-todo)

(defun bh/org-todo ()
  (interactive)
  (org-narrow-to-subtree)
  (org-show-todo-tree nil))

(global-set-key (kbd "<S-f5>") 'bh/widen)

(defun bh/widen ()
  (interactive)
  (widen)
  (org-reveal))

;; Tags stuff
;; ----------
; Tags with fast selection keys
(setq org-tag-alist (quote ((:startgroup)
                            ("@home" . ?h)
                            ("@lab" . ?l)
                            ("@xhome" . ?x)
                            ("@shop" . ?s)
                            (:endgroup)
                            ("PHONE" . ?P)
			    ("email" . ?e)
                            ("WAITING" . ?W)
                            ("work" . ?w)
			    ("git" . ?g)
                            ("emacs" . ?E)
                            ("HOME" . ?H)
                            ("ORG" . ?O)
                            ("KIRTI" . ?K)
                            ("NOTE" . ?n)
                            ("CANCELLED" . ?C))))

; Allow setting single tags without the menu
(setq org-fast-tag-selection-single-key (quote expert))

; For tag searches ignore tasks with scheduled and deadline dates
(setq org-agenda-tags-todo-honor-ignore-options t)

;; Use IDO for target completion
(setq org-completion-use-ido t)


;; refile stuff
;; ------------
;; Targets include this file and any file contributing to the agenda - up to 5 levels deep
(setq org-refile-targets (quote ((org-agenda-files :maxlevel . 5) (nil :maxlevel . 5))))

;; Targets start with the file name - allows creating level 1 tasks
(setq org-refile-use-outline-path (quote file))

;; Targets complete in steps so we start with filename, TAB shows the next level of targets etc
(setq org-outline-path-complete-in-steps t)

;; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes (quote confirm))


;; Custom Agenda views
;; -------------------
(custom-set-variables
'(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-skip-timestamp-if-done t)
 '(org-agenda-tags-todo-honor-ignore-options t)
 '(org-agenda-todo-ignore-scheduled t)
 '(org-agenda-todo-ignore-with-date t))

(provide 'init-org)
