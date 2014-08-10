(require 'align-cljlet)
(require 'datomic-snippets)
(require 'clj-refactor)
(add-hook 'clojure-mode-hook
          (lambda ()
            (clj-refactor-mode 1)
            (cljr-add-keybindings-with-prefix "s-r")))

(add-hook 'clojure-mode-hook
 (lambda ()
  (font-lock-add-keywords nil '(("\\<\\(FIXME\\|TODO\\|BUG\\|spy/d\\|spy/p\\|spy/t\\)" 1
                                 font-lock-warning-face t)))))

(defun magit-commit-mode-init ()
  (when (looking-at "\n")
    (open-line 1)))
(add-hook 'git-commit-mode-hook 'magit-commit-mode-init)

(require 'cider)
(defun cider-repl-reset ()
  (interactive)
  (save-some-buffers)
  (with-current-buffer (cider-current-repl-buffer)
    (goto-char (point-max))
    (insert "(user/reset)")
    (cider-repl-return)))

(setq cider-known-endpoints '(("localhost" "9991")
                              ("nr-t1" "9980")
                              ("nr-t2" "9981")
                              ("nr-t3" "9982")
                              ("nr-t4" "9983")
                              ("nr-t5" "9984")
                              ("nr-prod" "9995")))

(yas-global-mode 1)

(setq-default whitespace-line-column 90)
(global-whitespace-mode 1)
(add-hook 'before-save-hook 'whitespace-cleanup)

(defun kill-whitespace ()
  "Kill the whitespace between two non-whitespace characters"
  (interactive "*")
  (save-excursion
    (save-restriction
      (save-match-data
        (prognm
          (re-search-backward "[^ \t\r\n]" nil t)
          (re-search-forward "[ \t\r\n]+" nil t)
          (replace-match "" nil nil))))))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; (define-key evil-normal-state-map "\C-e" 'evil-end-of-line)
;; (define-key evil-insert-state-map "\C-e" 'end-of-line)
;; (define-key evil-visual-state-map "\C-e" 'evil-end-of-line)
;; (define-key evil-motion-state-map "\C-e" 'evil-end-of-line)
;; (define-key evil-normal-state-map "\C-f" 'evil-forward-char)
;; (define-key evil-insert-state-map "\C-f" 'evil-forward-char)
;; (define-key evil-insert-state-map "\C-f" 'evil-forward-char)
;; (define-key evil-normal-state-map "\C-b" 'evil-backward-char)
;; (define-key evil-insert-state-map "\C-b" 'evil-backward-char)
;; (define-key evil-visual-state-map "\C-b" 'evil-backward-char)
;; (define-key evil-normal-state-map "\C-d" 'evil-delete-char)
;; (define-key evil-insert-state-map "\C-d" 'evil-delete-char)
;; (define-key evil-visual-state-map "\C-d" 'evil-delete-char)
;; (define-key evil-normal-state-map "\C-n" 'evil-next-line)
;; (define-key evil-insert-state-map "\C-n" 'evil-next-line)
;; (define-key evil-visual-state-map "\C-n" 'evil-next-line)
;; (define-key evil-normal-state-map "\C-p" 'evil-previous-line)
;; (define-key evil-insert-state-map "\C-p" 'evil-previous-line)
;; (define-key evil-visual-state-map "\C-p" 'evil-previous-line)
;; (define-key evil-normal-state-map "\C-w" 'evil-delete)
;; (define-key evil-insert-state-map "\C-w" 'evil-delete)
;; (define-key evil-visual-state-map "\C-w" 'evil-delete)
;; (define-key evil-normal-state-map "\C-y" 'yank)
;; (define-key evil-insert-state-map "\C-y" 'yank)
;; (define-key evil-visual-state-map "\C-y" 'yank)
;; (define-key evil-normal-state-map "\C-k" 'kill-line)
;; (define-key evil-insert-state-map "\C-k" 'kill-line)
;; (define-key evil-visual-state-map "\C-k" 'kill-line)
;; (define-key evil-normal-state-map "Q" 'call-last-kbd-macro)
;; (define-key evil-visual-state-map "Q" 'call-last-kbd-macro)
;; (define-key evil-normal-state-map (kbd "TAB") 'evil-undefine)

;; (defun evil-undefine ()
;;  (interactive)
;;  (let (evil-mode-map-alist)
;;    (call-interactively (key-binding (this-command-keys)))))
