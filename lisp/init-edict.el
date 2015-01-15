;;; init-edict.el
;; Author: Yagnesh Raghava Yakkala. http://yagnesh.org
;; Created: Friday, July 27 2012

(when (executable-find "hg")
  (el-get 'sync '(edict)))

(setq edict-dictionaries
      (list
       "/usr/share/edict/edict"
       "/usr/share/edict/kanjidic"
       "/usr/share/edict/lingdic"))

(add-to-list 'auto-coding-alist '("edict\\'" . euc-jp))
(add-to-list 'auto-coding-alist '("kanjidic\\'" . euc-jp))

;; (setq edict-dictionaries
;;       (list
;;        "/usr/share/edict/4jwords"
;;        "/usr/share/edict/aviation"
;;        "/usr/share/edict/classical"
;;        "/usr/share/edict/compdic"
;;        "/usr/share/edict/compverb"
;;        "/usr/share/edict/concrete"
;;        "/usr/share/edict/edict"
;;        "/usr/share/edict/edicth"
;;        "/usr/share/edict/enamdict"
;;        "/usr/share/edict/findic"
;;        "/usr/share/edict/geodic"
;;        "/usr/share/edict/j_places"
;;        "/usr/share/edict/jddict.v02"
;;        (cons "/usr/share/edict/kanjd212"  'euc-jp)
;;        "/usr/share/edict/kanjidic"
;;        "/usr/share/edict/lingdic"
;;        "/usr/share/edict/mktdic"
;;        "/usr/share/edict/pandpdic"))


;;; init-edict.el ends here
