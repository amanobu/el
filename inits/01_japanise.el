;;日本語設定http://nijino.homelinux.net/emacs/emacs23-ja.html
(cond 
 ((not (string< mule-version "6.0"))
  ;; encode-translation-table の設定
  (coding-system-put 'euc-jp :encode-translation-table
		     (get 'japanese-ucs-cp932-to-jis-map 'translation-table))
  (coding-system-put 'iso-2022-jp :encode-translation-table
		     (get 'japanese-ucs-cp932-to-jis-map 'translation-table))
  (coding-system-put 'cp932 :encode-translation-table
		     (get 'japanese-ucs-jis-to-cp932-map 'translation-table))
  ;; charset と coding-system の優先度設定
  (set-charset-priority 'ascii 'japanese-jisx0208 'latin-jisx0201
			'katakana-jisx0201 'iso-8859-1 'cp1252 'unicode)
  (set-coding-system-priority 'utf-8 'euc-jp 'iso-2022-jp 'cp932)
  ;; 機種依存文字
  (require 'cp5022x)
  ))


;;日本語infoの導入
;;emacsのバイナリ配下の\info\dirファイルに
;;* Elisp-ja: (elisp-ja).		emacs lisp japan 
;;* Emacs-ja: (emacs-ja).		emcas japan
;;と記載の必要あり
(require 'info)
(setq Info-directory-list
      (append
       Info-default-directory-list
       (list
        "~/.emacs.d/info/"
        )
       ))


;; fonts -- Windowsの日本語フォントを直接指定（IME使用時に文字幅がちょっと変わるのは我慢する）
;; (set-default-font "ＭＳ ゴシック-10")
;; (set-fontset-font (frame-parameter nil 'font)
;;                                     'japanese-jisx0208
;;                                     '("ＭＳ ゴシック" . "unicode-bmp"))

;(create-fontset-from-ascii-font "-outline-メイリオ-normal-r-normal-normal-13-*-*-*-*-*-iso8859-1" nil "メイリオ")
;(create-fontset-from-ascii-font "-outline-メイリオ-normal-r-normal-normal-12-*-*-*-*-*-iso8859-1" nil "メイリオ")
(create-fontset-from-ascii-font "-outline-MeiryoKe_Gothic-normal-r-normal-normal-14-*-*-*-*-*-iso8859-1" nil "メイリオ")
(set-fontset-font "fontset-メイリオ" 'japanese-jisx0208 '("メイリオ*" . "jisx0208-sjis"))
(set-fontset-font "fontset-メイリオ" 'katakana-jisx0201 '("メイリオ*" . "jisx0201-katakana"))

;; デフォルトフォントを全てのフレームに指定する
;; http://www.bookshelf.jp/texi/emacs-man/21-3/jp/emacs_20.html
;(add-to-list 'default-frame-alist '(font . "ＭＳ ゴシック-10"))
(add-to-list 'default-frame-alist '(font . "fontset-メイリオ"))