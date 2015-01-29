(require 'web-mode)
;; *.phtml, *.html, *.htm, *.tpl.php, *.jsp, *.ascx, *.aspx, *.erb
(add-to-list 'auto-mode-alist '("\\.p?html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;; ‚È‚º‚©C-;‚ÉC-c C-;‚Æ“¯‚¶‹@”\‚ªŠ„‚è“–‚Ä‚ç‚ê‚Ä‚é‚Ì‚Åíœ‚·‚é
(define-key web-mode-map (kbd "C-;") nil)

(require 'zencoding-mode)
(require 'yasnippet)
(add-hook 'web-mode-hook 'zencoding-mode)
(eval-after-load "zencoding-mode"
  '(define-key zencoding-mode-keymap (kbd "C-<return>") 'zencoding-expand-yas))
