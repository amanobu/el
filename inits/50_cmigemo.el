;;cmigemo ローマ字のまま日本語をインクリメンタルサーチする
(add-to-list 'load-path "~/.emacs.d/cmigemo/")
(setq migemo-command "cmigemo")
;(setq migemo-command "~/.emacs.d/cmigemo/cmigemo")
;;(setq migemo-options '("--emacs" "-i" "\g"))
;;(setq migemo-options '("-q" "--emacs" "-i" "\g"))
;;(setq migemo-options '("-q" "--emacs" "-i"))
(setq migemo-options '("-q" "--emacs"))
;(setq migemo-options '("-q" "--emacs" "-i" "\a"))

;; migemo-dictのパスを指定
(setq migemo-dictionary (expand-file-name "~/.emacs.d/cmigemo/dict/utf-8/migemo-dict"))
;(setq migemo-dictionary (expand-file-name "~/.emacs.d/cmigemo/dict/cp932/migemo-dict"))
(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
;; キャッシュ機能を利用する
(setq migemo-use-pattern-alist t)
(setq migemo-use-frequent-pattern-alist t)
(setq migemo-pattern-alist-length 1024)
;; 辞書の文字コードを指定．
;(setq migemo-coding-system 'euc-jp-unix)
;(setq migemo-coding-system 'shift-jis)
(setq migemo-coding-system 'utf-8-unix)
;; 起動時に初期化も行う
(load-library "migemo")
(migemo-init)

