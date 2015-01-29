;(install-elisp "http://www.rubyist.net/~rubikitch/private/esh-myparser.el")
;eshell rb 1+2�Ƃ��ł���悤�ɂȂ�
;(defun eshell-parser/z (str) (eshell-parser/b str "zsh"))��zsh�ɂȂ�
(require 'esh-myparser)

;;eshell�̃|�b�v�A�b�v
;�V�F���o�b�t�@�𑦎��ɌĂяo���A���s��ɂ͌��̃E�B���h�E�\���ɖ߂��Ă���܂��B
;(install-elisp-from-emacswiki "shell-pop.el")
;(install-elisp "http://www.rubyist.net/~rubikitch/private/eshell-pop.el")
;�������ꂽ��A(global-set-key (kbd "C-x C-z") 'shell-pop)��]����
;C-x C-z��eshell windows���ł�B�����ɃR�}���h�����s��������C-x C-z��eshellwindows��������
;(setq shell-pop-window-height 100)�ł���window�T�C�Y���ύX�ł���

;eshell���elisp���]���ł���I

;zsh�̃R�}���h���C���X�^�b�N�̎���
;(install-elisp "http://www.rubyist.net/~rubikitch/private/esh-cmdline-stack.el")
;�Ⴆ�΁A
;ls �Ɠ��͌�M-q RET
;pwd RET�̎��s��ls���������͂���Ă���Ƃ�����������
(require 'esh-cmdline-stack)

;;eshell�����Ŏ�������Ă����{�I��unix�R�}���h�𖳌��ɂ���
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

;;eshell�̋�����emacs�ɍ��킹��
;| C-w  | �����ɂ���Ƃ��̂ݑO�̒P����폜 |
;| C-p  | �O�̗��������o��               |
;| C-n  | ��̗��������o��               |
;| C-u  | �R�}���h���C�����L������(�C��)   |
;��L�̏���
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
;; eshell �̂܂Ƃ�
;; | �L�[    | ���                                |
;; |---------+-------------------------------------|
;; | C-p     | �O�̗��������o�� / �O�̍s��       |
;; | C-n     | ��̗��������o�� / ��̍s��       |
;; | RET     | �R�}���h���s                        |
;; | M-q     | �R�}���h���C���X�^�b�N              |
;; | M-p     | �O�̗��������o��                  |
;; | M-n     | ��̗��������o��                  |
;; | C-w     | ���O�̒P����폜 / ���[�W�������L�� |
;; | C-a     | �R�}���h���C���̍s����              |
;; | C-c C-c | �R�}���h�������I��                  |
;; | C-c C-d | EOF�𑗐M                           |
;; | C-c C-e | �R�}���h���C�����ŉ��s�Ɏ����Ă���  |
;; | C-c C-l | �������ꗗ�\��                      |
;; | C-c C-m | ���݂̃R�}���h���C�����R�s�[        |
;; | C-c C-p | �O�̃R�}���h���C����                |
;; | C-c C-n | ��̃R�}���h���C����                |
;; | C-c C-u | �R�}���h���C�����L��                |
;; | C-c C-y | ���O�̈������R�s�[                  |
;; | C-c C-r | ���O�̃R�}���h�o�͂̐擪��          |

