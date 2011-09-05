;;; init-bib.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: init-bib.el
;;  Author: Yagnesh Raghava Yakkala <yagnesh@NOSPAM.live.com>
;; Created: Sunday, September  4 2011
;; Licence: GPL v3 or later. You should get a copy from <http://www.gnu.org/licenses/gpl.html>

;;; Description:
;; managing bibliography modes

(autoload 'ebib "ebib" "Ebib, a BibTeX database manager." t)
(add-hook 'LaTeX-mode-hook #'(lambda ()
                               (local-set-key "\C-cb" 'ebib-insert-bibtex-key)))


(provide 'init-bib)
;;; init-bib.el ends here
