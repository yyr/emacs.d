;;; init-python.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;;    File: init-python.el
;;  Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;; Created: Friday, July 22 2011
;; License: GPL v3 or later. You should get a copy from <http://www.gnu.org/licenses/gpl.html>

;;; Description:

(setq load-path
      (append (list nil
                    "~/.emacs.d/el-get/python-mode"
                    "~/.emacs.d/el-get/pymacs"
                    "~/.emacs.d/el-get/ipython"
                    )
              load-path))

;;; load python-mode.el for python3
(require 'python-mode)

;;; ipython
;(setq ipython-command "ipython3")
;(require 'ipython)

;;; pymacs
(require 'pymacs)

(add-hook 'python-mode-hook
          (lambda ()
            (eldoc-mode 1)
            ))


;;; Pymacs
(setq pylookup-dir "~/.emacs.d/el-get/pylookup")
(add-to-list 'load-path pylookup-dir)

;; load pylookup when compile time
(require 'pylookup)

;; set executable file and db file
(setq pylookup-program (concat pylookup-dir "/pylookup.py"))
(setq pylookup-db-file (concat pylookup-dir "/pylookup.db"))

;; to speedup, just load it on demand
(autoload 'pylookup-lookup "pylookup"
  "Lookup SEARCH-TERM in the Python HTML indexes." t)

(autoload 'pylookup-update "pylookup"
  "Run pylookup-update and create the database at `pylookup-db-file'." t)


;;; init-python.el ends here
