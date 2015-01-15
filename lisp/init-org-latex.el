;;; init-org-latex.el
;; Author: Yagnesh Raghava Yakkala. http://yagnesh.org

;; letter class, for formal letters
;;; letter class
(require 'ox-beamer)

(setq ox-latex-hyperref-format "\\ref{%s}")

;;; reftex setup from FAQ
(defun org-mode-reftex-setup ()
  (load-library "reftex")
  (and (buffer-file-name)
       (file-exists-p (buffer-file-name))
       (reftex-parse-all))
  (define-key org-mode-map (kbd "C-c [") 'reftex-citation))
;; (add-hook 'org-mode-hook 'org-mode-reftex-setup)

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
(add-to-list 'org-export-filter-headline-functions
             'org-latex-ignore-heading-filter-headline)

;;; init-org-latex.el ends here
