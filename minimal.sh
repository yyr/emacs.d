#!/bin/bash
# Created: Thursday, March  7 2013

emacs -Q -l ~/.emacs.d/minimal.el -eval "(minimal-load-$1)"
