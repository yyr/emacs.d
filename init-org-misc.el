;;; init-org-misc.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;;    File: init-org-misc.el
;; Created: Tuesday, May 17 2011
;; License: GPL v3 or later. You should get a copy from <http://www.gnu.org/licenses/gpl.html>

;;; Description:

;;; org-scratch
(defun dan/switch-to-org-scratch ()
  "Switch to a temp Org buffer.
If the region is active, insert it."
  (interactive)
  (let ((contents
         (and (region-active-p)
              (buffer-substring (region-beginning)
                                (region-end)))))
    (find-file "/tmp/org-scratch.org")
    (if contents (insert contents))))


;;; just like pretty lambda (Jambunathan from org-mode list)
(font-lock-add-keywords
 'org-mode
 '(("\\[\\(X\\)\\]"
    (0 (progn (compose-region (match-beginning 1) (match-end 1) "✔") nil)))
   ))


;;; misc settings
(setq font-lock-verbose nil             ; to speed up org
      org-special-ctrl-a/e t            ; don't go to bol
      org-completion-use-ido t
      org-use-speed-commands t          ; activate speed commands
      org-return-follows-link t         ; RET dwim on links

      org-enable-priority-commands nil  ; I dont use org priorities
      )

;;; org2jekyll
(setq org2jekyll-basedir "~/blog")

;;; init-org-misc.el ends here
