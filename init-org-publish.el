;;; init-org-publish.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;;

(setq org-publish-yag "~/git/sites/")
(setq org-publish-yag-blog (concat org-publish-yag "yorg/"))

(setq org-publish-project-alist
      '(

        ("org-yag"
         ;; Path to your org files.
         :base-directory "~/git/sites/yorg/org/"
         :base-extension "org"

         ;; Path to your Jekyll project.
         :publishing-directory "~/git/sites/yorg/jekyll/"
         :recursive t
         :publishing-function org-publish-org-to-html
         :headline-levels 4
         :html-extension "html"
         :body-only t ;; Only export section between <body> </body>
         )

        ("org-static-yag"
         :base-directory "~/git/sites/yorg/org/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php"
         :publishing-directory "~/git/sites/yorg/jekyll"
         :recursive t
         :publishing-function org-publish-attachment)
        ("yag" :components ("org-yag" "org-static-yag"))
        ))


;;; init-org-publish.el ends here
