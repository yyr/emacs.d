;;;  Octave mode

;; auto load
;;(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))

;; using Octave mode for all `.m' files
(autoload 'octave-mode "octave" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))

(defun ac-octave-mode-setup ()
  (setq ac-sources '(ac-source-octave)))

(eval-after-load "octave-mod"
  '(progn
     (require 'ac-octave)
     (auto-complete-mode t)
     (add-hook 'octave-mode-hook
               '(lambda () (ac-octave-mode-setup)))))



;;; init-octave.el ends here
