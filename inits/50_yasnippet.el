;; ;;yasnippet
;; (add-to-list 'load-path "~/.emacs.d/yasnippet-0.6.1c/")
;; (require 'yasnippet) ;; not yasnippet-bundle
;; (yas/initialize)
;; (yas/load-directory "~/.emacs.d/yasnippet-0.6.1c/snippets")

;;; yasnippet
(require 'yasnippet-config)
(require 'dropdown-list)
(yas/global-mode 1)
(call-interactively 'yas/reload-all)    ;workaround
;; anything-complete.el‚ğg‚Á‚Ä‚¢‚é‚È‚ç yas/completing-prompt ‚Ì‚İ‚Å‚à‚æ‚¢
(setq yas/prompt-functions
      '(yas/dropdown-prompt yas/completing-prompt yas/ido-prompt yas/no-prompt))
;;; with anything
(require 'anything)
(require 'anything-c-yasnippet-2)

;;; with auto-complete
;; (add-to-list 'load-path "~/.emacs.d/auto-complete/")
;; (add-to-list 'load-path "~/.emacs.d/popup-el/")
;; (add-to-list 'load-path "~/.emacs.d/fuzzy-el//")
;(require 'auto-complete-config)
(yas/set-ac-modes)
(yas/enable-emacs-lisp-paren-hack)
;; ‚¢‚ë‚¢‚ë‚Èî•ñŒ¹‚ğg‚¢‚½‚¢‚È‚ç‚Î (ac-config-default) ‚É‚·‚é
;;(setq-default ac-sources '(ac-source-yasnippet))
;;(setq-default ac-sources '(ac-config-default))
;;(global-auto-complete-mode 1)
