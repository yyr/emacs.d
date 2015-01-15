;;; init-diminish.el
;; Yagnesh Raghava Yakkala. http://yagnesh.org

;;; loading
(el-get 'sync '(diminish))

;;; setup
(autoload 'diminish "diminish" nil t)

(eval-after-load "eldoc" '(diminish 'eldoc-mode "ed"))
(eval-after-load "paredit" '(diminish 'paredit-mode "pe"))
(eval-after-load "yasnippet" '(diminish 'yas-minor-mode " Y"))
(eval-after-load "elisp-slime-nav" '(diminish 'elisp-slime-nav-mode))
(eval-after-load "git-gutter" '(diminish 'git-gutter-mode))

;;; init-diminish.el ends here
