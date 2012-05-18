;;; init-org-latex.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;;

;; letter class, for formal letters
(require 'org-latex)


;;; letter class
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


;;; emphasis set up for latex
(setq org-export-latex-emphasis-alist (quote
                                       (("*" "\\textbf{%s}" nil)
                                        ("/" "\\emph{%s}" nil)
                                        ("_" "\\underline{%s}" nil)
                                        ("+" "\\texttt{%s}" nil)
                                        ("=" "\\verb=%s=" nil)
                                        ("~" "\\verb~%s~" t)
                                        ("@" "\\alert{%s}" nil))))


(setq org-export-latex-hyperref-format "\\ref{%s}")

;;; reftex setup from FAQ
(defun org-mode-reftex-setup ()
  (load-library "reftex")
  (and (buffer-file-name)
       (file-exists-p (buffer-file-name))
       (reftex-parse-all))
  (define-key org-mode-map (kbd "C-c [") 'reftex-citation))
(add-hook 'org-mode-hook 'org-mode-reftex-setup)

;; (setq org-latex-to-pdf-process '
;;       ("pdflatex -interaction nonstopmode %b"
;;        "/usr/bin/bibtex %b"
;;        "pdflatex -interaction nonstopmode %b"
;;        "pdflatex -interaction nonstopmode %b"))

;;; init-org-latex.el ends here
