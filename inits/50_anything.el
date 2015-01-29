;;anything
(require 'anything-startup)
;anything-c-moccur.el‚Æ“¯“™‚Ì‹@”\
(require 'anything-config)
(require 'anything-migemo)
(defun anything-occur-x ()
  (interactive)
  (anything :sources 'anything-c-source-occur
            :buffer "*anything occur*"
            :candidate-number-limit nil))
;;keymap.el‚ÉˆÚ“®
;;(define-key isearch-mode-map (kbd "C-o") 'anything-occur-x)
;;help‚àanything
(require 'descbinds-anything)
(descbinds-anything-install)
