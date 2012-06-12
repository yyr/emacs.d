;;; init-ms.el
;;
;; Author: Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: init-ms.el
;; Created: Tuesday, June 12 2012

;;; Description:
;;

;;; should install MinGW from
;;; http://sourceforge.net/projects/mingw/files/Installer/mingw-get-inst/
;; don't forget install MSYS also when installing MinGW.  (optionally)
;; gnuwin32
;; http://sourceforge.net/projects/getgnuwin32/files/getgnuwin32/

(setq shell-file-name "C:/MinGW/msys/1.0/bin/bash")
(setq explicit-shell-file-name shell-file-name)


;;; excutable paths (for unix commands from MSYS and git from msysgit)
(add-to-list 'exec-path "C:/MinGW/msys/1.0/bin/")
(add-to-list 'exec-path "C:/MinGW/bin/")
(add-to-list 'exec-path "c:/MinGW/mingw32/bin")
(add-to-list 'exec-path "C:/Program Files (x86)/Git/bin")

;;; init-ms.el ends here
