(defun nrepl-reset ()
  (interactive)
  (set-buffer "*cider-repl dev*")
  (goto-char (point-max))
  (insert "(user/reset)")
  (cider-repl-return))

(global-set-key (kbd "<M-f5>") 'nrepl-reset)
