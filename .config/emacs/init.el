;;; packge --- Summary

;;; Commentary:
;;; Colten's Emacs config

;;; Code:

;; Update some UI
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; Fonts
(set-face-attribute 'default nil
		    :font "JetBrainsMono Nerd Font"
		    :height 100
		    :weight 'medium)
(set-face-attribute 'variable-pitch nil
		    :font "JetBrainsMono Nerd Font"
		    :height 110
		    :weight 'medium)
(set-face-attribute 'fixed-pitch nil
		    :font "JetBrainsMono Nerd Font"
		    :height 110
		    :weight 'medium)

(add-to-list 'default-frame-alist '(font . "JetBrainsMono Nerd Font-10"))

(setq-default line-spacing 0.12)

;; line numbers
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

(dolist (mode '(term-mode-hook
		eshell-mode-hook
		help-mode-hook
		vterm-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; theme
(load-theme 'tango-dark)

;; Changing bar
(setq-default cursor-type 't)

;; Turn of autosave
(setq auto-save-default nil)
(setq make-backup-files nil)

;; gdb
(setq gdb-many-windows 1)

;; Package management
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(require 'use-package)
(setq use-package-always-ensure t)

;; evil
(use-package evil)
(evil-mode 1)

(evil-set-leader 'normal (kbd "SPC"))

;; yasnippet
(use-package yasnippet
  :init (yas-global-mode 1))

(use-package vterm
  :ensure t)

;; Treesitter
(use-package tree-sitter)
(use-package tree-sitter-langs)

(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

;; Eglot
(use-package eglot
  :hook
  (c-mode . eglot-ensure)
  (c++-mode . eglot-ensure)
  (tuareg-mode . eglot-ensure)
  :config
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
  (add-to-list 'eglot-server-programs '((tuareg-mode) "ocamllsp")))

(add-hook 'eglot-managed-mode-hook (lambda () (eglot-inlay-hints-mode -1)))

(define-key evil-normal-state-map (kbd "<leader>r") 'eglot-rename)
(define-key evil-normal-state-map (kbd "<leader>d") 'eglot-format-buffer)
(define-key evil-normal-state-map (kbd "[d") 'flymake-goto-prev-error)
(define-key evil-normal-state-map (kbd "]d") 'flymake-goto-prev-error)

;; Company
(use-package company
  :hook
    (c-mode . company-mode)
    (c++-mode . company-mode)
    (tuareg-mode . company-mode))

(setq company-minimum-prefix-length 1
      company-idle-delay 1)

(use-package magit
  :config
  (define-key evil-normal-state-map (kbd "<leader>g") 'magit))

;; windmove
(use-package windmove
  :config
  (windmove-default-keybindings)
  (setq windmove-wrap-around t))

;; ocaml
(use-package tuareg
  :ensure t)

;; extra keybinds
;; comments
(define-key evil-normal-state-map (kbd "gc") 'comment-or-uncomment-region)

;; window
(define-key evil-normal-state-map (kbd "C-u") 'scroll-down-command)

;; elisp
(keymap-global-set "C-c e" 'eval-buffer)

;; tabs
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
