;;矩形マウス選択
(define-key ctl-x-map "r\C-@" 'rm-set-mark)
(define-key ctl-x-map [?r ?\C-\ ] 'rm-set-mark)
(define-key ctl-x-map "r\C-x" 'rm-exchange-point-and-mark)
(define-key ctl-x-map "r\C-w" 'rm-kill-region)
(define-key ctl-x-map "r\M-w" 'rm-kill-ring-save)
(define-key global-map [S-down-mouse-1] 'rm-mouse-drag-region)
(autoload 'rm-set-mark "rect-mark"
  "Set mark for rectangle." t)
(autoload 'rm-exchange-point-and-mark "rect-mark"
  "Exchange point and mark for rectangle." t)
(autoload 'rm-kill-region "rect-mark"
  "Kill a rectangular region and save it in the kill ring." t)
(autoload 'rm-kill-ring-save "rect-mark"
  "Copy a rectangular region to the kill ring." t)
(autoload 'rm-mouse-drag-region "rect-mark"
  "Drag out a rectangular region with the mouse." t)

;; キーワードのカラー表示を有効化
(global-font-lock-mode t)

;; 対応するカッコをハイライト
(show-paren-mode 1)

;; 余計なものを表示しない
(when window-system
  (tool-bar-mode 0))

;;; カーソル行をハイライト
;(defface hlline-face
;  '((((class color)
;      (background dark))
;     (:background "dark slate gray"))
;    (((class color)
;      (background light))
;     (:background "ForestGreen"))
;    (t
;     ()))
;  "*Face used by hl-line.")
;(setq hl-line-face 'hlline-face)
;(global-hl-line-mode)

;; 全角空白、Tab、改行表示
(require 'jaspace)
(setq jaspace-alternate-jaspace-string "□")
(setq jaspace-alternate-eol-string "↓\n")
(setq jaspace-highlight-tabs t)
;(setq jaspace-modes
;      (append jaspace-modes
;              '(scheme-mode php-mode yaml-mode js-mode ruby-mode text-mode fundamental-mode LaTeX-mode)))

;; テキストエンコーディングとしてUTF-8を優先使用
;;(prefer-coding-system 'utf-8)

;; 起動時のメッセージを非表示
(setq inhibit-startup-message t)

;; "yes or no"を"y or n"に
(fset 'yes-or-no-p 'y-or-n-p)

;; 改行コードを表示
(setq eol-mnemonic-dos "(CRLF)")
(setq eol-mnemonic-mac "(CR)")
(setq eol-mnemonic-unix "(LF)")


;;カーソル付近のものから開こうとする
(ffap-bindings)

;;同じ単語を入力する
;M-/
;いいキーバインドにすること
;ファイの一部、ファイル名全体、動的略語展開（currentbuffer,allbuffer,killring)、Lisp symbolの順で補完
(setq hippie-expand-try-functions-list
      '(try-complete-file-name-partially
	try-complete-file-name
	try-expand-all-abbrev
	try-expand-all-abbrev-all-buffers
	try-expand-all-abbrev-from-kill
	try-complete-lisp-symbol-partially
	try-complete-lisp-symbol
	))

;CVSのコメントが euc-jp の場合
(modify-coding-system-alist 'process "cvs" '(undecided . sjis))

;;; タイトルバーにファイル名を表示する
(setq frame-title-format (format "emacs@%s : %%f" (system-name)))

;;bat,iniなどの色づけ
(require 'generic-x)

;;履歴を次回emacs起動時にも保存する
(savehist-mode 1)

;ファイル内のカーソル位置を記憶する
(setq-default save-place t)
(require 'saveplace)

;カッコの位置を表示
(show-paren-mode 1)

;モードラインに時刻表示
;(display-time)

;行,桁番号表示
(line-number-mode 1)
(column-number-mode 1)

;リージョンに色を付ける
(transient-mark-mode 1)

;gcを減らして軽く default * 10倍
(setq gc-cons-threshold (* 10 gc-cons-threshold))

;logの記録行数を増やす
(setq message-log-max 10000)

;minibufferを再起的に呼び出せるように
(setq enable-recursive-minibuffers t)

;dialogboxを出ないように
;(setq use-dialog-box nil)
;(defalias 'message-box 'message)

;履歴をたくさん
(setq history-length 1000)

;キーストロークをエコーエリアに早く表示
(setq echo-keystrokes 0.1)

;大きいファイルを開こうとしたとき警告
;デフォルトは10mb 25mbにする
(setq large-file-warning-threshold (* 25 1024 1024))

;Minibufferで入力を取り消しても履歴に残す
;誤って取り消して入力が失われるのを防ぐため
(defadvice abort-recursive-edit (before minibuffer-save activate)
  (when (eq (selected-window) (active-minibuffer-window))
    (add-to-history minibuffer-history-variable (minibuffer-contents))))

;C-tをC-x o代わりにする
;しかも分割していないときは分割してその新しいwindows移る
(defun other-window-or-split ()
  (interactive)
  (when (one-window-p) (split-window-horizontally))
  (other-window 1))
;;keymap.elに移動
;; (global-set-key (kbd "C-t") 'other-window-or-split)


;;ブックマークを変更したら速保存
;bookmarkはC-x r m,選択めにゅーはC-x r l
(setq bookmark-save-flag 1)
;超整理法?
(progn
  (setq bookmark-sort-flag nil)
  (defun bookmark-arrange-latest-top ()
    (let ((latest (bookmark-get-bookmark bookmark)))
      (setq bookmark-alist (cons latest (delq latest bookmark-alist))))
    (bookmark-save))
  (add-hook 'bookmark-after-jump-hook 'bookmark-arrange-latest-top))


(setq default-frame-alist
      (append (list '(foreground-color . "white")
		    '(background-color . "black")
		    '(background-color . "gray")
		    '(border-color . "white")
		    '(mouse-color . "white")
		    '(cursor-color . "white")
		    '(width . 100)
		    '(height . 50)
;		    '(top . 100)
;		    '(left . 100)
		    )
	      default-frame-alist))

;;emacs24から挙動が変更になったのでマウス選択でコピーできるようになるらしい
(setq x-select-enable-clipboard t)
(setq select-active-regions t)
(setq mouse-drag-copy-region t)
(setq x-select-enable-primary t)
(global-set-key [mouse-2] 'mouse-yank-at-click)

;;この設定を24で入れると描画が早くなるらしい
(setq-default bidi-display-reordering nil bidi-paragraph-direction (quote left-to-right))

;; scratchの初期メッセージ消去
(setq initial-scratch-message "")


;;package.elの設定
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)
;; Avoid ELPA's old eieio
;(require 'cl)
;(setq load-path (delete-if (lambda (d) (string-match "/eieio-1.4" d)) load-path))
;; Initialize
;(package-initialize)
;; melpa.el
;(require 'melpa)


;;バッファ自動再読み込み
(global-auto-revert-mode 1)


;;ムー使えない
(defun my-html-format-region (begin end)
  "リージョンの HTML を整形する"
  (interactive "r")
  (unless (executable-find "ruby")
    (error "hamcutlet.rb を利用できません"))
  (let ((text (buffer-substring-no-properties begin end)))
    (delete-region begin end)
    (call-process "ruby ~/hamcutlet.rb" nil t 0 text)))

(defalias 'htmlf 'my-html-format-region)
;;(global-set-key (kbd "M-h") 'my-html-format-region) ;キーを割り当てる場合


;;自動でauto-complete-modeにするもーど
(add-to-list 'ac-modes 'org-mode)

; M-/での入力補完を日本語でも有効にする
; http://namazu.org/~tsuchiya/elisp/dabbrev-ja.el
; http://www.namazu.org/~tsuchiya/elisp/dabbrev-highlight.el
;(load "dabbrev-ja")
;(require 'dabbrev-highlight)

; emacs24から実装されたテーマ
;(load-theme 'wheatgrass t)


(defun google-search-url (query)
  (format "http://www.google.co.jp/search?q=%s&hl=ja&num=100&as_qdr=y5&lr=lang_ja"
          (url-hexify-string query)))
(defun google-search (query)
  (interactive "sGoogle: ")
  (browse-url (google-search-url query)))
