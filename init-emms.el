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

(global-set-key (kbd "<f8> s") 'emms-play-directory-tree)  ;s stands for start
(global-set-key (kbd "<f8> t") 'emms-toggle-repeat-playlist)
(global-set-key (kbd "<f8> o") 'emms)

(global-set-key (kbd "<f8> P") 'emms-pause)
(global-set-key (kbd "<f8> a") 'emms-add-playlist-directory)
(global-set-key (kbd "<f8> A") 'emms-add-playlist-directory-tree)
(global-set-key (kbd "<f8> n") 'emms-next)
(global-set-key (kbd "<f8> p") 'emms-previous)

;;; Better Icon function.
(require 'emms-mode-line-icon)
(defun emms-mode-line-icon-function ()
  (concat " "
          emms-mode-line-icon-before-format
          (propertize "NP:" 'display emms-mode-line-icon-image-cache)
          (format emms-mode-line-format (emms-track-get
                                         (emms-playlist-current-selected-track)
                                         'info-title))))


;;; osdsh display
;; (defun emms-osd-message (string)
;;   (shell-command-to-string
;;    (concat "osdctl" " -s " "\"" string "\"" ","))
;;   nil)

;; (defun my-emms-current ()
;;   (interactive)
;;   (emms-track-description (emms-playlist-current-selected-track)))

;; (defun emms-osd-np ()
;;   (interactive)
;;   (emms-osd-message (my-emms-current))
;;   nil)

;; (add-hook 'emms-player-started-hook 'emms-osd-np)

;;; init-emms.el ends here
