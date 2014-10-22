#!/bin/bash
# Created: Wednesday, August 20 2014

elcode=$( cat <<EOF
(progn
  (setq debug-on-error (not noninteractive)
        el-get-default-process-sync t)
  (add-to-list 'load-path "~/.emacs.d/el-get/el-get/")
  (require 'el-get)
  (el-get-update-packages-of-type "git")
  (el-get-invalidate-autoloads))
EOF
)

emacs -Q -batch -eval "${elcode}"
