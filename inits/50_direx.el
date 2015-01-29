(require 'direx)

;;keymap.elに移動
;;(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)

;; direx:direx-modeのバッファをウィンドウ左辺に幅25でポップアップ
;; :dedicatedにtを指定することで、direxウィンドウ内でのバッファの切り替えが
;; ポップアップ前のウィンドウに移譲される
(push '(direx:direx-mode :position left :width 25 :dedicated t)
      popwin:special-display-config)

(setq direx:leaf-icon "  "
      direx:open-icon "▾ "
      direx:closed-icon "▸ ")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; キー 	コマンド 	説明						   ;;
;; n, C-n, <down> 	direx:next-node 	次のノードを選択する		   ;;
;; p, C-p, <up> 	direx:previous-node 	前のノードを選択する		   ;;
;; C-M-n, C-M-<down> 	direx:next-sibling 	次の兄弟ノードを選択する	   ;;
;; C-M-p, C-M-<up> 	direx:previous-sibling 	前の兄弟ノードを選択する	   ;;
;; ^, C-M-u, C-M-<left> 	direx:up-node 	親ノードを選択する		   ;;
;; C-M-d, C-M-<right> 	direx:down-node 	最初の子ノードを選択する	   ;;
;; f 	direx:find-node 	そのノードを現在のウィンドウに開く		   ;;
;; o 	direx:find-node-other-window 	そのノードを別のウィンドウに開く	   ;;
;; RET 	direx:maybe-find-node 	そのノードをトグルする				   ;;
;; q 	quit-window 	ウィンドウを閉じる					   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
