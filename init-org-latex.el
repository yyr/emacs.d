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


;;; suvayu ali from org list
;; backend aware export preprocess hook
(defun sa-org-export-preprocess-hook ()
  "My backend aware export preprocess hook."
  (save-excursion
    (when (eq org-export-current-backend 'latex)
      ;; ignoreheading tag for bibliographies and appendices
      (let* ((tag "ignoreheading"))
        ;; (goto-char (point-min))
        ;; (while (re-search-forward (concat ":" tag ":") nil t)
        ;; (delete-region (point-at-bol) (point-at-eol)))
        (org-map-entries (lambda ()
                           (delete-region (point-at-bol) (point-at-eol)))
                         (concat ":" tag ":"))))
    (when (eq org-export-current-backend 'html)
      ;; set custom css style class based on matched tag
      (let* ((match "Qn"))
        (org-map-entries
         (lambda () (org-set-property "HTML_CONTAINER_CLASS" "inlinetask"))
         match)))))

(add-hook 'org-export-preprocess-hook 'sa-org-export-preprocess-hook)

;;; export options
(setq org-export-allow-BIND t)

;;; ignore heading
;;; Nicolas Goaziou, http://article.gmane.org/gmane.emacs.orgmode/55972
(defun my-e-latex-headline (headline contents info)
  (if (member "ignoreheading" (org-element-property :tags headline))
      contents
    (org-e-latex-headline headline contents info)))

(require 'org-e-latex)
(add-to-list 'org-e-latex-translate-alist
             '(headline . my-e-latex-headline))

;;; init-org-latex.el ends here
