(require 'anything)
(autoload 'id-manager "id-manager" nil t)
(setq epa-file-select-keys 'silent)
(setq epa-file-cache-passphrase-for-symmetric-encryption t)
(setenv "GPG_AGENT_INFO" nil)
;;これを評価すると暗号化される
(setq idm-database-file "~/.idm-db.gpg")
;;これは平文で保存される
;;(setq idm-database-file "~/.idm-db.test")
