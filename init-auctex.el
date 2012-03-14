;;; init-auctex.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;;    File: init-auctex.el
;; Created: Tuesday, August  2 2011
;; License: GPL v3 or later.
;; You should get a copy from <http://www.gnu.org/licenses/gpl.html>

;;; Description:
;; settings for auctex and reftex .. etc

(add-to-list 'load-path "~/.emacs.d/el-get/auctex/preview")
(add-to-list 'load-path "~/.emacs.d/el-get/auctex")
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

(setq
 TeX-electric-escape t
 TeX-parse-self t
 TeX-auto-save t
 TeX-insert-braces nil
 TeX-display-help t
 LaTeX-version "2e"
 TeX-save-query nil
 LaTeX-indent-environment-check t
 TeX-show-compilation t ; show the compilation buffer
 )

(setq-default  TeX-master nil)

;;; main
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook
          (lambda()
            (TeX-PDF-mode t)
                                        ;            (setq TeX-master (guess-TeX-master (buffer-file-name)))
            (imenu-add-menubar-index)
            (define-key LaTeX-mode-map (kbd "M-.") 'TeX-complete-symbol)

;;; add additional environments
            (LaTeX-add-environments
             '("algorithm" LaTeX-env-label)
             '("example" LaTeX-env-label)
             '("proposition" LaTeX-env-label))))

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
            (ac-latex-mode-setup)))

;;; --------------------------------------------------------
;;; Reftex
(autoload 'reftex-mode "reftex" "RefTeX Minor Mode" t)
(autoload 'reftex-citation "reftex-cite" "Make citation" nil)
(autoload 'reftex-index-phrase-mode "reftex-index" "Phrase mode" t)

(add-hook 'LaTeX-mode-hook
          '(lambda ()
             (reftex-mode 1)
             (define-key LaTeX-mode-map (kbd "C-c p") 'reftex-parse-all)
             (setq )
             (setq reftex-section-levels
                   '(("part" . 0) ("chapter" . 1) ("section" . 2) ("subsection" . 3)
                     ("frametitle" . 4) ("subsubsection" . 4) ("paragraph" . 5)
                     ("subparagraph" . 6) ("addchap" . -1) ("addsec" . -2)))

             (setq reftex-plug-into-AUCTeX t ;activate
                   reftex-extra-bindings t
                   reftex-bibfile-ignore-list nil
                   reftex-guess-label-type t
                   reftex-revisit-to-follow t ; watch out!! bibs are changing

                   reftex-use-fonts t   ; make colorful toc
                   reftex-toc-follow-mode nil ; don't follow other toc(s)
                   reftex-toc-split-windows-horizontally t
                   reftex-auto-recenter-toc t
                   ;; reftex-toc-split-windows-fraction 0.2

                   reftex-enable-partial-scans t
                   reftex-save-parse-info t
                   reftex-use-multiple-selection-buffers t
                   ;; reftex-cite-format 'natbib
                   )

;;; not sure how this works
             (setq reftex-section-regexp   ;; standard setting ...
                   (concat
                    "\\(\\`\\|[\n
]\\)[   ]*\\\\\\"
                    "(part\\|chapter\\|"
                    "section\\|subsection\\|subsubsection\\|"
                    "paragraph\\|subparagraph\\|subsubparagraph\\|"
                    "sfoil\\|foil"         ;; private addition
                    "\\)"
                    "\\*?\\(\\[[^]]*\\]\\)?{"))
             (setq reftex-section-levels
                   '(("part" . 0) ("chapter" . 1) ("section" . 2) ("subsection" . 3)
                     ("frametitle" . 4) ("subsubsection" . 4) ("paragraph" . 5)
                     ("subparagraph" . 6) ("addchap" . -1) ("addsec" . -2)))))


;;; --------------------------------------------------------
;;; folding
(add-hook 'LaTeX-mode-hook (lambda ()
                             (TeX-fold-mode 1)
                                        ;                             (outline-mode 1)
                             (setq TeX-fold-env-spec-list
                                   (quote (("[comment]" ("comment"))
                                           ("[figure]" ("figure"))
                                           ("[table]" ("table"))
                                           ("[itemize]" ("itemize"))
                                           ("[enumerate]" ("enumerate"))
                                           ("[description]" ("description"))
                                           ("[overpic]" ("overpic"))
                                           ("[tabularx]" ("tabularx"))
                                           ("[code]" ("code"))
                                           ("[shell]" ("shell")))))))

;;(setq outline-minor-mode-prefix "\C-c\C-o")

;;; --------------------------------------------------------
;;; util functions

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

;;; http://www.emacswiki.org/emacs/TN
(require 'tex-buf)
(defun TeX-command-default (name)
  "Next TeX command to use. Most of the code is stolen from `TeX-command-query'."
  (cond ((if (string-equal name TeX-region)
             (TeX-check-files (concat name "." (TeX-output-extension))
                              (list name)
                              TeX-file-extensions)
           (TeX-save-document (TeX-master-file)))
         TeX-command-default)
        ((and (memq major-mode '(doctex-mode latex-mode))
              (TeX-check-files (concat name ".bbl")
                               (mapcar 'car
                                       (LaTeX-bibliography-list))
                               BibTeX-file-extensions))
         ;; We should check for bst files here as well.
         TeX-command-BibTeX)
        ((TeX-process-get-variable name
                                   'TeX-command-next
                                   TeX-command-Show))
        (TeX-command-Show)))

;;;  from wiki
(defcustom TeX-texify-Show t
  "Start view-command at end of TeX-texify?"
  :type 'boolean
  :group 'TeX-command)

(defcustom TeX-texify-max-runs-same-command 5
  "Maximal run number of the same command"
  :type 'integer
  :group 'TeX-command)

(defun TeX-texify-sentinel (&optional proc sentinel)
  "Non-interactive! Call the standard-sentinel of the current LaTeX-process.
If there is still something left do do start the next latex-command."
  (set-buffer (process-buffer proc))
  (funcall TeX-texify-sentinel proc sentinel)
  (let ((case-fold-search nil))
    (when (string-match "\\(finished\\|exited\\)" sentinel)
      (set-buffer TeX-command-buffer)
      (unless (plist-get TeX-error-report-switches (intern (TeX-master-file)))
        (TeX-texify)))))

(defun TeX-texify ()
  "Get everything done."
  (interactive)
  (let ((nextCmd (TeX-command-default (TeX-master-file)))
        proc)
    (if (and (null TeX-texify-Show)
             (equal nextCmd TeX-command-Show))
        (when  (called-interactively-p 'any)
          (message "TeX-texify: Nothing to be done."))
      (TeX-command nextCmd 'TeX-master-file)
      (when (or (called-interactively-p 'any)
                (null (boundp 'TeX-texify-count-same-command))
                (null (boundp 'TeX-texify-last-command))
                (null (equal nextCmd TeX-texify-last-command)))
        (mapc 'make-local-variable '(TeX-texify-sentinel TeX-texify-count-same-command TeX-texify-last-command))
        (setq TeX-texify-count-same-command 1))
      (if (>= TeX-texify-count-same-command TeX-texify-max-runs-same-command)
          (message "TeX-texify: Did %S already %d times. Don't want to do it anymore." TeX-texify-last-command TeX-texify-count-same-command)
        (setq TeX-texify-count-same-command (1+ TeX-texify-count-same-command))
        (setq TeX-texify-last-command nextCmd)
        (and (null (equal nextCmd TeX-command-Show))
             (setq proc (get-buffer-process (current-buffer)))
             (setq TeX-texify-sentinel (process-sentinel proc))
             (set-process-sentinel proc 'TeX-texify-sentinel))))))

(add-hook 'LaTeX-mode-hook
          '(lambda ()
             (define-key LaTeX-mode-map (kbd "C-c C-a") 'TeX-texify)))

;;; init-auctex.el ends here
