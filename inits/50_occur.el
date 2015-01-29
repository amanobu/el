;;M-x occurの代替
;M-c occurから乗り換えても
;M-x moccurでall buffer search
(require 'color-moccur)
;SPCで区切られた複数単語にマッチ
(setq moccur-split-word t)
;;color-moccurの結果から編集する
(require 'moccur-edit)

