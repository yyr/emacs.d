;;; init-mediawiki.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: init-mediawiki.el
;; Created: Sunday, April  1 2012
;; License: GPL v3 or later. <http://www.gnu.org/licenses/gpl.html>

;;; Description:
;;
(el-get 'sync '(mediawiki))

(require 'mediawiki)

(setq mediawiki-mode-hook (lambda ()
                            (progn
                              (visual-line-mode 1)
                              (define-key mediawiki-mode-map
                                (kbd "C-c o") 'mediawiki-browse)
                              (make-variable-buffer-local 'yas/trigger-key)
                              (setq yas/trigger-key [tab]))))

(setq mediawiki-site-default "wikemacs")

(defun yyr-mediawiki-browser-edit/create-page (&optional arg)
  "Edit pages in a web browser. It tries to pick \"Page Name\"
from the buffer, Otherwise it prompts.  Prompting for
\"Pagename\" can be forced by giving a prefix argument."
  (interactive "P")
  (let* ((site (if mediawiki-site
                   mediawiki-site
                 (mediawiki-prompt-for-site)))
         (url (mediawiki-site-extract site 1))
         (index "index.php?title=")
         (et "&action=edit")
         (page (if arg
                   (read-string "Page name (words): " nil nil nil)
                 mediawiki-page-title)))
    (funcall 'browse-url
             (message "%s%s%s%s"
                      url index (mediawiki-translate-pagename page) et))))


(define-key mediawiki-mode-map (kbd "C-c C-e")
  'yyr-mediawiki-browser-edit/create-page)

(define-key mediawiki-mode-map (kbd "C-c C-v")
  'mediawiki-browse)

;;; init-mediawiki.el ends here
