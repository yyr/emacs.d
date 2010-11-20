
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

(provide 'init-org-ob)
