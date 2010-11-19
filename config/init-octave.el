;; -----------------------------------------------------------------------------
;; OCTAVE mode
;; -----------------------------------------------------------------------------

;; auto load 
;;(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))

;; using Octave mode for all `.m' files
(autoload 'octave-mode "octave-mode" nil t)
(setq auto-mode-alist 
      (cons '("\\.m$" . octave-mode) auto-mode-alist))

;; turn on abbrev and auto-fill
(add-hook 'octave-mode-hook
	    (lambda ()
	      (auto-fill-mode 1)))


(provide 'init-octave)
