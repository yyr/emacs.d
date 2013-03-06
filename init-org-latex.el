;;; init-org-latex.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;;

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

;; [[gnus:gmane.emacs.orgmode#87a9t8u75x.fsf@gmail.com][Email from Myles English: Re: Bibtex export]]
(defun my-export-delete-headlines-tagged-noheading (backend)
  (dolist (hl (nreverse (org-element-map (org-element-parse-buffer 'headline)
                            'headline
                          'identity)))
    (when (member "noheading" (org-element-property :tags hl))
      (goto-char (org-element-property :begin hl))
      (delete-region (point) (progn (forward-line) (point))))))

(add-to-list 'org-export-before-processing-hook
             'my-export-delete-headlines-tagged-noheading)


;;; init-org-latex.el ends here
