;;; init-erc.el
;; Created: Saturday, August 20 2011

(setq erc-anonymous-login nil)
(setq erc-beep-p t)

;; Set personal information
(setq erc-nick "kindahero")
(setq erc-user-full-name "dontknow")

(setq erc-server-coding-system '(utf-8 . undecided))
(setq erc-echo-notices-in-minibuffers-flag t)
(add-hook 'erc-echo-notice-hook 'erc-echo-notice-in-active-buffer)

;; Set autojoin channels
(setq erc-autojoin-channels-alist
      '((".*\\.freenode.net" "#emacs" "#hcoop" "#guile" "#guix")))

;; check channels
(erc-track-mode t)
(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE"
                                "324" "329" "332" "333" "353" "477"))
;; don't show any of this
(setq erc-hide-list '("JOIN" "PART" "QUIT" "NICK"))

(eval-after-load "erc"
  '(progn
     ;; (require 'erc-bbdb)
     ;; Set personal information
     (setq erc-nick "kindahero")
     (setq erc-user-full-name "dontknow")

     (require 'erc-imenu)
     (require 'erc-menu)
     (require 'erc-notify)
     (require 'erc-ring)
     (require 'erc-log)
     (require 'erc-match)

     (setq erc-auto-query t
           erc-bbdb-auto-create-on-whois-p t
           erc-fill-column (- (window-width) 2)
           erc-pals '("" "")
           erc-notify-list erc-pals
           erc-log-channels-directory "~/.emacs.d/.erc/logs/"
           erc-hide-timestamps nil
           erc-log-insert-log-on-open nil
           erc-keywords '("kindahero")
           erc-save-buffer-on-part t
           erc-save-queries-on-quit t)

     (erc-button-mode 1)
     (erc-completion-mode 1)
     (erc-fill-mode 1)
     (erc-match-mode 1)
     (erc-netsplit-mode 1)
     (erc-services-mode 1)
     (erc-timestamp-mode 1)
     (erc-track-mode 1)
     (add-hook 'erc-mode-hook 'erc-add-scroll-to-bottom)))


;; Set autoconnect networks
(defun my-erc ()
  "Connect to my default ERC servers."
  (interactive)
  (erc-tls :server "irc.freenode.net" :port 7000))

(defun erc-start-or-switch ()
  (interactive)
  (if (get-buffer "irc.freenode.net:7000")
      (erc-track-switch-buffer 1)
    (when (y-or-n-p "Start ERC? ")
      (erc-tls :server "irc.freenode.net" :port 7000))))

(global-set-key (kbd "C-c e") 'erc-start-or-switch)

(defun erc/erc-autoaway ()
  "erc autoaway"
  (require 'erc-autoaway)
  (setq erc-auto-discard-away t)
  (setq erc-autoaway-idle-seconds 600)
  (setq erc-auto-set-away t)
  (setq erc-autoaway-use-emacs-idle t))

(add-hook 'erc-mode 'erc/erc-autoaway)

(defun erc-insert-emoticon ()
  "Prompt to insert an emoticon."
  (interactive)
  (let* ((category (ido-completing-read "Category: " (mapcar 'car *japanese-emoticons*)))
         (choices (assoc category *japanese-emoticons*)))
    (when choices (insert (ido-completing-read "Emoticon: " (cdr choices))))))

(defvar
  *japanese-emoticons*
  '(("Angry Japanese Emoticons" .
     ("ლ(ಠ益ಠლ)"
      "(╯°□°）╯︵ ┻━┻"
      "┬─┬ノ( º _ ºノ)"
      "┻━┻ ︵ ヽ(`Д´)ﾉ ︵ ┻━┻"
      "(*≧m≦*)"
      "(>_<)"
      "(,,#ﾟДﾟ)"
      "ヽ(ｏ`皿′ｏ)ﾉ"
      "o(>< )o"
      "ｏ( ><)o"
      "ヽ(≧Д≦)ノ"
      "（＞д＜）"
      "（;≧皿≦）"
      "[○･｀Д´･○]"
      "ヽ(#`Д´)ﾉ"
      "Σ(-`Д´-ﾉ；)ﾉ"
      "(((p(>o<)q)))"
      "(/ﾟДﾟ)/"
      "(¬д¬。)"
      "ヽ(#`Д´)ﾉ"
      "(¬､¬)"
      "（；¬＿¬)"
      "(;¬_¬)"
      "(；¬д¬)"
      "(≧σ≦)"
      "o(-`д´- ｡)"
      "ヽ(●-`Д´-)ノ"
      "(*￣m￣)"
      "(´Д｀)"
      "(；￣Д￣）"
      "(¬_¬)ﾉ"
      "(＃｀д´)ﾉ"
      "(」゜ロ゜)」"
      "Σ(▼□▼メ)"
      "(━┳━ _ ━┳━)"
      "(┳◇┳)"
      "{{|└(>o< )┘|}}"
      "＼(＠O＠)／"
      "（≧▼≦；)"
      "＼(〇O〇)／"
      "s(・｀ヘ´・;)ゞ"
      "（▼へ▼メ）"
      "＼(`O´θ／"
      "θ＼(；￢_￢)"
      "ヽ(｀⌒´メ)ノ"
      "凸(-0-メ)"
      "凸(｀△´＋）"
      "凸(｀0´)凸"
      "凸(｀⌒´メ)凸"
      "＼(｀0´)／"
      "-`д´-"
      "(>人<)"
      "щ(ಠ益ಠщ)"
      "(ノಠ益ಠ)ノ"
      "щ(ಥДಥщ)"
      "o(≧o≦)o"
      "(⋋▂⋌)"
      "(◣_◢)"
      "ᕙ(⇀‸↼‶)ᕗ"
      "ᕦ(ò_óˇ)ᕤ"
      "( ಠ ಠ )"
      "(¬▂¬)"
      "(¬_¬)"
      "ಥ⌣ಥ"
      "ಠ_ಠ"))
    ("Apologizing Emoticons" .
     ("m(_ _)m"
      "m(._.)m"
      "ｍ（．＿．）ｍ"
      "（ﾉ´д｀）"
      "(シ_ _)シ"
      "<(_ _)>"
      "＜(。_。)＞"
      "ｍ（＿　＿；；ｍ"
      "m(￢0￢)m"))
    ("Bear Emoticons" .
     ("(￣(エ)￣)"
      "(｡･ω･｡)"
      "(●｀･(ｴ)･´●)"
      "(*ノ・ω・）"
      "川´･ω･`川"
      "( (ﾐ´ω`ﾐ))"
      "ヾ(T(エ)Tヽ)"
      "＼(・｀(ｪ)・)/"
      "⊂(ο･㉨･ο）⊃"
      "(^(エ)^)"
      "(^(I)^)"
      "(￣(ｴ)￣)ﾉ"
      "⊂(￣(工)￣)⊃"
      "⊂(^(工)^)⊃"
      "⊂(・(ェ)・)⊃"
      "(*￣(ｴ)￣*)"
      "ヾ(´(ｴ)｀ﾉﾞ"
      "(／(ｴ)＼)"
      "⊂(￣(ｴ)￣)⊃"
      "“(`(エ)´)ノ"
      "(｀(エ)´)ﾉ"
      "(ó㉨ò)"
      "(♥ó㉨ò)ﾉ♡"
      "(/-(ｴ)-＼)"
      "(´(エ)｀)"
      "ヽ(￣(ｴ)￣)ﾉ"
      "(／￣(ｴ)￣)／"
      "⊂(◎(工)◎)⊃"
      "(●￣(ｴ)￣●)"
      "《/(￣(ｴ)￣)ゞ》"
      "⁝⁞⁝⁞ʕु•̫͡•ʔु☂⁝⁞⁝⁝"
      "(✪㉨✪)"))
    ("Cat Emoticons" .
     ("(=^･ｪ･^=)"
      "(=^‥^=)"
      "(=^･^=)"
      "V(=^･ω･^=)v"
      "(=｀ω´=)"
      "o(^・x・^)o"
      "＼(=^‥^)/’`"
      "( =①ω①=)"
      "d(=^･ω･^=)b"
      "(=ＴェＴ=)"
      "(=;ェ;=)"
      "ヽ(=^･ω･^=)丿"
      "(=^･ω･^)y＝"
      "(^-人-^)"
      "ヽ(^‥^=ゞ)"
      "(^・ω・^ )"
      "(=^-ω-^=)"
      "b(=^‥^=)o"
      "(.=^・ェ・^=)"
      "（=´∇｀=）"
      "ヾ(=ﾟ･ﾟ=)ﾉ"
      "~(=^‥^)ノ"
      "~(=^‥^)/"
      "(=ｘェｘ=)"
      "(=；ェ；=)"
      "(=｀ェ´=)"
      "(^･o･^)ﾉ”"
      "(^._.^)ﾉ"
      "└(=^‥^=)┐"
      "=’①。①’="
      "<(*ΦωΦ*)>"))
    ("Confused Emoticons" .
     ("(´･_･`)"
      "(◎_◎;)"
      "(｀_´)ゞ"
      "(◎-◎；)"
      "(・_・ヾ"
      "(￣(エ)￣)ゞ"
      "(-_-)ゞ゛"
      "(‘◇’)?"
      "ヽ(゜Q。)ノ？"
      "(´｀;) ？"
      "【・ヘ・?】"
      "【・_・?】"
      "( ・◇・)？"
      "(゜-゜)"
      "ヾ(´･ ･｀｡)ノ”"
      "｢(ﾟﾍﾟ)"
      "( ?´_ゝ｀)"
      "o(´^｀)o"
      "(´−｀) ﾝｰ"
      "(」ﾟヘﾟ)」"
      "(•ิ_•ิ)?"
      "「(°ヘ°)"
      "(。ヘ°)"
      "ヽ(゜Q。)ノ？"
      "(´｀;) ？"
      "〈(゜。゜)"
      "(゜。゜)"
      "く（＾_・）ゝ"
      "(^～^;)ゞ"
      "٩(͡๏̯͡๏)۶"
      "٩(̾●̮̮̃̾•̃̾)۶"
      "(⊙_◎)"
      "ಠ_ರೃ"))
    ("Dancing Emoticons" .
     ("ヘ(^_^ヘ)"
      "(ノ^_^)ノ"
      "o(^^o)"
      "(o^^)o"
      "(ノ´＿ゝ｀）ノ"
      "ヾ(^ ^ゞ"
      "(ノ‥)ノ"
      "( ﾉ^ω^)ﾉﾟ"
      "ヾ(*´∇`)ﾉ"
      "ヾ(･ω･*)ﾉ"
      "(*ﾉ´□`)ﾉ"
      "。(⌒∇⌒。)"
      "(。⌒∇⌒)。"
      "〜(￣▽￣〜)"
      "(〜￣▽￣)〜"
      "〜(^∇^〜）"
      "（〜^∇^)〜"
      "〜(￣△￣〜)"
      "(〜￣△￣)〜"
      "┗(｀ー´)┓"
      "┏(｀ー´)┛"
      "┗(＾0＾)┓"
      "┏(＾0＾)┛"
      "(ノ￣ー￣)ノ"
      "ヘ(￣ー￣ヘ)"
      "ヘ(￣ω￣ヘ)"
      "(ノ￣ω￣)ノ"
      "ヘ(^o^ヘ)"
      "(ノ^o^)ノ"
      "ヾ(-_- )ゞ"
      "ヾ(＠^∇^＠)ノ"
      "(ﾉ≧∀≦)ﾉ"
      "＼(^ω^＼)"
      "(ﾉﾟ▽ﾟ)ﾉ"
      "ヽ(ﾟｰﾟ*ヽ)"
      "ヽ(*ﾟｰﾟ*)ﾉ"
      "(ﾉ*ﾟｰﾟ)ﾉ"
      "ヽ(*´Д｀*)ﾉ"
      "(o´･_･)っ"
      "ヾ(*д*)ﾉ゛"
      "ヽ(°◇° )ノ"
      "ヽ( °◇°)ノ"
      "(ノ°ο°)ノ"
      "(ﾉ･o･)ﾉ"
      "ヾ(^^ゞ)"
      "ヾ(ﾟ∀ﾟゞ)"
      "ヽ(´ー`)ﾉ"
      "ヾ（*⌒ヮ⌒*）ゞ"
      "〈( ^.^)ノ"
      "┌（★ｏ☆）┘"
      "└（★ｏ★）┐"
      "♪(┌・。・)┌"))
    ("Dead Emoticons" .
     ("（x_x；）"
      "(*_*)"
      "(×_×;）"
      "(×_×#"
      "(#+_+)"
      "(+_+)"
      "ヾ(×× ) ﾂ"
      "（Ω_Ω）"
      "へ（>_<へ)"
      "(＊0＊;)"
      "(u_u)"
      "(✖╭╮✖)"
      "(º_º)"
      "٩(×̯×)۶"
      "(ñ_ñ)"
      "(o_-)"))
    ("Defeat of Surrender Emoticons" .
     ("＼（－－）／"
      "＼(-___________-;)／"
      "/(;-_-)"
      "~(>_<。)＼"
      "((-_-))"
      "（ー△ー；）"
      "（◎ー◎；）"
      "(/ _ ; )"
      "(o_ _)o"
      "ﾍ(￣ ￣;ﾍ)"
      "(;*´Д`)ﾉ"
      "(ﾉ_ _)ﾉ"
      "ヘ(_ _ヘ)"
      "(ﾉ￣д￣)ﾉ"
      "(;-_-)ノ"
      "o(-_-;*)"
      "ﾍ(;´Д｀ﾍ)"
      "(;-_-)/"
      "(oT-T)尸"
      "ヘ（´ｏ｀）ヘ"
      "(一。一;;）"
      "(ノ#-_-)ノ"
      "（~～~）"
      "y-(~。~；)"
      "(　-。-)"))
    ("Dog Emoticons" .
     ("Uo･ｪ･oU"
      "∪･ω･∪"
      "U｡･ｪ･｡U"
      "▽・ω・▽"
      "▽・ｗ・▽"
      "Ｕ^皿^Ｕ"
      "ｖ・。・Ｖ"
      "ＵＴｪＴＵ"
      "(^・(I)・^)"
      "U・♀・U"
      "ｏ（Ｕ・ω・）⊃"
      "(^・x・^)"
      "(U・x・U)"
      "▼o・ェ・o▼"
      "U＾ェ＾U"
      "U￣ｰ￣U"
      "┌U･ｪ･U┘"
      "└@(･ｪ･)@┐"
      "ヾ(●ω●)ノ"
      "(〓￣(∵エ∵)￣〓)"))
    ("Evil, Plotting or Sneaky Emoticons" .
     ("(・｀ω´・)"
      "ψ(｀∇´)ψ"
      "（｀ー´）"
      "(｡･｀ω´･｡)"
      "o(｀ω´*)o"
      "| ｀Д´|"
      "(｀ε´)"
      "(σ-`д･´)"
      "(｀Д´*)"
      "（=｀〜´=）"
      "(ﾒ｀ﾛ´)/"
      "Ψ(｀▽´)Ψ"
      "^(#｀∀´)_Ψ"
      "(*-`ω´- )人"
      "(ц｀ω´ц*)"
      "(｀∀´)Ψ"
      "ψ(*｀ー´)ψ"
      "Ψ(｀◇´)Ψ"
      "“ψ(｀∇´)ψ"))
    ("Friends Emoticons" .
     ("ヽ(∀゜ )人( ゜∀)ノ"
      "(*･∀･)／＼(･∀･*)"
      "＼（＾∀＾）メ（＾∀＾）ノ"
      "＼（★´−｀）人（´▽｀★）／"
      "（　＾＾）人（＾＾　）"
      "(〃⌒▽⌒)八(〃⌒▽⌒〃)八(⌒▽⌒〃)"
      "☆-(ノﾟДﾟ)八(ﾟДﾟ )ノ"
      "( ｡･_･｡)人(｡･_･｡ )"
      "ヽ(*^ｰ^)人(^ｰ^*)ノ"
      "━(○´ｴ｀)(´ｴ｀●)━"
      "(◎｀・ω・´)人(´・ω・｀*)"
      "｡*:★(´・ω・人・ω・`)｡:゜★｡"
      "(*´∀｀*人*´∀｀*)"
      "（＾▽＾）／＼（＾▽＾）"
      "（*＾ω＾）人（＾ω＾*）"
      "ヽ(○´∀)乂(*´∀`*）乂(∀`●)"
      "＼（＾∀＾）メ（＾∀＾）ノ"
      "ヽ(´Д｀)人(´Д｀)人(´Д｀)ノ〜♪"
      "(((*°▽°*)八(*°▽°*)))♪"
      "♡(*´∀｀*)人(*´∀｀*)♡"
      "(〃￣д￣)八( ￣д￣ )八(￣д￣〃)"
      "ヽ(＾▽＾)人(＾▽＾)人(＾▽＾)ﾉ"
      "(((＠°▽°＠)八(＠°▽°＠)))"
      "(･_･”)/＼(･_･”)"
      "(○｀ε´○)／＼(○｀ε´○)"
      "ヘ( ^o^)ノ＼(^_^ )"
      "(/^-^(^ ^*)/"
      "( 。・_・。)人(。・_・。 )"
      "(・_・)〆＼(Ｔ＿Ｔ）"
      "(^^)-(^^)-(^^)-(^^)-(^^)"
      "ヽ(´Д｀)人(´Д｀)人(´Д｀)ノ"
      "ヾ(￣ー￣)X(^∇^)ゞ"
      "♪ヽ( ⌒o⌒)人(⌒-⌒ )v ♪"
      "(*^o^)人(^o^*)"
      "＼(　^o)( ^ 0 ^ )(o^　)／"
      "ヽ（　＾＾）人（＾＾　）ノ"
      "(・_・”)／＼(・_・”)"
      "└(^o^ )Ｘ( ^o^)┘"
      "(＾○＾)オ(＾▽＾)ハ(＾０＾)ツ～"
      "( ⌒o⌒)人(⌒-⌒ )v"
      "(°◇°人°◇°)"))
    ("Greetings or Goodbyes Emoticons" .
     ("ヾ(＾∇＾)"
      "(^-^*)/"
      "( ﾟ▽ﾟ)/"
      "( ^_^)／"
      "(^o^)/"
      "(^ _ ^)/"
      "( ´ ▽ ` )ﾉ"
      "(ﾉ´∀｀*)ﾉ"
      "ヾ(´･ω･｀)"
      "☆ﾐ(o*･ω･)ﾉ"
      "＼(＾▽＾*)"
      "(*＾▽＾)／"
      "(￣▽￣)ノ"
      "ヾ(-_-;)"
      "ヾ( ‘ – ‘*)"
      "ヾ(＠⌒ー⌒＠)ノ"
      "~ヾ ＾∇＾"
      "~ヾ(＾∇＾)"
      "＼(￣O￣)"
      "(｡･ω･)ﾉﾞ"
      "(*^･ｪ･)ﾉ"
      "(￣∠ ￣ )ﾉ"
      "(*￣Ｏ￣)ノ"
      "ヾ(｡´･_●･`｡)☆"
      "(/・0・)"
      "(ノ^∇^)"
      "(,, ･∀･)ﾉ゛"
      "(。･д･)ﾉﾞ"
      "＼(°o°；）"
      "(｡´∀｀)ﾉ"
      "(o´ω`o)ﾉ"
      "( ･ω･)ﾉ"
      "(。^_・)ノ"
      "( ・_・)ノ"
      "＼(-o- )"
      "(。-ω-)ﾉ"
      "＼(-_- )"
      "＼( ･_･)"
      "ヾ(´￢｀)ﾉ"
      "ヾ(☆▽☆)"
      "(^ Q ^)/゛"
      "~(＾◇^)/"
      "ヘ(‘◇’、)/"
      "ヘ(°◇、°)ノ"
      "ヘ(°￢°)ノ"
      "ヘ(゜Д、゜)ノ"
      "（ ゜ρ゜)ノ"
      "ー( ´ ▽ ` )ﾉ"
      "ヽ(๏∀๏ )ﾉ"))
    ("Happy or Joyful Emoticons" .
     ("(●´∀｀●)"
      "ヽ (＾▽＾) ﾉ"
      "(｀・ω・´)”"
      "ヽ(；▽；)ノ"
      "ヽ(；▽；)ノ"
      "(*´・ｖ・)"
      "(((o(*ﾟ▽ﾟ*)o)))"
      "☆*:.｡. o(≧▽≦)o .｡.:*☆"
      "(⌒▽⌒)☆"
      "⊂((・▽・))⊃"
      "(≧∇≦)/"
      "(´∇ﾉ｀*)ノ"
      "（・◇・）"
      "( ´ ▽ ` )ﾉ"
      "（＾_＾）"
      "（￣ー￣）"
      "(*^▽^*)"
      "(＾▽＾)"
      "（’-’*)"
      "∩( ・ω・)∩"
      "(*≧▽≦)"
      "＼（＾ ＾）／"
      "Ｏ(≧∇≦)Ｏ"
      "（　´∀｀）"
      "(^～^)"
      "＼（＠￣∇￣＠）／"
      "(☆^O^☆)"
      "(★^O^★)"
      "(☆^ー^☆)"
      "(´ω｀★)"
      "＼（Ｔ∇Ｔ）／"
      "ヽ(*≧ω≦)ﾉ"
      "*(*´∀｀*)☆"
      "Ｏ(≧▽≦)Ｏ"
      "ヽ(*⌒∇⌒*)ﾉ"
      "d=(´▽｀)=b"
      "＼(*T▽T*)／"
      "ヽ(‘ ∇‘ )ノ"
      "（*＾ワ＾*）"
      "ヽ(＾Д＾)ﾉ"
      "(´∀`)"
      "(°◇°;)"
      "(゜▽゜;)"
      "(/^▽^)/"
      "(ﾉ´ｰ`)ﾉ"
      "ヽ(´ー`)ﾉ"
      "(　＾∇＾)"
      "＼( ｀.∀´)／"
      "(●⌒∇⌒●)"
      "o(≧∇≦o)"
      "ヽ(｀◇´)/"
      "ヽ(*・ω・)ﾉ"
      "（＾ω＾）"
      "｡◕‿◕｡"
      "⊙ω⊙"
      "⊙△⊙"
      "⊙▽⊙"
      "o (◡‿◡✿)"
      "(◕‿◕✿)"
      "(∩_∩)"
      "｡◕‿◕｡"
      "(•ิ_•ิ)"
      "(/•ิ_•ิ)/"
      "（ΦωΦ）"
      "（*＾＾*)"
      "（＾⊆＾）"
      "(-^〇^-)"
      "(ノ*゜▽゜*)"
      "ヾ(´▽｀;)ゝ"
      "(゜▼゜＊）"
      "(￣个￣)"
      "＼(^▽^＠)ノ"
      "(“⌒∇⌒”)"
      "へ(゜∇、°)へ"
      "（-＾〇＾-）"
      "（＞ｙ＜）"
      "ヽ(^。^)丿"
      "(ヘ。ヘ)"
      "（＾ｖ＾）"
      "ヾ(@^▽^@)ノ"
      "ヾ(@°▽°@)ノ"
      "ヾ（＠＾▽＾＠）ノ"
      "ヾ(＠^∇^＠)ノ"
      "o((*^▽^*))o"
      "ヾ(@゜∇゜@)ノ"
      "ヾ(＠゜▽゜＠）ノ"
      "（＠´＿｀＠）"
      "ヾ(＠† ▽ †＠）ノ"
      "(ノ＞▽＜。)ノ"
      "＼（＠；◇；＠）／"
      "＼(☆o◎)／"
      "(((＼（＠v＠）／)))"
      "(°◇°;)"
      "(゜▽゜;)"
      "(o;TωT)o"
      "ヽ(;^o^ヽ)"
      "（⌒▽⌒ゞ"
      "“ヽ(´▽｀)ノ”"
      "(((o(*ﾟ▽ﾟ*)o)))"
      "ヾ(＠⌒ー⌒＠)ノ"
      "Ψ(´▽｀)Ψ"
      "（ｖ＾＿＾）ｖ"
      "(ી(΄◞ิ౪◟ิ‵)ʃ)♥"
      "(❁´◡`❁)*✲ﾟ*"
      "(ღ˘⌣˘ღ) ♫･*:.｡. .｡.:*･"
      "ლ(╹◡╹ლ)"
      "(✿◠‿◠)"
      "(◑‿◐)"
      "ლ(́◉◞౪◟◉‵ლ)"
      "✖‿✖"
      "(*~▽~)"
      "(─‿‿─)"
      "∩(︶▽︶)∩"
      "(︶ω︶)"
      "(∩▂∩)"
      "(¬‿¬)"
      "(n˘v˘•)¬"
      "ಥ‿ಥ"
      "≖‿≖"
      "ʘ‿ʘ"))
    ("Hiding Emoticons" .
     ("|･ω･｀)"
      "ﾍ(･_|"
      "｜−・;）"
      "|ω・）"
      "|_・)"))
    ("Infatuation or in Love Emoticons" .
     ("(´∀｀)♡"
      "(‘∀’●)♡"
      "（*´▽｀*）"
      "(*°∀°)=3"
      "（´ω｀♡%）"
      "ヽ(愛´∀｀愛)ノ"
      "♡o｡.(✿ฺ｡ ✿ฺ)"
      "(｡･ω･｡)ﾉ♡"
      "（●´∀｀）ノ♡"
      "♡＾▽＾♡"
      "(｡-_-｡ )人( ｡-_-｡)"
      "(●♡∀♡)"
      "（＿´ω｀）"
      "(´ ▽｀).。ｏ♡"
      "(o⌒．⌒o)"
      "（人´∀`*）"
      "（〃・・〃）"
      "♥（ﾉ´∀`）"
      "(ღ˘⌣˘ღ)"
      "(｡’▽’｡)♡"
      "(●´□`)♡"
      "(｡♥‿♥｡)"
      "(✿ ♥‿♥)"
      "♥╣[-_-]╠♥"))
    ("Laughing Emoticons" .
     ("（・∀・）"
      "（　´∀｀）"
      "（⌒▽⌒）"
      "（＾ｖ＾）"
      "(*≧▽≦)ﾉｼ))"
      "(●´艸`)"
      "(*´艸`*)"
      "(｡ >艸<)"
      "(*≧艸≦)"
      "(*・艸・)"))
    ("Mellow or Whatever Emoticons" .
     ("ヽ（´ー｀）┌"
      "┗┐ヽ(′Д、`*)ﾉ┌┛"
      "ヽ( ´¬`)ノ"
      "┗┃・ ■ ・┃┛"
      "ヾ(´A｀)ノﾟ"
      "ヽ（・＿・；)ノ"
      "ヽ(　￣д￣;)ノ"
      "＼（〇_ｏ）／"
      "ヽ(。_°)ノ"
      "＼(;´□｀)/"
      "ヾ(*´ー`)ノ"
      "ヽ(‘ー`)ノ"
      "ヽ(ー_ー )ノ"
      "ヽ(´～｀；）"
      "┐(‘～`；)┌"
      "ヽ（*ω。）ノ"
      "(;´・`)>"
      "（＾～＾）"
      "╮(─▽─)╭"
      "¯\_(ツ)_/¯"
      "٩(-̮̮̃-̃)۶"
      "٩(-̮̮̃•̃)۶"))
    ("Miscellaneous Animal Emoticons" .
     ("(=ﾟωﾟ)ﾉ"
      "(○’ω’○)"
      "[´・ω・`]"
      "ヾ(｡･ω･｡)"
      "(´-ω-｀)"
      "(*･ω･)"
      "(*-ω-)"
      "┗(･ω･;)┛"
      "｛・ω-*}"
      "(* >ω<)"
      "ヾ(ｏ･ω･)ﾉ"
      "w(´･ω･`)w"
      "(´・ω・`)"
      "(・ω・；)"
      "Σ(・ω・`|||)"
      "ヾ(・ω・ｏ)"
      "(´o・┏ω┓・o｀)"
      "ヽ(･ω･｡)ﾉ"
      "(ﾉ･ω･)ﾉﾞ"
      "ヽ(･ω･ゞ)"
      "ヾ(･ω･`｡)"
      "(。-`ω´-)"))
    ("Miscellaneous Japanese Emoticons" .
     ("(´Д` )"
      "・゜・(ノД`)"
      "ヽ(´Д｀ヽ"
      "（ゝ。∂）"
      "(-_＼)"
      "( 　ﾟ,_ゝﾟ)"
      "ヽ(･∀･)ﾉ"
      "ヽ(*´Д｀*)ﾉ"
      "v(｡-_-｡)v"
      "（＾凹＾）"
      "(　ﾟдﾟ)"
      "(/・・)ノ"
      "(ﾉ･ｪ･)ﾉ"
      "＼(ﾟｰﾟ＼)"
      "o(‧”’‧)"
      "(◕〝◕)"
      "( c//”-}{-*\x)"
      "(◐ o ◑ )"
      "（;´_ヘ;）"
      "（πーπ）"
      "w(@。@;)w"
      "＼(●o○;)ノ"
      "(V)o\o;;(V)"
      "（＄０＄）"
      "（ｏ。ｏ；）"
      "ヘ（゜◇、゜）ノ"
      "☆⌒(*＾-°)v"
      "☆⌒（＊＾∇゜）v"
      "m{oYo}屮"
      "*~●＞＾）"
      "━━☆＞＾）"
      "（´・｀ ）"
      "(^ц^ )"
      "【:εω"
      "(๑ ऀืົཽ₍₍ළ₎₎ ऀืົཽ)✧"
      "‹(•¿•)›"
      "(⊙ヮ⊙)"
      "( °٢° )"
      "( 　ﾟ,_ゝﾟ)"))))


;; Keybindings

(define-key erc-mode-map (kbd "C-c e") 'erc-insert-emoticon)


;;; init-erc.el ends here
