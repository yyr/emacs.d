;;; init-auctex.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;;    File: init-auctex.el
;; Created: Tuesday, August  2 2011
;; License: GPL v3 or later.
;; You should get a copy from <http://www.gnu.org/licenses/gpl.html>

;;; Description:
(add-to-list 'load-path "~/.emacs.d/el-get/auctex/preview")
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

(setq
 TeX-electric-escape t
 TeX-parse-self t
 TeX-auto-save t
 TeX-insert-braces nil
 TeX-display-help t
 TeX-master nil
 LaTeX-version "2e"
 LaTeX-indent-environment-check t
 )

(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook
          (lambda()
            (define-key LaTeX-mode-map (kbd "<M-.>") 'TeX-complete-symbol)
            (TeX-PDF-mode t)
            (setq TeX-save-query nil)
;            (setq TeX-master (guess-TeX-master (buffer-file-name)))
            (setq TeX-show-compilation t) ; show the compilation buffer
            (imenu-add-menubar-index)
            (outline-minor-mode)))

;;; add additional environments
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (LaTeX-add-environments
             '("algorithm" LaTeX-env-label)
             '("example" LaTeX-env-label)
             '("proposition" LaTeX-env-label))))

;; from emacs wiki
(defun guess-TeX-master (filename)
  "Guess the master file for FILENAME from currently open .tex files."
  (let ((candidate nil)
        (filename (file-name-nondirectory filename)))
    (save-excursion
      (dolist (buffer (buffer-list))
        (with-current-buffer buffer
          (let ((name (buffer-name))
                (file buffer-file-name))
            (if (and file (string-match "\\.tex$" file))
                (progn
                  (goto-char (point-min))
                  (if (re-search-forward
                       (concat "\\\\input{" filename "}") nil t)
                      (setq candidate file))
                  (if (re-search-forward
                       (concat
                        "\\\\include{" (file-name-sans-extension
                                        filename) "}") nil t)
                      (setq
                       candidate file))))))))
    (if candidate
        (message
         "TeX master document: %s" (file-name-nondirectory candidate)))
    candidate))

;;; --------------------------------------------------------
;;; auto completion support
(defun ac-latex-mode-setup ()         ; add ac-sources to default ac-sources
  (setq ac-sources
        (append
         '(ac-source-math-latex
           ac-source-latex-commands  ac-source-math-unicode)
         ac-sources)))

(add-hook 'LaTeX-mode-hook
          (lambda ()
            (require 'ac-math)
            (ac-latex-mode-setup)
            ))

(setq outline-minor-mode-prefix "\C-c\C-o")


;;; --------------------------------------------------------
;;; Reftex
(add-hook 'LaTeX-mode-hook
          '(lambda ()
             (turn-on-reftex)))

(setq reftex-plug-into-AUCTeX t
      reftex-guess-label-type t
      reftex-plug-into-AUCTeX t
      reftex-bibfile-ignore-list nil
      reftex-toc-follow-mode nil
      reftex-extra-bindings t
      reftex-enable-partial-scans t
      reftex-save-parse-info t
      reftex-use-multiple-selection-buffers t
      reftex-use-fonts t
      ;; reftex-cite-format 'natbib
      )

;;; not sure how this works
(add-hook 'reftex-mode-hook
          (function
           (lambda ()
             (setq reftex-section-regexp   ;; standard setting ...
                   (concat
                    "\\(\\`\\|[\n
]\\)[   ]*\\\\\\"
                    "(part\\|chapter\\|"
                    "section\\|subsection\\|subsubsection\\|"
                    "paragraph\\|subparagraph\\|subsubparagraph\\|"
                    "sfoil\\|foil"         ;; private addition
                    "\\)"
                    "\\*?\\(\\[[^]]*\\]\\)?{")))))

;;; init-auctex.el ends here
