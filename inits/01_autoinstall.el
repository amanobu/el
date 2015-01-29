;;;auto-install
(add-to-list 'load-path "~/.emacs.d/auto-install/")
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")
;;install-elisp.el互換もーどにする
(auto-install-compatibility-setup)
;;ediff関連のバッファを１つのフレームにまとめる
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
;;起動時に毎回updateしなくてもと言うことでコメントアウト
;;起動時にEmacsWikiのページ名を補完候補に加える
;(auto-install-update-emacswiki-package-name t)
