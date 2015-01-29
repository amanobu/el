;;view-mode
;C-x C-rで読み込み専用
;(setq view-read-only t)
;view-modeをどこかのキーに割り当てた方がいい
;view-modeでE,Q,qでモードを抜ける



;;書き込み不能fileはview-modeから抜けないようにする
(require 'viewer)
;そしてview-modeの時目立つように
(setq viewer-modeline-color-unwritable "tomato")
(setq viewer-modeline-color-view "orange")
(viewer-change-modeline-color-setup)
;特定のファイルは全てview-modeで開く。パスも含むよ
(setq view-mode-by-default-regexp "\\.txt\\|\\.jsp\\|\\.java\\|\\.htm\\|\\.sh")
;(setq view-mode-by-default-regexp "\\.txt")
;(setq view-mode-by-default-regexp "\\.emacs")
; (setq view-mode-by-default-regexp "\\.jsp")
; (setq view-mode-by-default-regexp "\\.java")
(viewer-stay-in-setup)
;;view-modeのkeybindをvim形式にする
(setq pager-keybind
      `( ;; vi-like
	("h" . backward-char)
	("l" . forward-char)
	("j" . next-line)
	("k" . previous-line)
	("b" . scroll-down)
	(" " . scroll-up)
	("w" . forward-word)
	("e" . backward-word)
	("J" . ,(lambda () (interactive) (scroll-up 1)))
	("K" . ,(lambda () (interactive) (scroll-down 1)))
	))
(defun define-many-keys (keymap key-table &optional includes)
  (let (key cmd)
    (dolist (key-cmd key-table)
      (setq key (car key-cmd)
	    cmd (cdr key-cmd))
      (if (or (not includes) (member key includes))
          (define-key keymap key cmd))))
  keymap)
(defun view-mode-hook--pager ()
  (define-many-keys view-mode-map pager-keybind))
(add-hook 'view-mode-hook 'view-mode-hook--pager)
