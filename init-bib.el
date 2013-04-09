;;; init-bib.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: init-bib.el
;; Created: Sunday, September  4 2011
;; License: GPL v3 or later. You should get a copy from <http://www.gnu.org/licenses/gpl.html>

;;; Description:
;; managing bibliography modes

(el-get 'sync '(ebib
                zotelo))

(autoload 'ebib "ebib"
  "Ebib, a BibTeX database manager." t)

(add-hook 'LaTeX-mode-hook
          #'(lambda ()
              (local-set-key "\C-cb" 'ebib-insert-bibtex-key)))

(global-set-key (kbd "C-c B") 'ebib)

(setq
 ebib-file-search-dirs '("~/git/bib/")
 ebib-insertion-commands                ; which cite commands you wanna use
 '(("cite" 1 nil) ("citep" 1 nil) ("citet" 1 nil))
 ebib-preload-bib-files '("~/git/bib/fullnames.bib" "~/git/bib/shortnames.bib"
                          "~/git/bib/cld.bib"))

;;;;;;;;;;;;;;;;;;;;  bibtex setting  ;;;;;;;;;;;;;;;;;;;;
(setq bibtex-autokey-names 1
      bibtex-autokey-names-stretch 1
      bibtex-autokey-name-separator "-"
      bibtex-autokey-additional-names "-et.al."
      bibtex-autokey-name-case-convert 'identity
      bibtex-autokey-name-year-separator "-"
      bibtex-autokey-titlewords-stretch 0
      bibtex-autokey-titlewords 0
      bibtex-maintain-sorted-entries 'plain
      bibtex-entry-format '(opts-or-alts numerical-fields))



;;; init-bib.el ends here
