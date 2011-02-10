;;; init-org-latex.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;;

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


;;; emphasis set up for latex
(setq org-export-latex-emphasis-alist (quote 
      				       (("*" "\\textbf{%s}" nil)
      					("/" "\\emph{%s}" nil) 
      					("_" "\\underline{%s}" nil)
      					("+" "\\texttt{%s}" nil)
      					("=" "\\verb=%s=" nil)
      					("~" "\\verb~%s~" t)
      					("@" "\\alert{%s}" nil))))





(provide 'init-org-latex)
;;; init-org-latex.el ends here
