;;grep�֌W��el

;lgrep���C�C�J���W�Ɏg�����߂�
(setq grep-use-null-device nil)
(setq grep-command "lgrep -Ku8 -Ou8 -n '' {*,.*}")

(require 'igrep)
(igrep-define lgrep (igrep-use-zgrep nil)(igrep-regex-option "-n -Ou8"))
(igrep-find-define lgrep (igrep-use-zgrep nil)(igrep-regex-option "-n -Ou8"))

;;grep�̌������ʂ�ҏW
;C-c C-e:�ύX�𔽉f
;C-c- C-r ���[�W�����̕ύX�_��j��
;C-c C-u �S�ύX�_��j��
(require 'grep-edit)

(require 'wgrep)
(setq wgrep-enable-key "r")