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

;; theme
(load-theme 'modus-vivendi)

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

(keymap-global-set "C-c r" 'eglot-rename)
(keymap-global-set "C-c d" 'eglot-format-buffer)
(keymap-global-set "M-]" 'flymake-goto-next-error)
(keymap-global-set "M-[" 'flymake-goto-prev-error)

(use-package magit
  :config
  (keymap-global-set "C-c g" 'magit))

;; windmove
(use-package windmove
  :config
  (windmove-default-keybindings)
  (setq windmove-wrap-around t))

;; ocaml
(use-package tuareg
  :ensure t)

;; extra keybinds
(keymap-global-set "C-c e" 'eval-buffer)

;; tabs
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
