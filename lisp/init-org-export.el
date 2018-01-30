;;; init-org-export.el
;; Author: Yagnesh Raghava Yakkala. http://yagnesh.org
;; Created: Monday, January 19 2015

(setq org-emphasis-alist (quote (("*" bold "<b>" "</b>")
                                 ("/" italic "<i>" "</i>")
                                 ("_" underline "<span style=\"text-decoration:underline;\">" "</span>")
                                 ("=" org-code "<code>" "</code>" verbatim)
                                 ("~" org-verbatim "<code>" "</code>" verbatim)
                                 ("+" (:strike-through t) "<del>" "</del>")
                                 ("@" org-warning "<b>" "</b>"))))


(setq ox-latex-hyperref-format "\\ref{%s}")

;;; reftex setup from FAQ
(defun org-mode-reftex-setup ()
  (load-library "reftex")
  (and (buffer-file-name)
       (file-exists-p (buffer-file-name))
       (reftex-parse-all))
  (define-key org-mode-map (kbd "C-c )") 'reftex-citation))

(add-hook 'org-mode-hook 'org-mode-reftex-setup)

;; (setq org-latex-to-pdf-process '("texi2dvi --pdf --clean --verbose --batch %f"))
;; (setq org-latex-to-pdf-process '
;;       ("pdflatex -interaction nonstopmode %b"
;;        "/usr/bin/bibtex %b"
;;        "pdflatex -interaction nonstopmode %b"
;;        "pdflatex -interaction nonstopmode %b"))

;;; export options
(setq org-export-allow-BIND t)

;;; ignore heading
;;; Nicolas Goaziou, http://article.gmane.org/gmane.emacs.orgmode/67692
(defun org-latex-ignore-heading-filter-headline (headline backend info)
  "Strip headline from HEADLINE. Ignore BACKEND and INFO."
  (when (and (org-export-derived-backend-p backend 'latex)
             (string-match "\\`.*ignoreheading.*\n" headline))
    (replace-match "" nil nil headline)))

(eval-after-load "ox" `(add-to-list 'org-export-filter-headline-functions
                                    'org-latex-ignore-heading-filter-headline))

(eval-after-load "ox-latex"
  `(progn
     (add-to-list 'org-latex-classes
                  ;; beamer class, for presentations
                  '("beamer-1"
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

     (add-to-list 'org-latex-classes
                  '("beamer"
                    "\\documentclass[presentation]{beamer}
\[DEFAULT-PACKAGES]
\[PACKAGES]
\[EXTRA]"
                    ("\\section{%s}" . "\\section*{%s}")
                    ("\\subsection{%s}" . "\\subsection*{%s}")
                    ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))
))
;;; init-org-export.el ends here
