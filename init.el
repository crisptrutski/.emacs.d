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
                      ;; Clojure & friends
                      clojure-mode
                      clojure-test-mode
                      cider
                      ;;expectations-mode (brings in nrepl, woes)
                      popup
                      rainbow-delimiters
                      ;; Project navigation
                      projectile
                      ack-and-a-half
                      ;; Misc.
                      undo-tree
                      markdown-mode
                      color-theme-sanityinc-tomorrow
                      hlinum
                      powerline
                      clj-refactor
                      datomic-snippets
                      yasnippet
                      buffer-move
                      align-cljlet
                      color-identifiers-mode
                      highlight
                      nrepl-eval-sexp-fu
                      )
  "A list of packages to ensure are installed at launch.")

;; Automaticaly install any missing packages
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Load the provided Clojure start kit configurations
(load (concat user-emacs-directory "clojure-starter-kit.el"))

;; Load key bindings.
(load (concat user-emacs-directory "keybinds.el"))

(mapc 'load (directory-files (concat user-emacs-directory user-login-name)
                             t "^[^#].*el$"))

(yas-global-mode 1)

(global-set-key (kbd "<M-s-right>") 'buf-move-right)
(global-set-key (kbd "<M-s-left>") 'buf-move-left)
(global-set-key (kbd "<M-s-up>") 'buf-move-up)
(global-set-key (kbd "<M-s-down>") 'buf-move-down)

(define-clojure-indent
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
