;;; init-doc-view.el
;; Author: Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: init-doc-view.el
;; Created: Monday, March 31 2014

;;; docview.
(add-hook 'doc-view-mode-hook
          (lambda ()
            (local-set-key "G" 'doc-view-goto-page)))

(when (and (not on-lab-server) (not on-ms))
  (el-get 'sync 'pdf-tools)
  (add-hook 'doc-view-mode-hook
            (lambda ()
              (when (equal (file-name-extension (buffer-file-name)) "pdf")
                (pdf-tools-enable)))))

;;; init-doc-view.el ends here
