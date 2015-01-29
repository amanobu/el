(require 'linum)

;; 行番号表示
(global-linum-mode t)
(set-face-attribute 'linum nil
                    :foreground "#FFF"
                    :height 0.9)

;; ファイル名での判定
(defvar my-linum-file nil)
(defun my-linum-file-name ()
  (when (member (buffer-name) my-linum-file)
                (linum-mode 0)))
(add-hook 'find-file-hook 'my-linum-file-name)
;; ファイル名での判定 agenda.orgは重いので外す
(setq my-linum-file '("agenda.org"))

;;(global-set-key [f9] 'linum-mode)

;; メージャーモード/マイナーモードでの指定
;; (defvar my-linum-hook-name nil)
;; (mapc (lambda (hook-name)
;;           (add-hook hook-name (lambda () (linum-mode t))))
;;        my-linum-hook-name)

;; ファイル名での判定
;; (defvar my-linum-file nil)
;; (defun my-linum-file-name ()
;;   (when (member (buffer-name) my-linum-file)
;;                 (linum-mode t)))
;; (add-hook 'find-file-hook 'my-linum-file-name)

;; 拡張子での判定
;; (defvar my-linum-file-extension nil)
;; (defun my-linum-file-extension ()
;;   (when (member (file-name-extension (buffer-file-name)) my-linum-file-extension)
;;                 (linum-mode t)))
;; (add-hook 'find-file-hook 'my-linum-file-extension)

;; メージャーモード/マイナーモードでの指定
;; (setq my-linum-hook-name '(emacs-lisp-mode-hook slime-mode-hook sh-mode-hook text-mode-hook
;;                            php-mode-hook python-mode-hook ruby-mode-hook
;;                            css-mode-hook yaml-mode-hook org-mode-hook
;;                            howm-mode-hook js2-mode-hook javascript-mode-hook
;;                            smarty-mode-hook html-helper-mode-hook))

;; ファイル名での判定
;; (setq my-linum-file '("hosts" "my_site"))

;; 拡張子での判定
;; (setq my-linum-file-extension '("conf" "bat"))

