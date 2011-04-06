;;; init-battery.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;; Licence: GPL v3 or later
;;
(require 'battery)
(when (and battery-status-function
	   (not (string-match-p "N/A" 
				(battery-format "%B"
						(funcall battery-status-function)))))
  (display-battery-mode 1))

(provide 'init-battery)
;;; init-battery.el ends here
