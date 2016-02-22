;;; init-doc-view.el
;; Author: Yagnesh Raghava Yakkala. http://yagnesh.org
;; Created: Monday, March 31 2014

;;; docview.
(add-hook 'doc-view-mode-hook
          (lambda ()
            (local-set-key "G" 'doc-view-goto-page)))


;;; init-doc-view.el ends here
