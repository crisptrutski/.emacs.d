(global-set-key [s-left] 'windmove-left)
(global-set-key [s-right] 'windmove-right)
(global-set-key [s-up] 'windmove-up)
(global-set-key [s-down] 'windmove-down)

(global-set-key [s-S-left] 'win-resize-enlarge-horiz)
(global-set-key [s-S-right] 'win-resize-minimize-horiz)
(global-set-key [s-S-up] 'win-resize-enlarge-vert)
(global-set-key [s-S-down] 'win-resize-minimize-vert)

(global-set-key [f7] 'toggle-window-dedicated)

(global-set-key (kbd "C-c r") 'cider-repl-reset)
(global-set-key (kbd "s-i") 'align-cljlet)
(global-set-key (kbd "C-<f12>") 'color-identifiers-mode)
(put 'downcase-region 'disabled nil)
