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
		    :height 110
		    :weight 'medium)
(set-face-attribute 'variable-pitch nil
		    :font "IosevkaNerdFontMono"
		    :height 110
		    :weight 'medium)
(set-face-attribute 'fixed-pitch nil
		    :font "IosevkaNerdFontMono"
		    :height 110
		    :weight 'medium)

(add-to-list 'default-frame-alist '(font . "IosevkaNerdFontMono-11"))

(setq-default line-spacing 0.12)

;; load theme
(load-theme 'deeper-blue)

;; Changing bar
(setq-default cursor-type 't)

;; Turn of autosave
(setq auto-save-default nil)
(setq make-backup-files nil)

;; gdb
(setq gdb-many-windows 1)

;; path
(setenv "PATH" (concat (getenv "PATH")
		       ":/usr/local/bin:/usr/local/go/bin:/home/colten/go/bin"))

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

;; vertico
(use-package vertico
  :init
  (vertico-mode))

(use-package orderless
  :custom
  (add-to-list 'eglot-server-programs '((c-mode) "clangd"))
  (add-to-list 'eglot-server-programs '((c++-mode) "clangd"))
  (add-to-list 'eglot-server-programs '((go-mode) "gopls")))

(keymap-global-set "C-c r" 'eglot-rename)
(keymap-global-set "C-c d" 'eglot-format-buffer)
(keymap-global-set "M-]" 'flymake-goto-next-error)
(keymap-global-set "M-[" 'flymake-goto-prev-error)
(keymap-global-set "C-c k" 'eldoc)

;; Company
(use-package company)

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
  (company-mode)
  (setq display-line-numbers 'relative))

(add-hook 'c-mode-hook 'c-hook)

(defun c++-hook()
  (setq tab-width 4)
  (setq c-basic-offset 4)
  (display-line-numbers-mode)
  (company-mode)
  (setq display-line-numbers 'relative))

(add-hook 'c++-mode-hook 'c++-hook)

(defun go-hook()
  (eglot-ensure)
  (setq tab-width 4)
  (display-line-numbers-mode)
  (company-mode)
  (setq display-line-numbers 'relative))

(add-hook 'go-mode-hook 'go-hook)

(defun elisp-hook()
  (display-line-numbers-mode)
  (setq display-line-numbers 'relative))

(add-hook 'emacs-lisp-hook 'elisp-hook)
