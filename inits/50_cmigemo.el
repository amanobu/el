;;cmigemo ���[�}���̂܂ܓ��{����C���N�������^���T�[�`����
(add-to-list 'load-path "~/.emacs.d/cmigemo/")
(setq migemo-command "cmigemo")
;(setq migemo-command "~/.emacs.d/cmigemo/cmigemo")
;;(setq migemo-options '("--emacs" "-i" "\g"))
;;(setq migemo-options '("-q" "--emacs" "-i" "\g"))
;;(setq migemo-options '("-q" "--emacs" "-i"))
(setq migemo-options '("-q" "--emacs"))
;(setq migemo-options '("-q" "--emacs" "-i" "\a"))

;; migemo-dict�̃p�X���w��
(setq migemo-dictionary (expand-file-name "~/.emacs.d/cmigemo/dict/utf-8/migemo-dict"))
;(setq migemo-dictionary (expand-file-name "~/.emacs.d/cmigemo/dict/cp932/migemo-dict"))
(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
;; �L���b�V���@�\�𗘗p����
(setq migemo-use-pattern-alist t)
(setq migemo-use-frequent-pattern-alist t)
(setq migemo-pattern-alist-length 1024)
;; �����̕����R�[�h���w��D
;(setq migemo-coding-system 'euc-jp-unix)
;(setq migemo-coding-system 'shift-jis)
(setq migemo-coding-system 'utf-8-unix)
;; �N�����ɏ��������s��
(load-library "migemo")
(migemo-init)

