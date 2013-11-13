;;; init-japanese.el

;; install c/migemo
; sudo apt-get install migemo

(require 'migemo)
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs"))

;; Set your installed path
(setq migemo-dictionary "/usr/share/cmigemo/utf-8/migemo-dict")

(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
(setq migemo-coding-system 'utf-8-unix)
(load-library "migemo")
(migemo-init)

(add-to-list 'el-get-sources
             '(:name ddskk
                    :website "http://openlab.ring.gr.jp/skk/ddskk.html"
                    :description "A Japanese input method on Emacs."
                    :type http-tar
                    :options ("xzf")
                    :module "skk/main"
                    :url "http://openlab.ring.gr.jp/skk/maintrunk/ddskk-20131103.tar.gz"
                    :autoloads nil
                    :info "doc/skk.info"
                    :features ("skk-setup")
                    :path (.)
                    ;; The "correct" way would be actually installing ddskk into some subdirectory.
                    ;; But it needs significant work due to the limitation of the Makefile
                    ;; thus here we are trying to emulate the Makefile behaviour.
                    :build `((,el-get-emacs "-batch" "-q" "-no-site-file" "-l" "SKK-MK" "-f" "SKK-MK-compile")
                             (,el-get-emacs "-batch" "-q" "-no-site-file" "-l" "SKK-MK" "-f" "SKK-MK-compile-info")
                             ("mv" "skk-setup.el.in" "skk-setup.el"))))

(el-get 'sync 'ddskk)

;;; init-japanese.el ends here
