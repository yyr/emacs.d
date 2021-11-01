(setq package-enable-at-startup nil)
(setq gc-cons-threshold 64000000
      gc-cons-percentage 0.6)

(setq frame-inhibit-implied-resize t)
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
