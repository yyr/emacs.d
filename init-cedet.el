;;; init-cedet.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: init-cedet.el
;; Created: Saturday, October 29 2011
;; License: GPL v3 or later. <http://www.gnu.org/licenses/gpl.html>

;;; Description:
;;

(unless (featurep 'cedet)
  (when (file-directory-p "~/.emacs.d/el-get/cedet")
    (progn
      (add-to-list 'load-path  "~/.emacs.d/el-get/cedet")
      (load-file "~/.emacs.d/el-get/cedet/cedet-devel-load.el")
      (setq semantic-default-submodes
            (append semantic-default-submodes
                    '(
                      ;; cache(?)
                      global-semanticdb-minor-mode

                      ;; code helpers
                      global-semantic-idle-scheduler-mode
                      global-semantic-idle-summary-mode
                      global-semantic-idle-completions-mode
                      global-semantic-highlight-func-mode
                      global-semantic-decoration-mode

                      global-semantic-stickyfunc-mode
                      global-semantic-highlight-edits-mode
                      global-cedet-m3-minor-mode
                      global-semantic-idle-local-symbol-highlight-mode

                      ;; debugging semantic itself
                      global-semantic-show-parser-state-mode
                      global-semantic-show-unmatched-syntax-mode
                      global-semantic-highlight-edits-mode)))
      (global-ede-mode 1)
      (semantic-mode 1)
      )))

;;; init-cedet.el ends here
