(require 'tabbar nil t)

;; scratch buffer以外をまとめてタブに表示する
;; (setq tabbar-buffer-groups-function
;;       (lambda (b) (list "All Buffers")))
;; (setq tabbar-buffer-list-function
;;       (lambda ()
;;         (remove-if
;;          (lambda(buffer)
;;            (unless (string-match (buffer-name buffer)
;;                                  "\\(*scratch*\\|*Apropos*\\|*shell*\\|*eshell*\\|*Customize*\\)")
;;              (find (aref (buffer-name buffer) 0) " *"))
;;            )
;;          (buffer-list))))

;; tabbarを有効にする
(tabbar-mode 1)

;; ボタンをシンプルにする
(setq tabbar-home-button-enabled "")
(setq tabbar-scroll-right-button-enabled "")
(setq tabbar-scroll-left-button-enabled "")
(setq tabbar-scroll-right-button-disabled "")
(setq tabbar-scroll-left-button-disabled "")

;; Ctrl-Tab, Ctrl-Shift-Tab でタブを切り替える
(dolist (func '(tabbar-mode tabbar-forward-tab tabbar-forward-group tabbar-backward-tab tabbar-backward-group))
  (autoload func "tabbar" "Tabs at the top of buffers and easy control-tab navigation"))
(defmacro defun-prefix-alt (name on-no-prefix on-prefix &optional do-always)
  `(defun ,name (arg)
     (interactive "P")
     ,do-always
     (if (equal nil arg)
         ,on-no-prefix
       ,on-prefix)))
(defun-prefix-alt shk-tabbar-next (tabbar-forward-tab) (tabbar-forward-group) (tabbar-mode 1))
(defun-prefix-alt shk-tabbar-prev (tabbar-backward-tab) (tabbar-backward-group) (tabbar-mode 1))
(global-set-key [(control tab)] 'shk-tabbar-next)
(global-set-key [(control shift tab)] 'shk-tabbar-prev)
