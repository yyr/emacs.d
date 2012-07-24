;; w3m browser

(require 'w3m-load)

;;; caching on
(setq url-automatic-caching t)

;; (setq w3m-key-binding 'info) ; info-like
(setq w3m-key-binding 'nil) ; lynx-like

;;(add-to-list 'load-path "~/emacs/emacs-w3m")
;;(autoload 'w3m "w3m" "Interface for w3m on Emacs." t)
(setq w3m-coding-system 'utf-8
      w3m-file-coding-system 'utf-8
      w3m-file-name-coding-system 'utf-8
      w3m-input-coding-system 'utf-8
      w3m-output-coding-system 'utf-8
      w3m-terminal-coding-system 'utf-8
      w3m-use-cookies t)

;; (add-hook 'w3m-display-hook
;;           (lambda (url)
;;             (rename-buffer
;;              (format "*w3m: %s*" (or w3m-current-title
;;                                      w3m-current-url)) t)))


(defun w3m-open-current-page-in-firefox ()
  "Opens the current URL in Mozilla Firefox."
  (interactive)
  (browse-url-firefox w3m-current-url))

(defun w3m-open-link-or-image-in-firefox ()
  "Opens the current link or image in Firefox."
  (interactive)
  (browse-url-firefox (or (w3m-anchor)
                          (w3m-image))))

(add-hook 'w3m-mode-hook
          (lambda ()
            (local-set-key (kbd "<f5> o") 'w3m-open-link-or-image-in-firefox)
            (define-key w3m-mode-map "f" 'w3m-open-current-page-in-firefox)
            (define-key w3m-mode-map "F" 'w3m-open-link-or-image-in-firefox)))

(defun w3m-copy-link ()
  "copy link at point"
  (interactive)
  (kill-new (w3m-anchor)))
