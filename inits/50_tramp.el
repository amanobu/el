;;tramp�̐ݒ�
(require 'tramp)
(setq tramp-default-method "plink")
(setq tramp-shell-prompt-pattern "^[ $]+")
;;�ȉ���cygwin��ssh���g���ݒ�͂��܂������Ȃ��E�E�E
;(setq-default tramp-default-method "sshx")
;(setq-default tramp-completion-without-shell-p t)
;(setq-default tramp-shell-prompt-pattern "^[ $]+")(setq-default tramp-debug-buffer t)
;(modify-coding-system-alist 'process "ssh" 'utf-8-unix) 

