(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit
                      starter-kit-bindings
                      starter-kit-js
                      starter-kit-lisp
                      clojure-mode
                      cider
                      ;;expectations-mode (brings in nrepl, woes)
                      popup
                      rainbow-delimiters
                      ;; Project navigation
                      projectile
                      ack-and-a-half
                      ag
                      undo-tree
                      markdown-mode
                      color-theme-sanityinc-tomorrow
                      hlinum
                      powerline
                      ;; autocomplete
                      auto-complete
                      company
                      ;; fixup ag, lein, etc
                      exec-path-from-shell
                      ;;datomic-snippets
                      buffer-move
                      align-cljlet
                      color-identifiers-mode
                      highlight
                      ;; show evaluated forms
                      nrepl-eval-sexp-fu
                      cider-eval-sexp-fu)
  "A list of packages to ensure are installed at launch.")

;; Automaticaly install any missing packages
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(global-company-mode)

(require 'cider-eval-sexp-fu)

(setq cider-prompt-for-symbol nil)

;; Load the provided Clojure start kit configurations
(load (concat user-emacs-directory "clojure-starter-kit.el"))

;; Load key bindings.
(load (concat user-emacs-directory "keybinds.el"))

(mapc 'load (directory-files (concat user-emacs-directory user-login-name)
                             t "^[^#].*el$"))

(define-clojure-indent
  ;; storm
  (nextTuple 'defun)
  (ack 'defun)
  (fail 'defun)
  ;; om
  (div 'defun)
  (ul 'defun)
  (li 'defun)
  (button 'defun)
  ;; build-ins
  (add-watch 'defun)
  ;; custom
  (for-map 'defun)
  (returning 1)
  (pending 1)
  ;; re-frame
  (register-sub 'defun)
  (register-handler 'defun)
  (register-base 'defun)
  ;; compojure
  (defroutes 'defun)
  (GET 2)
  (POST 2)
  (PUT 2)
  (DELETE 2)
  (HEAD 2)
  (ANY 2)
  (context 2))

;;; Sane UNDO!
(require 'undo-tree)
(global-undo-tree-mode 1)
(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-/") 'undo)
(global-set-key (kbd "M-/") 'redo)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#cccccc" "#f2777a" "#99cc99" "#ffcc66" "#6699cc" "#cc99cc" "#66cccc" "#2d2d2d"))
 '(auto-save-default nil)
 '(backup-inhibited t t)
 '(cider-buffer-name-show-port t)
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" default)))
 '(delete-selection-mode t)
 '(fci-rule-color "#393939")
 '(magit-emacsclient-executable "/Applications/Emacs.app/Contents/MacOS/bin/emacsclient")
 '(nrepl-host "localhost")
 '(nrepl-port "9991")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f2777a")
     (40 . "#f99157")
     (60 . "#ffcc66")
     (80 . "#99cc99")
     (100 . "#66cccc")
     (120 . "#6699cc")
     (140 . "#cc99cc")
     (160 . "#f2777a")
     (180 . "#f99157")
     (200 . "#ffcc66")
     (220 . "#99cc99")
     (240 . "#66cccc")
     (260 . "#6699cc")
     (280 . "#cc99cc")
     (300 . "#f2777a")
     (320 . "#f99157")
     (340 . "#ffcc66")
     (360 . "#99cc99"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-warning-face ((((class color) (min-colors 89)) (:weight bold :foreground "#cc0000"))))
 '(idle-highlight ((t (:inherit region :background "maroon4"))))
 '(linum-highlight-face ((t (:inherit default :background "color-238" :foreground "white"))) t)
 '(show-paren-match ((((class color) (min-colors 89)) (:background "#d7d7ff")))))


;;(set-face-attribute 'default nil
;;:family "Inconsolata" :height 145 :weight 'normal)
;;(set-face-attribute 'default t :family "Menlo Regular")
(set-default-font "Menlo")

;; (set-frame-parameter (selected-frame) 'alpha '(97 50))
;; (add-to-list 'default-frame-alist '(alpha 97 50))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (setenv "PATH" (concat "/Users/jeffpalentine/bin:" (getenv "PATH"))))

(global-set-key (kbd "C-0") 'ace-jump-char-mode)
;; (global-set-key (kbd "C-U") 'ace-jump-mode-pop-mark)
