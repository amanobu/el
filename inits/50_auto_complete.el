;;補完候補を出す
;(global-auto-complete-mode 1)
;(require 'auto-complete-config)
;(ac-config-default)
;(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict/")

;; 20行分表示
;(setq ac-menu-height 20)

;;＊文字入力したら補間を開始
;(setq ac-auto-start 2)
;; 大文字・小文字を区別しない
;;(setq ac-ignore-case t)
;; 補完対象に大文字が含まれる場合のみ区別する
;(setq ac-ignore-case 'smart)
;; 大文字・小文字を区別する
;;(setq ac-ignore-case nil)

;;dabbrevのソースを追加
;(require 'ac-dabbrev)
;(setq ac-sources (append ac-sources '(ac-source-dabbrev)))


;(global-set-key "\M-/" 'ac-start)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'auto-complete)
(require 'auto-complete-config)
(require 'ac-dabbrev)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict/")
    ;; グローバルでauto-completeを利用
    (global-auto-complete-mode t)
    (define-key ac-completing-map (kbd "M-n") 'ac-next)      ; M-nで次候補選択
    (define-key ac-completing-map (kbd "M-p") 'ac-previous)  ; M-pで前候補選択
    (setq ac-dwim t)  ; 空気読んでほしい
    ;; 情報源として
    ;; * ac-source-filename
    ;; * ac-source-words-in-same-mode-buffers
    ;; を利用
    (setq-default ac-sources '(ac-source-filename ac-source-words-in-same-mode-buffers ac-source-words-in-buffer))
    ;; また、Emacs Lispモードではac-source-symbolsを追加で利用
    (add-hook 'emacs-lisp-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-symbols t)))
    ;; 以下、自動で補完する人用
    (setq ac-auto-start 4)
    ;; 以下、手動で補完する人用
    ;(setq ac-auto-start nil)
    ;(ac-set-trigger-key "TAB")  ; TABで補完開始(トリガーキー)
    ;; or
(define-key ac-mode-map (kbd "M-/") 'auto-complete)  ; M-/で補完開始

;;dabbrevのソースを追加


