;; -----------------------------------------------------------------------------
;; ORG MODE stuff day planner GTD
;; -----------------------------------------------------------------------------

;;(add-to-list 'load-path (expand-file-name "~/git/org-mode/lisp"))
;(add-to-list 'load-path (expand-file-name "~/git/org-mode/lisp"))
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


;;info thing
(global-set-key (kbd "<f9> i") 'bh/org-info)

(defun bh/org-info ()
  (interactive)
  (info "~/git/info/org.info"))

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
 ;; (sequence "OPEN(O)" "|" "CLOSED(C)"))))


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

(defun bh/clock-in-to-next (kw)
  "Switch task from TODO to NEXT when clocking in.
Skips capture tasks and tasks with subtasks"
  (if (and (string-equal kw "TODO")
           (not (and (boundp 'org-capture-mode) org-capture-mode)))
      (let ((subtree-end (save-excursion (org-end-of-subtree t)))
            (has-subtask nil))
        (save-excursion
          (forward-line 1)
          (while (and (not has-subtask)
                      (< (point) subtree-end)
                      (re-search-forward "^\*+ " subtree-end t))
            (when (member (org-get-todo-state) org-not-done-keywords)
              (setq has-subtask t))))
        (when (not has-subtask)
          "NEXT"))))

;; Remove empty CLOCK drawers on clock out
(defun bh/remove-empty-drawer-on-clock-out ()
  (interactive)
  (save-excursion
    (beginning-of-line 0)
    (org-remove-empty-drawer-at "CLOCK" (point))))

(add-hook 'org-clock-out-hook 'bh/remove-empty-drawer-on-clock-out 'append)


;; org-babel Setup
;; ---------------
(setq org-ditaa-jar-path "~/git/repos/org-mode/contrib/scripts/ditaa.jar")
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images)
(setq org-babel-load-languages (quote ((emacs-lisp . t)
                                         (dot . t)
                                         (ditaa . t)
                                         (octave . t)
                                         (python . t)
                                         (perl . t)
                                         (gnuplot . t)
                                         (sh . t))))

;; Do not prompt to confirm evaluation
;; This may be dangerous - make sure you understand the consequences
;; of setting this -- see the docstring for details
 (setq org-confirm-babel-evaluate nil)

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



;; Load Org capture Stuff
;; ------------------------
;; I use C-M-r to start org-capture
(global-set-key (kbd "C-M-r") 'org-capture)

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

(setq org-agenda-custom-commands
      (quote (("w" "Tasks waiting on something" tags "WAITING/!"
               ((org-use-tag-inheritance nil)
                (org-agenda-todo-ignore-scheduled nil)
                (org-agenda-todo-ignore-deadlines nil)
                (org-agenda-todo-ignore-with-date nil)
                (org-agenda-overriding-header "Waiting Tasks")))
              ("r" "Refile New Notes and Tasks" tags "LEVEL=1+REFILE"
               ((org-agenda-todo-ignore-with-date nil)
                (org-agenda-todo-ignore-deadlines nil)
                (org-agenda-todo-ignore-scheduled nil)
                (org-agenda-overriding-header "Tasks to Refile")))
              ("N" "Notes" tags "NOTE"
               ((org-agenda-overriding-header "Notes")))
              ("n" "Next" tags-todo "-WAITING-CANCELLED/!NEXT"
               ((org-agenda-overriding-header "Next Tasks")))
              ("p" "Projects" tags-todo "LEVEL=2-REFILE|LEVEL=1+REFILE/!-DONE-CANCELLED"
               ((org-agenda-skip-function 'bh/skip-non-projects)
                (org-agenda-overriding-header "Projects")))
              ("o" "Other (Non-Project) tasks" tags-todo "LEVEL=2-REFILE|LEVEL=1+REFILE/!-DONE-CANCELLED"
               ((org-agenda-skip-function 'bh/skip-projects)
                (org-agenda-overriding-header "Other Non-Project Tasks")))
              ("A" "Tasks to be Archived" tags "LEVEL=2-REFILE/DONE|CANCELLED"
               ((org-agenda-overriding-header "Tasks to Archive")))
              ("h" "Habits" tags "STYLE=\"habit\""
               ((org-agenda-todo-ignore-with-date nil)
                (org-agenda-todo-ignore-scheduled nil)
                (org-agenda-todo-ignore-deadlines nil)
                (org-agenda-overriding-header "Habits")))
              ("#" "Stuck Projects" tags-todo "LEVEL=2-REFILE|LEVEL=1+REFILE/!-DONE-CANCELLED"
               ((org-agenda-skip-function 'bh/skip-non-stuck-projects)
                (org-agenda-overriding-header "Stuck Projects")))
              ("c" "Select default clocking task" tags "LEVEL=2-REFILE"
               ((org-agenda-skip-function
                 '(org-agenda-skip-subtree-if 'notregexp "^\\*\\* Organization"))
                (org-agenda-overriding-header "Set default clocking task with C-u C-u I"))))))

(defun bh/weekday-p ()
  (let ((wday (nth 6 (decode-time))))
    (and (< wday 6) (> wday 0))))

(defun bh/working-p ()
  (let ((hour (nth 2 (decode-time))))
    (and (bh/weekday-p) (or (and (>= hour 8) (<= hour 11))
                           (and (>= hour 13) (<= hour 16))))))

(defun bh/network-p ()
  (= 0 (call-process "/bin/ping" nil nil nil
                     "-c1" "-q" "-t1" "norang.ca")))

(defun bh/org-auto-exclude-function (tag)
  (and (cond
       ((string= tag "@home")
        (bh/working-p))
       ((string= tag "@office")
        (not (bh/working-p)))
       ((or (string= tag "@errand") (string= tag "phone"))
        (let ((hour (nth 2 (decode-time))))
          (or (< hour 8) (> hour 21)))))
       (concat "-" tag)))

(setq org-agenda-auto-exclude-function 'bh/org-auto-exclude-function)

;; Clocking 
;; ---------


;; Rounding minutes
(setq org-time-stamp-rounding-minutes (quote (1 15)))

;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)


;; ORG-Beamer
;; ==========

;; allow for export=>beamer by placing

;; #+LaTeX_CLASS: beamer in org files
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))
(add-to-list 'org-export-latex-classes
	     ;; beamer class, for presentations
	     '("beamer"
	       "\\documentclass[11pt]{beamer}\n
      \\mode<{{{beamermode}}}>\n
      \\usetheme{{{{beamertheme}}}}\n
      \\usecolortheme{{{{beamercolortheme}}}}\n
      \\beamertemplateballitem\n
      \\setbeameroption{show notes}
      \\usepackage[utf8]{inputenc}\n
      \\usepackage[T1]{fontenc}\n
      \\usepackage{hyperref}\n
      \\usepackage{color}
      \\usepackage{listings}
      \\lstset{numbers=none,language=[ISO]C++,tabsize=4,
  frame=single,
  basicstyle=\\small,
  showspaces=false,showstringspaces=false,
  showtabs=false,
  keywordstyle=\\color{blue}\\bfseries,
  commentstyle=\\color{red},
  }\n
      \\usepackage{verbatim}\n
      \\institute{{{{beamerinstitute}}}}\n          
       \\subject{{{{beamersubject}}}}\n"

	       ("\\section{%s}" . "\\section*{%s}")
	       
	       ("\\begin{frame}[fragile]\\frametitle{%s}"
		"\\end{frame}"
		"\\begin{frame}[fragile]\\frametitle{%s}"
		"\\end{frame}")))

;; letter class, for formal letters

(add-to-list 'org-export-latex-classes

	     '("letter"
	       "\\documentclass[11pt]{letter}\n
      \\usepackage[utf8]{inputenc}\n
      \\usepackage[T1]{fontenc}\n
      \\usepackage{color}"
	       
	       ("\\section{%s}" . "\\section*{%s}")
	       ("\\subsection{%s}" . "\\subsection*{%s}")
	       ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	       ("\\paragraph{%s}" . "\\paragraph*{%s}")
	       ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(setq org-emphasis-alist (quote (("*" bold "<b>" "</b>") 
      				 ("/" italic "<i>" "</i>")
      				 ("_" underline "<span style=\"text-decoration:underline;\">" "</span>")
      				 ("=" org-code "<code>" "</code>" verbatim)
      				 ("~" org-verbatim "<code>" "</code>" verbatim)
      				 ("+" (:strike-through t) "<del>" "</del>")
      				 ("@" org-warning "<b>" "</b>")))
      org-export-latex-emphasis-alist (quote 
      				       (("*" "\\textbf{%s}" nil)
      					("/" "\\emph{%s}" nil) 
      					("_" "\\underline{%s}" nil)
      					("+" "\\texttt{%s}" nil)
      					("=" "\\verb=%s=" nil)
      					("~" "\\verb~%s~" t)
      					("@" "\\alert{%s}" nil))))

(provide 'init-org)
