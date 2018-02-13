;;minor mode omilla nappuloille.
(defvar my-keys-minor-mode-map
  (let ((map (make-sparse-keymap)))
    ;;Hotkeys
    ;;(global-set-key (kbd "M-a") 'backward-char)
    (define-key map (kbd "M-4") 'split-window-right)
    (define-key map (kbd "M-3") 'split-window-below)
    (define-key map (kbd "M-2") 'delete-other-windows)
    (define-key map (kbd "M-1") 'delete-window)

    (define-key map (kbd "M-x") 'execute-extended-command)
    (define-key map (kbd "C-b") 'switch-to-buffer)
    (define-key map (kbd "C-o") 'find-file)
    (define-key map (kbd "C-s") ctl-x-map)
    (define-key map (kbd "C-s a") 'write-file)
    (define-key map (kbd "C-s c") 'save-buffers-kill-emacs)

    ;;(glo bal-set-key (kbd "C-s s") 'save-buffer)
    ;;(define-key map (kbd "C-s a") 'write-file map)
    ;;Custom Emacs

    ;;Custom keyboard
    (define-key map (kbd "M-d") 'forward-char)
    (define-key map (kbd "M-a") 'backward-char)
    (define-key map (kbd "M-s") 'next-line)
    (define-key map (kbd "M-w") 'previous-line)
    
    (define-key map (kbd "M-l") 'forward-char)
    (define-key map (kbd "M-j") 'backward-char)
    (define-key map (kbd "M-k") 'next-line)
    (define-key map (kbd "M-i") 'previous-line)
    
    (define-key map (kbd "M-C-d") 'forward-word)
    (define-key map (kbd "M-C-a") 'backward-word)
    (define-key map (kbd "M-C-s") 'next-line)
    (define-key map (kbd "M-C-w") 'previous-line)
    
    (define-key map (kbd "M-C-l") 'forward-word)
    (define-key map (kbd "M-C-j") 'backward-word)
    (define-key map (kbd "M-C-k") 'next-line)
    (define-key map (kbd "M-C-i") 'previous-line)
    
    (define-key map (kbd "M-q") 'move-beginning-of-line)
    (define-key map (kbd "M-e") 'move-end-of-line)

    (define-key map (kbd "M-C-c") 'backward-kill-word)
    (define-key map (kbd "M-c") 'delete-backward-char)
    (define-key map (kbd "M-v") 'delete-char)
    ;;Custom keyboard
    
    ;;Windows keyboard
;;;Absolutely necessary
    (define-key map (kbd "C-z") 'undo)
    (define-key map (kbd "C-x") 'kill-region)
    (define-key map (kbd "C-c") 'kill-ring-save)
    (define-key map (kbd "C-e") 'eval-last-sexp)
    (define-key map (kbd "C-v") 'yank)
    (define-key map (kbd "C-a") 'myControlAll)
;;;Absolutely necessary
    
    ;;TODO tee oma parempi searchi kun osaat
    ;; pistÃ¤ tÃ¤mÃ¤ toimimaan: (global-set-key (kbd "C-w") 'isearch-repeat-backward)
    (define-key map (kbd "C-f") 'isearch-forward)
    (define-key map (kbd "C-M-f") 'isearch-backward)

    ;;Multiple Cursor
    (define-key map (kbd "M-<") 'mc/mark-next-like-this)
    (define-key map (kbd "M->") 'mc/mark-more-like-this-extended)
    (define-key map (kbd "M-z") 'mc/mark-all-like-this)
    ;;Multiple Cursor)
    map)
  "My own key map")
    

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  :init-value t
  :lighter " my-keys")

(my-keys-minor-mode 1)

(add-hook 'after-load-functions 'my-keys-have-priority)

(defun my-keys-have-priority (_file)
  "Try to ensure that my keybindings retain priority over other minor modes.

Called via the `after-load-functions' special hook."
  (unless (eq (caar minor-mode-map-alist) 'my-keys-minor-mode)
    (let ((mykeys (assq 'my-keys-minor-mode minor-mode-map-alist)))
      (assq-delete-all 'my-keys-minor-mode minor-mode-map-alist)
      (add-to-list 'minor-mode-map-alist mykeys))))
;;minor mode omilla nappuloille.
