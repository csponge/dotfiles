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
		    :font "IosevkaNerdFontMono"
		    :height 100
		    :weight 'medium)
(set-face-attribute 'variable-pitch nil
		    :font "IosevkaNerdFontMono"
		    :height 110
		    :weight 'medium)
(set-face-attribute 'fixed-pitch nil
		    :font "IosevkaNerdFontMono"
		    :height 110
		    :weight 'medium)

(add-to-list 'default-frame-alist '(font . "IosevkaNerdFontMono-10"))

(setq-default line-spacing 0.12)

;; theme
(load-theme 'gruber-darker)

;; Changing bar
(setq-default cursor-type 't)

;; Turn of autosave
(setq auto-save-default nil)
(setq make-backup-files nil)

;; gdb
(setq gdb-many-windows 1)

;; path
(setenv "PATH" (concat (getenv "PATH")
		       ":/usr/local/bin:/home/colten/go/bin"))

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

;; gruber
(use-package gruber-darker-theme)

;; yasnippet
(use-package yasnippet
  :init (yas-global-mode 1))

(use-package vterm
  :ensure t)

;; go
(use-package go-mode)

;; Treesitter
(use-package tree-sitter)

(setq treesit-language-source-alist
	  '((go "https://github.com/tree-sitter/tree-sitter-go")
	    (gomod "https://github.com/camdencheek/tree-sitter-go-mod")
	    (c "https://github.com/tree-sitter/tree-sitter-c")))

(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

;; Eglot
(use-package eglot
  :hook
  (c-mode . eglot-ensure)
  :config
  (add-to-list 'eglot-server-programs '((c-mode) "clangd"))
  (add-to-list 'eglot-server-programs '((go-mode) "gopls")))

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

;; extra hooks
(defun c-hook()
  (setq tab-width 4)
  (setq c-basic-offset 4)
  (display-line-numbers-mode)
  (setq display-line-numbers 'relative))

(add-hook 'c-mode-hook 'c-hook)

(defun go-hook()
  (eglot-ensure)
  (setq tab-width 4)
  (display-line-numbers-mode)
  (setq display-line-numbers 'relative))

(add-hook 'go-mode-hook 'go-hook)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e27c9668d7eddf75373fa6b07475ae2d6892185f07ebed037eedf783318761d7" "9fb561389e5ac5b9ead13a24fb4c2a3544910f67f12cfcfe77b75f36248017d0" default))
 '(package-selected-packages
   '(gruber-darker-theme yasnippet vterm tuareg tree-sitter prescient magit goto-chg go-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
