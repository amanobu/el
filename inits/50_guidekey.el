(require 'guide-key)
;(setq guide-key/guide-key-sequence '("C-x r" "C-c"))
(setq guide-key/guide-key-sequence '("C-x" "C-x 4" "C-x 5" "C-x n" "C-x r" "C-c"))
(setq guide-key/idle-delay 0.5)
(setq guide-key/highlight-command-regexp "rectangle")
(setq guide-key/popup-window-position 'bottom);下に表示
(guide-key-mode 1)  ; guide-key-mode を有効にする
