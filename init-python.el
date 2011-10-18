;;; init-python.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;;    File: init-python.el
;;  Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;; Created: Friday, July 22 2011
;; License: GPL v3 or later. You should get a copy from <http://www.gnu.org/licenses/gpl.html>

;;; Description:

(require 'pymacs)

;; (pymacs-load "ropemacs" "rope-")
(add-hook 'python-mode-hook
          '(lambda () (eldoc-mode 1)) t)

(setq py-python-command-args '( "--colors" "Linux"))

;;; init-python.el ends here
