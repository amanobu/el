;redo�����₷������
;�ʏ�undo���������ꍇC-f�Ȃǂ�buffer��ύX���Ȃ��R�}���h���͂��߂΋t�����ɖ߂邪�A���ɂ���
;M-x install-elisp-from-emacswiki redo+.el
(require 'redo+)

;;keymap.el�Ɉړ�
;;(global-set-key (kbd "C-M-_") 'redo)

(setq undo-no-redo t);�ߋ���undo��redo����Ȃ��悤��
(setq undo-limit 600000)
(setq undo-strong-limit 900000)
