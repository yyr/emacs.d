;; -----------------------------------------------------------------------------
;; yasnippet 
;; -----------------------------------------------------------------------------

(require 'yasnippet) ;; yasnippet-bundle
(setq yas/snippet-dirs '"~/.emacs.d/snippets/")
(yas/initialize)

(setq yas/root-directory '( "~/.emacs.d/snippets/"))
; Map `yas/load-dir/")ectory' to every element
(mapc 'yas/load-directory yas/root-directory)

(provide 'init-yasnip)
