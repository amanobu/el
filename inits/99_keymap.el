(define-key global-map (kbd "<f8>") 'goto-last-change)
(define-key global-map (kbd "<f7>") 'open-junk-file)
;(define-key global-map (kbd "C-;") 'anything-for-files)
;(define-key global-map (kbd "C-;") 'anything-filelist+)
;(define-key global-map (kbd "C-:") 'anything-occur-x)
(define-key global-map (kbd "M-y") 'anything-show-kill-ring)
;(define-key global-map (kbd "C-z") 'org-capture)
(global-set-key (kbd "C-c r") 'query-replace)
(global-set-key (kbd "C-c f") 'moccur-grep-find)
(global-set-key (kbd "C-c R") 'query-replace-regexp)
(global-set-key [f11] 'view-mode)
(global-set-key [f12] 'org-capture)
(global-set-key [f9] 'open-agenda-file)
(defun open-agenda-file()
  (interactive)
  (find-file org-default-notes-file)
  (revert-buffer)
)

;C-hÇÕÉVÉFÉãÇ…çáÇÌÇπÇÈÇΩÇﬂ
(global-set-key (kbd "C-h") 'delete-backward-char)

(define-key isearch-mode-map "\C-k" 'isearch-edit-string)

(define-key isearch-mode-map (kbd "C-o") 'anything-occur-x)

(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)

(global-set-key (kbd "C-M-_") 'redo)

(global-set-key (kbd "C-t") 'other-window-or-split)

(global-set-key (kbd "C-;") 'helm-mini)
(global-set-key (kbd "C-c h") 'helm-mini)
;(global-set-key (kbd "C-c b") 'helm-descbinds)
(global-set-key (kbd "C-c o") 'helm-occur)
;(global-set-key (kbd "C-c s") 'helm-ag)
(global-set-key (kbd "C-c y") 'helm-show-kill-ring)
(define-key global-map (kbd "M-x") 'helm-M-x)


(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(define-key global-map (kbd "C-:") 'helm-occur)
