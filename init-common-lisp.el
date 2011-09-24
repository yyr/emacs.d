;;; init-common-lisp.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;; License: GPL v3 or later
;;

;; See http://bc.tech.coop/blog/070927.html
(add-to-list 'auto-mode-alist '("\\.cl$" . lisp-mode))

(setq load-path (cons
		 (expand-file-name
		  "~/.emacs.d/el-get/slime/contrib/")
		 load-path))

(setq inferior-lisp-program "/usr/bin/sbcl") ; your Lisp system
(add-hook 'lisp-mode-hook (lambda ()
                            (cond ((not (featurep 'slime))
                                   (require 'slime)
                                   (normal-mode)))))


(eval-after-load "slime"
  '(progn
     (add-to-list 'slime-lisp-implementations
		  '(sbcl ("sbcl") :coding-system utf-8-unix))
     (add-to-list 'slime-lisp-implementations
		  '(cmucl ("cmucl") :coding-system iso-latin-1-unix))
     (require 'slime-fancy)
     (require 'slime-banner)
     (require 'slime-asdf)
     (slime-banner-init)
     (slime-asdf-init)
     (setq slime-complete-symbol*-fancy t)
     (setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)
     (slime-setup)))

;; From http://bc.tech.coop/blog/070515.html
(defun lispdoc ()
  "Searches lispdoc.com for SYMBOL, which is by default the symbol currently under the curser"
  (interactive)
  (let* ((word-at-point (word-at-point))
         (symbol-at-point (symbol-at-point))
         (default (symbol-name symbol-at-point))
         (inp (read-from-minibuffer
               (if (or word-at-point symbol-at-point)
                   (concat "Symbol (default " default "): ")
                 "Symbol (no default): "))))
    (if (and (string= inp "") (not word-at-point) (not
                                                   symbol-at-point))
        (message "you didn't enter a symbol!")
      (let ((search-type (read-from-minibuffer
                          "full-text (f) or basic (b) search (default b)? ")))
        (browse-url (concat "http://lispdoc.com?q="
                            (if (string= inp "")
                                default
                              inp)
                            "&search="
                            (if (string-equal search-type "f")
                                "full+text+search"
                              "basic+search")))))))

(define-key lisp-mode-map (kbd "C-c l") 'lispdoc)


(provide 'init-common-lisp)

;;; Sources
;; ch.coop/blog/070927.html

;;; init-common-lisp.el ends here
