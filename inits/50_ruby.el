;; rcodetools
(add-to-list 'load-path "C:/ruby192/lib/ruby/gems/1.9.1/gems/rcodetools-0.8.5.0/")

(require 'rcodetools)
(setq rct-find-tag-if-available nil)
(defun make-ruby-scratch-buffer ()
  (with-current-buffer (get-buffer-create "*ruby scratch*")
    (ruby-mode)
    (current-buffer)))
(defun ruby-scratch ()
  (interactive)
  (pop-to-buffer (make-ruby-scratch-buffer)))
(defun ruby-mode-hook-rcodetools ()
  (define-key ruby-mode-map "\M-\C-i" 'rct-complete-symbol)
  (define-key ruby-mode-map "\C-c\C-t" 'ruby-toggle-buffer)
  (define-key ruby-mode-map "\C-c\C-d" 'xmp)
  (define-key ruby-mode-map "\C-c\C-f" 'rct-ri))
(add-hook 'ruby-mode-hook 'ruby-mode-hook-rcodetools)
(require 'anything-rcodetools)
;; Command to get all RI entries.
;(setq rct-get-all-methods-command "PAGER=cat fri -l")
(setq rct-get-all-methods-command "cat fri")
;; See docs
(define-key anything-map [(control ?;)] 'anything-execute-persistent-action)

