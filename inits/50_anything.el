;;anything
(require 'anything-startup)
;anything-c-moccur.elと同等の機能
(require 'anything-config)
(require 'anything-migemo)
(defun anything-occur-x ()
  (interactive)
  (anything :sources 'anything-c-source-occur
            :buffer "*anything occur*"
            :candidate-number-limit nil))
;;keymap.elに移動
;;(define-key isearch-mode-map (kbd "C-o") 'anything-occur-x)
;;helpもanything
(require 'descbinds-anything)
(descbinds-anything-install)
