;;org-mode
(add-to-list 'load-path "~/.emacs.d/org/")


(require 'org-install)
(setq org-startup-truncated nil)
(setq org-return-follows-link t)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-directory "~/org/")
(setq org-default-notes-file (concat org-directory "agenda.org"))
(setq org-capture-templates
      '(("t" "Todo" entry
         (file+headline nil "Inbox")
         "** TODO %?\n   %i\n   %T")
        ("m" "Memo" entry
         (file+headline nil "Inbox")
         "** MEMO %?\n   %i\n   %T")))
(setq org-log-done 'time)
;;; 言語は日本語
(setq org-export-default-language "ja")
;;; 文字コードはUTF-8
(setq org-export-html-coding-system 'utf-8)
;;; 行頭の:は使わない BEGIN_EXAMPLE ～ END_EXAMPLE で十分
(setq org-export-with-fixed-width nil)
;;; ^と_を解釈しない
(setq org-export-with-sub-superscripts nil)
;;; --や---をそのまま出力する
(setq org-export-with-special-strings nil)
;;; TeX・LaTeXのコードを解釈しない
(setq org-export-with-TeX-macros nil)
(setq org-export-with-LaTeX-fragments nil)
