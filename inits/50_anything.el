;;anything
(require 'anything-startup)
;anything-c-moccur.el�Ɠ����̋@�\
(require 'anything-config)
(require 'anything-migemo)
(defun anything-occur-x ()
  (interactive)
  (anything :sources 'anything-c-source-occur
            :buffer "*anything occur*"
            :candidate-number-limit nil))
;;keymap.el�Ɉړ�
;;(define-key isearch-mode-map (kbd "C-o") 'anything-occur-x)
;;help��anything
(require 'descbinds-anything)
(descbinds-anything-install)
