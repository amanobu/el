;;勝手に開くbufferをC-gや他window選択で閉じる
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
;anythingをpopup
(setq anything-samewindow nil)
(push '("*anything*" :height 10) popwin:special-display-config)
;diredをpopup
;(push '(dired-mode :position bottom) popwin:special-display-config)
;同様にauto-async-byte-compileも。noselect tを入れるとフォーカスが移らない
(push '(" *auto-async-byte-compile*" :height 14 :position bottom :noselect t) popwin:special-display-config)
(push '("*anything file list*" :height 10) popwin:special-display-config)

