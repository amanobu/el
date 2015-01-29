;使わないbufferを自動削除
;M-x install-elisp-from-emacswiki tempbuf.el
(require 'tempbuf)
;fileを開いたら自動的にtempbufを有効にする
;(add-hook 'find-file-hooks 'turn-on-tempbuf-mode)
;diredbufferに対してtempbufを有効にする
(add-hook 'dired-mode-hook 'turn-on-tempbuf-mode)

