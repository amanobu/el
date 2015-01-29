;;�⊮�����o��
;(global-auto-complete-mode 1)
;(require 'auto-complete-config)
;(ac-config-default)
;(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict/")

;; 20�s���\��
;(setq ac-menu-height 20)

;;���������͂������Ԃ��J�n
;(setq ac-auto-start 2)
;; �啶���E����������ʂ��Ȃ�
;;(setq ac-ignore-case t)
;; �⊮�Ώۂɑ啶�����܂܂��ꍇ�̂݋�ʂ���
;(setq ac-ignore-case 'smart)
;; �啶���E����������ʂ���
;;(setq ac-ignore-case nil)

;;dabbrev�̃\�[�X��ǉ�
;(require 'ac-dabbrev)
;(setq ac-sources (append ac-sources '(ac-source-dabbrev)))


;(global-set-key "\M-/" 'ac-start)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'auto-complete)
(require 'auto-complete-config)
(require 'ac-dabbrev)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict/")
    ;; �O���[�o����auto-complete�𗘗p
    (global-auto-complete-mode t)
    (define-key ac-completing-map (kbd "M-n") 'ac-next)      ; M-n�Ŏ����I��
    (define-key ac-completing-map (kbd "M-p") 'ac-previous)  ; M-p�őO���I��
    (setq ac-dwim t)  ; ��C�ǂ�łق���
    ;; ��񌹂Ƃ���
    ;; * ac-source-filename
    ;; * ac-source-words-in-same-mode-buffers
    ;; �𗘗p
    (setq-default ac-sources '(ac-source-filename ac-source-words-in-same-mode-buffers ac-source-words-in-buffer))
    ;; �܂��AEmacs Lisp���[�h�ł�ac-source-symbols��ǉ��ŗ��p
    (add-hook 'emacs-lisp-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-symbols t)))
    ;; �ȉ��A�����ŕ⊮����l�p
    (setq ac-auto-start 4)
    ;; �ȉ��A�蓮�ŕ⊮����l�p
    ;(setq ac-auto-start nil)
    ;(ac-set-trigger-key "TAB")  ; TAB�ŕ⊮�J�n(�g���K�[�L�[)
    ;; or
(define-key ac-mode-map (kbd "M-/") 'auto-complete)  ; M-/�ŕ⊮�J�n

;;dabbrev�̃\�[�X��ǉ�


