;;;auto-install
(add-to-list 'load-path "~/.emacs.d/auto-install/")
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")
;;install-elisp.el�݊����[�ǂɂ���
(auto-install-compatibility-setup)
;;ediff�֘A�̃o�b�t�@���P�̃t���[���ɂ܂Ƃ߂�
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
;;�N�����ɖ���update���Ȃ��Ă��ƌ������ƂŃR�����g�A�E�g
;;�N������EmacsWiki�̃y�[�W����⊮���ɉ�����
;(auto-install-update-emacswiki-package-name t)
