(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-warning-face ((((class color) (min-colors 89)) (:weight bold :foreground "#cc0000"))))
 '(idle-highlight ((t (:inherit region :background "maroon4"))))
 '(linum-highlight-face ((t (:inherit default :background "color-238" :foreground "white"))) t)
 '(show-paren-match ((((class color) (min-colors 89)) (:background "#d7d7ff")))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector (vector "#cccccc" "#f2777a" "#99cc99" "#ffcc66" "#6699cc" "#cc99cc" "#66cccc" "#2d2d2d"))
 '(auto-save-default nil)
 '(backup-inhibited t t)
 '(custom-safe-themes (quote ("bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" default)))
 '(delete-selection-mode t)
 '(fci-rule-color "#393939")
 '(magit-emacsclient-executable "/Applications/Emacs.app/Contents/MacOS/bin/emacsclient")
 '(cider-buffer-name-show-port t)
 '(nrepl-host "localhost")
 '(nrepl-port "9991")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map (quote ((20 . "#f2777a") (40 . "#f99157") (60 . "#ffcc66") (80 . "#99cc99") (100 . "#66cccc") (120 . "#6699cc") (140 . "#cc99cc") (160 . "#f2777a") (180 . "#f99157") (200 . "#ffcc66") (220 . "#99cc99") (240 . "#66cccc") (260 . "#6699cc") (280 . "#cc99cc") (300 . "#f2777a") (320 . "#f99157") (340 . "#ffcc66") (360 . "#99cc99"))))
 '(vc-annotate-very-old-color nil))

(blink-cursor-mode t)
(menu-bar-mode t)

(defun set-cursor-type (cursor)
 "Modify the cursor to the specified type"
 (interactive "sCursor type (bar, box, etc.): ")
 (modify-frame-parameters
  (selected-frame)
  (list (cons 'cursor-type (intern cursor)))))

(defun set-bar-cursor ()
 "Change the cursor to a bar rather than the (default) box"
 (interactive)
 (set-cursor-type "bar"))

(set-bar-cursor)

(icomplete-mode 1)
(setq completion-ignore-case 1)
(setq show-trailing-whitespace t)
(set-default 'fill-column 80)
