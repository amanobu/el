;�L�[�{�[�h�}�N��
;<f3>�A���ۂɑ���A<f4>�ŋL�^
;<f4>�ł��̎��s
;�L�[�{�[�h�}�N���̃R�}���h��
;M-x kmacro-save��init.el�̍Ō�ɒǉ������
(defvar kmacro-save-file "~/.emacs.d/inits/50_keybordmacro.el");�}�N����ۑ������
(defun kmacro-save (symbol)
  (interactive "SName from last kbd macro: ");��`����R�}���h�𖼓���
  (name-last-kbd-macro symbol)
  (with-current-buffer (find-file-noselect kmacro-save-file)
    (goto-char (point-max))
    (insert-kbd-macro symbol)
    (basic-save-buffer)))
