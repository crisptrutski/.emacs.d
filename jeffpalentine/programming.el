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

(require 'expectations-mode)
