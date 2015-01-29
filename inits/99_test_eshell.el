;(install-elisp "http://www.rubyist.net/~rubikitch/private/esh-myparser.el")
;eshell rb 1+2とかできるようになる
;(defun eshell-parser/z (str) (eshell-parser/b str "zsh"))でzshになる
(require 'esh-myparser)

;;eshellのポップアップ
;シェルバッファを即時に呼び出し、実行後には元のウィンドウ構成に戻してくれます。
;(install-elisp-from-emacswiki "shell-pop.el")
;(install-elisp "http://www.rubyist.net/~rubikitch/private/eshell-pop.el")
;これを入れた後、(global-set-key (kbd "C-x C-z") 'shell-pop)を評価し
;C-x C-zでeshell windowsがでる。そこにコマンドを実行したあとC-x C-zでeshellwindowsが消える
;(setq shell-pop-window-height 100)でそのwindowサイズが変更できる

;eshell上でelispも評価できる！

;zshのコマンドラインスタックの実装
;(install-elisp "http://www.rubyist.net/~rubikitch/private/esh-cmdline-stack.el")
;例えば、
;ls と入力後M-q RET
;pwd RETの実行後lsが初期入力されているという言うこと
(require 'esh-cmdline-stack)

;;eshell内部で実装されている基本的なunixコマンドを無効にする
(progn
  (defmacro eval-after-load* (name &rest body)
    (declare (indent 1))
    `(eval-after-load ,name '(progn ,@body)))
  (defun eshell-disable-unix-command-emulation ()
    (eval-after-load* "em-ls"
      (fmakunbound 'eshell/ls))
    (eval-after-load* "em-unix"
      (mapc 'fmakunbound '(eshell/agrep
                           eshell/basename
                           eshell/cat
                           eshell/cp
                           eshell/date
                           eshell/diff
                           eshell/dirname
                           eshell/du
                           eshell/egrep
                           eshell/fgrep
                           eshell/glimpse
                           eshell/grep
                           eshell/info
                           eshell/ln
                           eshell/locate
                           eshell/make
                           eshell/man
                           eshell/mkdir
                           eshell/mv
                           eshell/occur
                           eshell/rm
                           eshell/rmdir
                           eshell/su
                           eshell/sudo
                           eshell/time))))
  (eshell-disable-unix-command-emulation))

;;eshellの挙動をemacsに合わせる
;| C-w  | 末尾にいるときのみ前の単語を削除 |
;| C-p  | 前の履歴を取り出す               |
;| C-n  | 後の履歴を取り出す               |
;| C-u  | コマンドラインをキルする(任意)   |
;上記の準備
(progn
  (defun eshell-in-command-line-p ()
    (<= eshell-last-output-end (point)))
  (defmacro defun-eshell-cmdline (key &rest body)
    (let ((cmd (intern (format "eshell-cmdline/%s" key))))
      `(progn
         (add-hook 'eshell-mode-hook
                   (lambda () (define-key eshell-mode-map (read-kbd-macro ,key) ',cmd)))
         (defun ,cmd ()
           (interactive)
           (if (not (eshell-in-command-line-p))
               (call-interactively (lookup-key (current-global-map) (read-kbd-macro ,key)))
             ,@body)))))
  (defun eshell-history-and-bol (func)
    (delete-region eshell-last-output-end (point-max))
    (funcall func 1)
    (goto-char eshell-last-output-end)))
;C-w
(defun-eshell-cmdline "C-w"
  (if (eq (point-max) (point))
      (backward-kill-word 1)
    (kill-region (region-beginning) (region-end))))
;C-p
(defun-eshell-cmdline "C-p"
  (let ((last-command 'eshell-previous-matching-input-from-input))
    (eshell-history-and-bol 'eshell-previous-matching-input-from-input)))
;C-n
(defun-eshell-cmdline "C-n"
  (let ((last-command 'eshell-previous-matching-input-from-input))
    (eshell-history-and-bol 'eshell-next-input)))
;C-u
(defun-eshell-cmdline "C-u"
  (eshell-bol)
  (if (= (point-max) (point))
      (universal-argument)
    (end-of-line)
    (eshell-kill-input)))
;; eshell のまとめ
;; | キー    | 解説                                |
;; |---------+-------------------------------------|
;; | C-p     | 前の履歴を取り出す / 前の行へ       |
;; | C-n     | 後の履歴を取り出す / 後の行へ       |
;; | RET     | コマンド実行                        |
;; | M-q     | コマンドラインスタック              |
;; | M-p     | 前の履歴を取り出す                  |
;; | M-n     | 後の履歴を取り出す                  |
;; | C-w     | 直前の単語を削除 / リージョンをキル |
;; | C-a     | コマンドラインの行頭へ              |
;; | C-c C-c | コマンドを強制終了                  |
;; | C-c C-d | EOFを送信                           |
;; | C-c C-e | コマンドラインを最下行に持っていく  |
;; | C-c C-l | 履歴を一覧表示                      |
;; | C-c C-m | 現在のコマンドラインをコピー        |
;; | C-c C-p | 前のコマンドラインへ                |
;; | C-c C-n | 後のコマンドラインへ                |
;; | C-c C-u | コマンドラインをキル                |
;; | C-c C-y | 直前の引数をコピー                  |
;; | C-c C-r | 直前のコマンド出力の先頭へ          |

