;; -----------------------------------------------------------------------------
;; EMACS INIT 
;; -----------------------------------------------------------------------------

;; -----------------------------------------------------------------------------
;; 
;; define some emacs related symbols
;; emacs path ~/.emacs.d/
;; config elisps are in ~/.emamcs.d/config
;;
;; -----------------------------------------------------------------------------
(setq user-full-name '"yagnesh raghava yakkala")
(setq user-mail-address '"yagneshmsc@NOSPAMgmail.com")

(defconst emacs-path "~/.emacs.d/")
(defconst my-emacs-config "~/.emacs.d/config/")

;;----------------------------------------------------------------------------
;; Make elisp more civilised
;;  following two from steves emacs.d git http://git.sanityinc.com/
;;----------------------------------------------------------------------------
(require 'cl)

;;----------------------------------------------------------------------------
;; Set load path (all subdirectories from el-get as well)
;;----------------------------------------------------------------------------
(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
    (let* ((my-lisp-dir "~/.emacs.d/el-get/")
           (default-directory my-lisp-dir))
      (progn
        (setq load-path (cons my-lisp-dir load-path))
        (normal-top-level-add-subdirs-to-load-path))))
(setq load-path (cons (expand-file-name emacs-path) (cons my-emacs-config load-path)))

;; ----------------------------------------------------------------------------- 
;; load emacs individual configuration files
;; -----------------------------------------------------------------------------

;;; package managers
(require 'init-elpa)
(require 'init-el-get)

;; help typing
(require 'init-autopair)
(require 'init-yasnip)
(require 'init-hippie-expand)
(require 'init-auto-fill)

;; File management
(require 'init-dired)

;;; make friendly mini buffer 
(require 'init-ido)
(require 'init-smex)

;; langs
(require 'init-perl)
(require 'init-fortran)

;;subject
(require 'init-octave)  
(require 'init-latex)   

;; GTD
(require 'init-org)

;; Info,  help & Doc
(require 'init-info)

(load (concat my-emacs-config "look"))           ;; font and themes settings
(load (concat my-emacs-config "general"))        ;; General seeting for emacs
