;;trampの設定
(require 'tramp)
(setq tramp-default-method "plink")
(setq tramp-shell-prompt-pattern "^[ $]+")
;;以下のcygwinのsshを使う設定はうまくいかない・・・
;(setq-default tramp-default-method "sshx")
;(setq-default tramp-completion-without-shell-p t)
;(setq-default tramp-shell-prompt-pattern "^[ $]+")(setq-default tramp-debug-buffer t)
;(modify-coding-system-alist 'process "ssh" 'utf-8-unix) 

