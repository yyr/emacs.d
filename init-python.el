;;; init-python.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;;    File: init-python.el
;;  Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;; Created: Friday, July 22 2011
;; License: GPL v3 or later. You should get a copy from <http://www.gnu.org/licenses/gpl.html>

;;; Description:

(require 'python)
(setq python-shell-interpreter "python3")
(add-hook 'python-mode-hook
          '(lambda ()
             (eldoc-mode 1)
            (define-key python-mode-map "\C-m" 'newline-and-indent)))


;;; FIXME
;;; pymacs

;;(require 'pymacs)
;;(setq py-python-command-args '( "--colors" "Linux"))

;;; ropemacs
;;(pymacs-load "ropemacs" "rope-")


;;; init-python.el ends here
