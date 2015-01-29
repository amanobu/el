;;ファイル名がかぶったときのbufferを見やすく
(require 'uniquify)
;file<dir>形式
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
;* *などは無視
(setq uniquify-ignore-buffers-re "*[^*]+*")
