;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;; License: GPL v3 or later

(ido-mode t)
(ido-everywhere t)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(setq ido-auto-merge-work-directories-length 0)

(el-get 'sync 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

(load "init-smex")

;;; additional keys (copied from source file)
(defun ido-my-keys ()
  "Add my keybindings for ido."
  (define-key ido-completion-map " " 'ido-next-match)  ; use space for next match
  )

(add-hook 'ido-setup-hook 'ido-my-keys)

;; dont ask me again, for non existent file
(setq confirm-nonexistent-file-or-buffer nil)
(setq ido-create-new-buffer 'always)

(setq ido-file-extensions-order
      '(".tex" ".org" ".sh" ".ncl" ".py" ".el" ".xml" ".el" ".pdf"))

(setq ido-ignore-buffers '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido"
                           "^\*trace" "*Completions*" "^\*TAGS" "^\*Mus"
                           "\\`\*.*buffer" "^\*.*process" "^\*.*-Log"  "#.*"
                           "*Shell Command Output*" "Async Shell Command"
                           "^session\.*"))

(setq ido-ignore-directories
      (delete-dups (append ido-ignore-directories
                           '(".git" "\\`\\..*"))))

;; disable auto searching for files unless called explicitly
(setq ido-auto-merge-delay-time 99999)
(define-key ido-file-dir-completion-map (kbd "C-c C-s")
  (lambda()
    (interactive)
    (ido-initiate-auto-merge (current-buffer))))

;; Allow the same buffer to be open in different frames
(setq ido-default-buffer-method 'selected-window)

;;; init-ido.el ends here
