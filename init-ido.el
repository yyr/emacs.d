;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@NOSPAM.live.com>
;; License: GPL v3 or later

;; -----------------------------------------------------------------------------
;; IDO-minor-mode
;; -----------------------------------------------------------------------------

(ido-mode t)  ; use 'buffer rather than t to use only buffer switching
(ido-everywhere t)
(setq ido-enable-flex-matching t) ;; enable fuzzy matching
(setq ido-use-filename-at-point nil)
(setq ido-auto-merge-work-directories-length 0)
(setq ido-execute-command-cache nil)

;;; additional keys (copied from source file)
(defun ido-my-keys ()
  "Add my keybindings for ido."
  (define-key ido-completion-map " " 'ido-next-match)  ; use space for next match
  )

(add-hook 'ido-setup-hook 'ido-my-keys)


;; Allow the same buffer to be open in different frames
(setq ido-default-buffer-method 'selected-window)

(defun steve-ido-choose-from-recentf ()
  "Use ido to select a recently opened file from the `recentf-list'"
  (interactive)
  (find-file (ido-completing-read "Open file: " recentf-list nil t)))
(global-set-key [(meta f11)] 'steve-ido-choose-from-recentf)

;; dont ask me again, for non existent file
(setq confirm-nonexistent-file-or-buffer nil)
(setq ido-create-new-buffer 'always)

;; disable auto searching for files unless called explicitly
(setq ido-auto-merge-delay-time 99999)
(define-key ido-file-dir-completion-map (kbd "C-c C-s")
  (lambda()
    (interactive)
    (ido-initiate-auto-merge (current-buffer))))

(provide 'init-ido)
;;; init-ido.el ends here
