;;; packge --- Summary

;;; Commentary:
;;; Colten's Emacs config

;;; Code:

;; Update some UI
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(add-to-list 'default-frame-alist '(font . "JetBrainsMonoNerdFont-10"))

(setq-default line-spacing 0.10)

;; theme
(load-theme 'modus-operandi)

;; Changing bar
(setq-default cursor-type 't)

;; Turn of autosave
(setq auto-save-default nil)
(setq make-backup-files nil)

;; gdb
(setq gdb-many-windows 1)

;; path
(setenv "PATH" (concat (getenv "PATH")
		       ":/usr/local/bin:/usr/local/go/bin:/home/colten/go/bin:/home/colten/.local/bin"))

(setq exec-path (append exec-path '("/usr/local/go/bin" "/home/colten/go/bin" "/home/colten/.local/bin")))

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

(use-package yasnippet)

(yas-reload-all)

;; vertico
(use-package vertico
  :init
  (vertico-mode))

(use-package orderless)

(use-package eglot
  :hook
  (c-ts-mode . eglot-ensure)
  (c++-mode . eglot-ensure)
  (go-ts-mode . eglot-ensure)
  (python-mode . eglot-ensure)
  :custom
  (add-to-list 'eglot-server-programs '((c-ts-mode) "clangd"))
  (add-to-list 'eglot-server-programs '((go-ts-mode) "gopls"))
  (add-to-list 'eglot-server-programs '((c++-mode) "clangd"))
  (add-to-list 'eglot-server-programs '((python-mode) "pylsp")))

(keymap-global-set "C-c r" 'eglot-rename)
(keymap-global-set "C-c d" 'eglot-format-buffer)
(keymap-global-set "C-." 'flymake-goto-next-error)
(keymap-global-set "C-," 'flymake-goto-prev-error)
(keymap-global-set "C-c k" 'eldoc)

;; Company
(use-package company
  :hook
  (c-ts-mode . company-mode)
  (c++-ts-mode . company-mode)
  (go-ts-mode . company-mode))

(use-package magit
  :config
  (keymap-global-set "C-c g" 'magit))

;; windmove
(use-package windmove
  :config
  (windmove-default-keybindings)
  (setq windmove-wrap-around t))

;; extra keybinds
(keymap-global-set "C-c e" 'eval-buffer)

;; languge hooks
(add-hook 'c++-mode-hook (lambda()
			      (yas-minor-mode)
			      (display-line-numbers-mode)
			      (setq tab-width 4)
			      (setq display-line-numbers 'relative)))

(add-hook 'c-ts-mode-hook (lambda()
                            (yas-minor-mode)
			    (display-line-numbers-mode)
			    (setq tab-width 4)
			    (setq c-ts-mode-indent-offset 4)
			    (setq display-line-numbers 'relative)))

(add-hook 'go-ts-mode-hook (lambda ()
			     (yas-minor-mode)
			     (display-line-numbers-mode)
			     (setq indent-tabs-mode t)
			     (setq tab-width 4)
			     (setq go-ts-mode-indent-offset 4)
			     (setq display-line-numbers 'relative)))

(add-hook 'python-mode-hook (lambda ()
			      (yas-minor-mode)
			      (display-line-numbers-mode)
			      (setq display-line-numbers 'relative)))

(add-hook 'emacs-lisp-mode-hook (lambda()
                                  (display-line-numbers-mode)
                                  (setq display-line-numbers 'relative)))
