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
(setq ipython-command "ipython3")
(require 'ipython)


;;; pymacs
(require 'pymacs)


(add-hook 'python-mode-hook
          '(lambda ()
             (eldoc-mode 1)
             (define-key python-mode-map "\C-m" 'newline-and-indent)))

;;; init-python.el ends here
