;; TODO: Help mode, Magit log mode, MagitPopup mode. 
(defun vi--config-evil ()
  "Configure evil mode."

  (delete 'term-mode evil-insert-state-modes)

  ;; Use Emacs state in these modes.
  (dolist (mode '(dired-mode
                  term-mode
                  flycheck-error-list-mode))
    (add-to-list 'evil-emacs-state-modes mode))

  (delete 'term-mode evil-insert-state-modes)

  ;; Use insert state in these additional modes.
  (dolist (mode '(magit-log-edit-mode))
    (add-to-list 'evil-insert-state-modes mode))


  (evil-add-hjkl-bindings occur-mode-map 'emacs
    (kbd "/")       'evil-search-forward
    (kbd "n")       'evil-search-next
    (kbd "N")       'evil-search-previous
    (kbd "C-f")     'evil-scroll-down
    (kbd "C-u")     'evil-scroll-up
    (kbd "C-w C-w") 'other-window)

  ;; Global bindings.
  (evil-define-key 'normal global-map (kbd "C-f")  'evil-scroll-down)
  (evil-define-key 'normal global-map (kbd "C-u")  'evil-scroll-up)
  (evil-define-key 'normal global-map (kbd "z z")  'evil-write)
  (evil-define-key 'normal global-map (kbd "C-t")  'find-tag)
  ; TODO: depending on the minor mode we might want to
  ; xref-find-references instead.
  (evil-define-key 'normal global-map (kbd "C-g")  'cscope-find-this-symbol)
  (evil-define-key 'normal global-map (kbd "<f3>") 'xref-find-definitions))


(defun vi--config-evil-leader ()
  "Configure evil leader mode."
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "w" 'evil-write
    "e" 'evil-append-line
    "t" 'find-tag
    "gs" 'magit-status
    "gl" 'magit-log-all
    "gd" 'magit-diff
    "3" 'evil-search-word-backward
    "8" 'evil-search-word-forward))


(provide 'init-evil)
