;�g��Ȃ�buffer�������폜
;M-x install-elisp-from-emacswiki tempbuf.el
(require 'tempbuf)
;file���J�����玩���I��tempbuf��L���ɂ���
;(add-hook 'find-file-hooks 'turn-on-tempbuf-mode)
;diredbuffer�ɑ΂���tempbuf��L���ɂ���
(add-hook 'dired-mode-hook 'turn-on-tempbuf-mode)

