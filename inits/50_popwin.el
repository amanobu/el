;;����ɊJ��buffer��C-g�⑼window�I���ŕ���
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
;anything��popup
(setq anything-samewindow nil)
(push '("*anything*" :height 10) popwin:special-display-config)
;dired��popup
;(push '(dired-mode :position bottom) popwin:special-display-config)
;���l��auto-async-byte-compile���Bnoselect t������ƃt�H�[�J�X���ڂ�Ȃ�
(push '(" *auto-async-byte-compile*" :height 14 :position bottom :noselect t) popwin:special-display-config)
(push '("*anything file list*" :height 10) popwin:special-display-config)

