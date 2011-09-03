;;; init-yaoddmuse.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;;

(autoload 'yaoddmuse-mode "yaoddmuse" nil t)

(setq auto-mode-alist
      (cons '(".*/emacswiki.org/.*" . yaoddmuse-mode) auto-mode-alist))

(setq yaoddmuse-browse-function 'yaoddmuse-browse-page-in-w3m)  
(setq yaoddmuse-notify-function 'yaoddmuse-notify-popup-window) 
(setq yaoddmuse-wikis                                           
      '(("EmacsWiki" "http://www.emacswiki.org/cgi-bin/emacs" utf-8 "uihnscuskc=1;")))

(provide 'init-yaoddmuse)

;;; init-yaoddmuse.el ends here
