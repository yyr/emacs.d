;;; init-bookmarks.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; License: Gpl v3 or later

(global-set-key (kbd "<f5> m" ) 'bookmark-set)
(global-set-key (kbd "<f5> b" ) 'bookmark-jump)
(global-set-key (kbd "<f5> l") 'bookmark-bmenu-list)
(global-set-key (kbd "<f5> d") 'bookmark-delete)

;;; for fast navigation to bookmarks add more simple key
(global-set-key (kbd "C-#" ) 'bookmark-jump)
(global-set-key (kbd "C-$" ) 'bookmark-set)


;;; emacswiki
;;; Put last accessed bookmark on top of the list
(defadvice bookmark-jump (after bookmark-jump activate)
  (let ((latest (bookmark-get-bookmark bookmark)))
    (setq bookmark-alist (delq latest bookmark-alist))
    (add-to-list 'bookmark-alist latest)))


;;; init-bookmarks.el ends here
