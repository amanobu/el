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
;; anything-complete.elを使っているなら yas/completing-prompt のみでもよい
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
;; いろいろな情報源を使いたいならば (ac-config-default) にする
;;(setq-default ac-sources '(ac-source-yasnippet))
;;(setq-default ac-sources '(ac-config-default))
;;(global-auto-complete-mode 1)
