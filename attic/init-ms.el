;;; init-ms.el
;; Author: Yagnesh Raghava Yakkala. http://yagnesh.org
;; Created: Tuesday, June 12 2012

;;; Should install MinGW from
;;; http://sourceforge.net/projects/mingw/files/Installer/mingw-get-inst/
;; don't forget install MSYS also when installing MinGW.  (optionally)
;; Gnuwin32
;; http://sourceforge.net/projects/getgnuwin32/files/getgnuwin32/

(setq shell-file-name "C:/MinGW/msys/1.0/bin/bash")
(setq explicit-shell-file-name shell-file-name)


;;; excutable paths (for unix commands from MSYS and git from msysgit)
(setq exec-path (append exec-path
                        '("C:/MinGW/msys/1.0/bin/"
                          "C:/MinGW/bin/"
                          "c:/MinGW/mingw32/bin"

                          ;; This must be last
                          "C:/Program Files (x86)/Git/bin")))

;;; init-ms.el ends here
