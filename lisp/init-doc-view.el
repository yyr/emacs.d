;;; init-doc-view.el
;; Author: Yagnesh Raghava Yakkala. http://yagnesh.org
;; Created: Monday, March 31 2014

;;; docview.
(add-hook 'doc-view-mode-hook
          (lambda ()
            (local-set-key "G" 'doc-view-goto-page)))

(when (and (not on-lab-server) (not on-ms))
  (progn
    (el-get 'sync 'pdf-tools)
    (pdf-tools-install)
    (loop for key in
          '(("G" pdf-view-goto-page)
            )
          do (define-key pdf-view-mode-map (car key) (cadr key)))))

;;; init-doc-view.el ends here
