;; -----------------------------------------------------------------------------
;; fortran/f90
;; -----------------------------------------------------------------------------

(add-to-list 'auto-mode-alist
             '("\\.[fF]\\(03\\|95\\)\\'" . f90-mode))
;;(defalias 'fortran-mode 'f90-mode)

(add-hook 'f90-mode-hook
          (lambda ()
            ;; These are not default.
            (abbrev-mode 1)             ; turn on abbreviation mode
            (f90-add-imenu-menu)        ; extra menu with functions etc.
            (if f90-auto-keyword-case   ; change case of all keywords on startup
                (f90-change-keywords f90-auto-keyword-case))))

;;; namelist mode
(el-get 'sync 'namelist-mode)
;; (load "~/.emacs.d/el-get/namelist-mode/namelist-mode-load.el")

;;; init-fortran.el ends here
