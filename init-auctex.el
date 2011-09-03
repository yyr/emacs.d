;;; init-auctex.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;;    File: init-auctex.el
;;  Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;; Created: Tuesday, August  2 2011
;; Licence: GPL v3 or later. You should get a copy from <http://www.gnu.org/licenses/gpl.html>

;;; Description:

(add-to-list 'load-path "~/.emacs.d/el-get/auctex/preview/")
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)


(add-hook 'LaTeX-mode-hook
          (lambda()
            (define-key LaTeX-mode-map (kbd "<M-.>") 'TeX-complete-symbol)
            (TeX-PDF-mode t)
            (setq TeX-save-query  nil )
            (setq TeX-master (guess-TeX-master (buffer-file-name)))
            (setq TeX-show-compilation t)))

(add-hook 'LaTeX-mode-hook
          (lambda ()
            (imenu-add-menubar-index)
            (turn-on-reftex)))

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
                  (if (re-search-forward (concat "\\\\input{" filename "}") nil t)
                      (setq candidate file))
                  (if (re-search-forward (concat "\\\\include{" (file-name-sans-extension filename) "}") nil t)
                      (setq candidate file))))))))
    (if candidate
        (message "TeX master document: %s" (file-name-nondirectory candidate)))
    candidate))


;;; auto completion support
(defun ac-latex-mode-setup ()         ; add ac-sources to default ac-sources
  (setq ac-sources
        (append '(ac-source-math-latex ac-source-latex-commands  ac-source-math-unicode)
                ac-sources)))

(add-hook 'LaTeX-mode-hook
	  (lambda ()
	    (require 'ac-math)
	    (ac-latex-mode-setup)))


(provide 'init-auctex)
;;; init-auctex.el ends here
