;;; init-emms.el
;;
;;    File: init-emms.el
;; Created: Thursday, July 21 2011

;;; Description:
;;

(el-get 'sync 'emms)
(require 'emms-setup)
(emms-devel)
(emms-default-players)

(setq
 emms-player-mpg321-parameters '("-o" "alsa")
 emms-playlist-buffer-name "*Music*"
 emms-source-file-default-directory "/dump/MUSIC/Telugu/"
 emms-directory "~/.emacs.d/emms/"
 emms-mode-line-icon-before-format "["
 emms-mode-line-format " %s]"
 emms-mode-line-icon-color "lightgrey"
 emms-show-format "NP: %s"
 ;; emms-mode-line-titlebar-function 'emms-mode-line-playlist-current

 ;; caching stuff
 later-do-interval 0.001
 emms-info-asynchronously nil
 )

;;; track info info
(require 'emms-info-libtag)
(setq
 emms-info-functions '(emms-info-libtag)
 emms-info-libtag-program-name (concat
                                (el-get-package-directory "emms")
                                "src/emms-print-metadata.pl"))

;;; Show better track information
(defun my-emms-info-track-description (track)
  "Return a description of the current track."
  (if (and (emms-track-get track 'info-artist)
           (emms-track-get track 'info-title))
      (let ((pmin (emms-track-get track 'info-playing-time-min))
            (psec (emms-track-get track 'info-playing-time-sec))
            (ptot (emms-track-get track 'info-playing-time))
            (art  (emms-track-get track 'info-artist))
            (tit  (emms-track-get track 'info-title)))
        (cond ((and pmin psec) (format "%s - %s [%02d:%02d]" art tit pmin psec))
              (ptot (format  "%s - %s [%02d:%02d]" art tit (/ ptot 60) (% ptot 60)))
              (t (emms-track-simple-description track))))))

(setq emms-track-description-function 'my-emms-info-track-description)

;;; Show me when track is changed
(add-hook 'emms-player-started-hook 'emms-show)
;; (add-hook 'emms-player-started-hook
;;           (lambda () (el-get-notify "Now playing" (emms-show))))


;;; Better Icon function.
(require 'emms-mode-line-icon)
(defun emms-mode-line-icon-function ()
  (concat " "
          emms-mode-line-icon-before-format
          (propertize "NP:" 'display emms-mode-line-icon-image-cache)
          (format emms-mode-line-format (emms-track-get
                                         (emms-playlist-current-selected-track)
                                         'info-title))))
;;; Utility function
(defun emms-show-at-point ()
  "Just like  `emacs-show' but at current point"
  (interactive)
  (let ((string (if emms-player-playing-p
                    (format emms-show-format
                            (emms-track-description
                             (emms-playlist-track-at (point)))))))
    (message "%s" string)))
(define-key emms-playlist-mode-map (kbd "F") 'emms-show-at-point)

;;; make a global keymap for emms.
(define-prefix-command 'emms-prefix-command 'emms-prefix-map "EMMS")
(loop for key in
      '(([left] emms-seek-backward)
        ([right] emms-seek-forward)
        ([up] emms-volume-raise)
        ([down] emms-volume-lower)

        ("\C-b" emms-seek-backward)
        ("\C-f" emms-seek-forward)

        ("o" emms)
        ("s" emms-start)
        ("q" emms-stop)
        ("n" emms-next)
        ("p" emms-previous)
        ("." emms-pause)

        ("d" emms-play-directory)
        ("D" emms-play-directory-tree)
        ("S" emms-shuffle)

        ("t" emms-toggle-repeat-playlist)
        ("a" emms-add-directory)
        ("A" emms-add-directory-tree)
        ("f" emms-add-find)

        ("l" emms-locate)
        ("f" emms-play-find)
        ("g" emms-playlist-mode-go)

        ("j" emms-seek)
        ("J" emms-seek-to)
        ("r" emms-random)
        ("i" emms-show)
        (";" emms-streams))
      do (define-key emms-prefix-map (car key) (cadr key)))

(global-set-key (kbd "<f8>") 'emms-prefix-command)

;;; init-emms.el ends here
