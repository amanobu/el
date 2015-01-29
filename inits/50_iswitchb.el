;;バッファ切り替え強化
(iswitchb-mode 1)
;バッファ読み取り関数をiswitchbにする
(setq read-buffer-function 'iswitchb-read-buffer)
;部分文字列じゃなく正規表現を使うならtにする
(setq iswitchb-regexp nil)
;新しいバッファを作成するときいちいち聞かない
(setq iswitchb-prompt-newbuffer nil)
