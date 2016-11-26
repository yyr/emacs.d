;;; init-doc-view.el
;; Author: Yagnesh Raghava Yakkala. http://yagnesh.org
;; Created: Monday, March 31 2014

;;; docview.
(add-hook 'doc-view-mode-hook
          (lambda ()
            (local-set-key "G" 'doc-view-goto-page)))

;;; pdf-tools
(when (and (not on-lab-server) (not on-ms))
  (progn
    (el-get 'sync 'pdf-tools)
    (pdf-tools-install)
    ;; (loop for key in
    ;;       '(("G" pdf-view-goto-page))
    ;;       do (define-key pdf-view-mode-map (car key) (cadr key)))
    ))

(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-source-correlate-start-server t)
(setq TeX-view-program-list '(("pdf-tools" "TeX-pdf-tools-sync-view")))


;; Update PDF buffers after successful LaTeX runs
(add-hook 'TeX-after-TeX-LaTeX-command-finished-hook
          #'TeX-revert-document-buffer)

(defun my-pdf-view-keys ()
  (let ((map pdf-view-mode-map))
    (define-key map "j" 'pdf-view-next-line-or-next-page)
    (define-key map "k" 'pdf-view-previous-line-or-previous-page)
    (define-key map "R" 'pdf-history-forward)
    (define-key map "w" 'pdf-view-fit-width-to-window)))

(add-hook 'pdf-view-mode-hook 'my-pdf-view-keys)

;;; init-doc-view.el ends here
