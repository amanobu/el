;キーボードマクロ
;<f3>、実際に操作、<f4>で記録
;<f4>でその実行
;キーボードマクロのコマンド化
;M-x kmacro-saveでinit.elの最後に追加される
(defvar kmacro-save-file "~/.emacs.d/inits/50_keybordmacro.el");マクロを保存する先
(defun kmacro-save (symbol)
  (interactive "SName from last kbd macro: ");定義するコマンドを名入力
  (name-last-kbd-macro symbol)
  (with-current-buffer (find-file-noselect kmacro-save-file)
    (goto-char (point-max))
    (insert-kbd-macro symbol)
    (basic-save-buffer)))
