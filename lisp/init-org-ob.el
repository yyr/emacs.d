;;; org-babel setup

(add-hook 'org-mode-hook
          (lambda ()
            (setq org-modules (append org-modules '(ob-python
;                                                    ob-sh
                                                    ob-ditaa
                                                    ob-perl
                                                    ob-latex
                                                    ob-plantuml
                                                    ob-gnuplot)))))
(setq org-babel-load-languages
      '((emacs-lisp . t)
        (dot . t)
        (ditaa . t)
        (octave . t)
        (latex . t)
        (perl . t)
        (python . t)
        (plantuml . t)
;        (sh . t)
        (gnuplot . t)))

;; (setq org-ditaa-jar-path "~/.emacs.d/el-get/org-mode/contrib/scripts/ditaa.jar")
;; (add-hook 'org-babel-after-execute-hook 'org-display-inline-images)

;; Do not prompt to confirm evaluation
;; This may be dangerous - make sure you understand the consequences
;; of setting this -- see the docstring for details
(setq org-confirm-babel-evaluate nil)
