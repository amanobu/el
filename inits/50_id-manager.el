(require 'anything)
(autoload 'id-manager "id-manager" nil t)
(setq epa-file-select-keys 'silent)
(setq epa-file-cache-passphrase-for-symmetric-encryption t)
(setenv "GPG_AGENT_INFO" nil)
;;�����]������ƈÍ��������
(setq idm-database-file "~/.idm-db.gpg")
;;����͕����ŕۑ������
;;(setq idm-database-file "~/.idm-db.test")
