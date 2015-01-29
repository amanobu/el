;redoをやりやすくする
;通常undoしすぎた場合C-fなどのbufferを変更しないコマンドをはさめば逆方向に戻るが、やりにくい
;M-x install-elisp-from-emacswiki redo+.el
(require 'redo+)

;;keymap.elに移動
;;(global-set-key (kbd "C-M-_") 'redo)

(setq undo-no-redo t);過去のundoがredoされないように
(setq undo-limit 600000)
(setq undo-strong-limit 900000)
