;;���{��ݒ�http://nijino.homelinux.net/emacs/emacs23-ja.html
(cond 
 ((not (string< mule-version "6.0"))
  ;; encode-translation-table �̐ݒ�
  (coding-system-put 'euc-jp :encode-translation-table
		     (get 'japanese-ucs-cp932-to-jis-map 'translation-table))
  (coding-system-put 'iso-2022-jp :encode-translation-table
		     (get 'japanese-ucs-cp932-to-jis-map 'translation-table))
  (coding-system-put 'cp932 :encode-translation-table
		     (get 'japanese-ucs-jis-to-cp932-map 'translation-table))
  ;; charset �� coding-system �̗D��x�ݒ�
  (set-charset-priority 'ascii 'japanese-jisx0208 'latin-jisx0201
			'katakana-jisx0201 'iso-8859-1 'cp1252 'unicode)
  (set-coding-system-priority 'utf-8 'euc-jp 'iso-2022-jp 'cp932)
  ;; �@��ˑ�����
  (require 'cp5022x)
  ))


;;���{��info�̓���
;;emacs�̃o�C�i���z����\info\dir�t�@�C����
;;* Elisp-ja: (elisp-ja).		emacs lisp japan 
;;* Emacs-ja: (emacs-ja).		emcas japan
;;�ƋL�ڂ̕K�v����
(require 'info)
(setq Info-directory-list
      (append
       Info-default-directory-list
       (list
        "~/.emacs.d/info/"
        )
       ))


;; fonts -- Windows�̓��{��t�H���g�𒼐ڎw��iIME�g�p���ɕ�������������ƕς��͉̂䖝����j
;; (set-default-font "�l�r �S�V�b�N-10")
;; (set-fontset-font (frame-parameter nil 'font)
;;                                     'japanese-jisx0208
;;                                     '("�l�r �S�V�b�N" . "unicode-bmp"))

;(create-fontset-from-ascii-font "-outline-���C���I-normal-r-normal-normal-13-*-*-*-*-*-iso8859-1" nil "���C���I")
;(create-fontset-from-ascii-font "-outline-���C���I-normal-r-normal-normal-12-*-*-*-*-*-iso8859-1" nil "���C���I")
(create-fontset-from-ascii-font "-outline-MeiryoKe_Gothic-normal-r-normal-normal-14-*-*-*-*-*-iso8859-1" nil "���C���I")
(set-fontset-font "fontset-���C���I" 'japanese-jisx0208 '("���C���I*" . "jisx0208-sjis"))
(set-fontset-font "fontset-���C���I" 'katakana-jisx0201 '("���C���I*" . "jisx0201-katakana"))

;; �f�t�H���g�t�H���g��S�Ẵt���[���Ɏw�肷��
;; http://www.bookshelf.jp/texi/emacs-man/21-3/jp/emacs_20.html
;(add-to-list 'default-frame-alist '(font . "�l�r �S�V�b�N-10"))
(add-to-list 'default-frame-alist '(font . "fontset-���C���I"))