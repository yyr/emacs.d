;;; init-gpg.el
;;    File: init-pgp.el
;; Created: Wednesday, March  7 2012

;;; Description:
;;

;;; EasyPG
(require 'epa-file)
(require 'epa-mail)
(epa-file-enable)

(setq mml2015-use 'epg
      mml2015-verbose t
      epg-user-id '3206D78B
      mml2015-encrypt-to-self t
      mml2015-always-trust nil
      mml2015-cache-passphrase t
      mml2015-passphrase-cache-expiry '36000
      mml2015-sign-with-sender t

      gnus-message-replyencrypt t
      gnus-message-replysign t
      gnus-message-replysignencrypted t
      gnus-treat-x-pgp-sig t

      mm-sign-option 'guided
      mm-encrypt-option 'guided
      mm-verify-option 'always
      mm-decrypt-option 'always

      gnus-buttonized-mime-types
      '("multipart/alternative"
        "multipart/encrypted"
        "multipart/signed")

      epg-debug t ;;  then read the *epg-debug*" buffer
      )

;;; init-gpg.el ends here
