;;;  Octave mode

;; auto load
;;(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))

;; using Octave mode for all `.m' files
(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))

(eval-after-load "octave-mod"
  '(progn
     (require 'auto-complete-octave)
     (auto-complete-mode t)
     (setq octave-completion-alist
	   'octave-completion-alist)))

;;;      (setq octave-completion-alist
;;       (nconc octave-keywords octave-completion-alist))

(provide 'init-octave)
;;; init-octave.el ends here
