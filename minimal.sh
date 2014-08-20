#!/bin/bash
# Created: Thursday, March  7 2013

function usage()
{
    cat <<EOF

USAGE:
       $0 <package-to-load>
EOF
    exit 2
}

if [[ $# -eq 0 ]]; then
    usage
else
    emacs -Q -l ~/.emacs.d/lisp/minimal.el -eval "(minimal-load-$1)"
fi
