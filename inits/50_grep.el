;;grep関係のel

;lgrepをイイカンジに使うために
(setq grep-use-null-device nil)
(setq grep-command "lgrep -Ku8 -Ou8 -n '' {*,.*}")

(require 'igrep)
(igrep-define lgrep (igrep-use-zgrep nil)(igrep-regex-option "-n -Ou8"))
(igrep-find-define lgrep (igrep-use-zgrep nil)(igrep-regex-option "-n -Ou8"))

;;grepの検索結果を編集
;C-c C-e:変更を反映
;C-c- C-r リージョンの変更点を破棄
;C-c C-u 全変更点を破棄
(require 'grep-edit)

(require 'wgrep)
(setq wgrep-enable-key "r")