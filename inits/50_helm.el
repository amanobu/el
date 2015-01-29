(require 'helm-config)
;(require 'helm-ag)
;(require 'helm-descbinds)

;(helm-descbinds-mode)

(global-set-key (kbd "C-;") 'helm-mini)
(global-set-key (kbd "C-c h") 'helm-mini)
;(global-set-key (kbd "C-c b") 'helm-descbinds)
(global-set-key (kbd "C-c o") 'helm-occur)
;(global-set-key (kbd "C-c s") 'helm-ag)
(global-set-key (kbd "C-c y") 'helm-show-kill-ring)
