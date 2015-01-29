(require 'init-loader-x "~/.emacs.d/auto-install/init-loader-x")
;起動時のログバッファは起動しない。見るならばM-x init-loader-show-logで
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits/")
