;;; packge --- Summary

;;; Commentary:
;;; Colten's Emacs config

;;; Code:

;; Update some UI
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(add-to-list 'default-frame-alist '(font . "IosevkaNerdFontMono-11"))

(setq-default line-spacing 0.12)

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

(setq exec-path (append exec-path '("/usr/local/go/bin" "/home/colten/go/bin")))

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

(use-package color-theme-sanityinc-tomorrow
  :config
  (load-theme 'sanityinc-tomorrow-night))

;; treesitter
(setq treesit-language-source-alist
      '((go "https://github.com/tree-sitter/tree-sitter-go")
	(c "https://github.com/tree-sitter/tree-sitter-c")))

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
  (go-ts-mode . eglot-ensure)
  :custom
  (add-to-list 'eglot-server-programs '((c-ts-mode) "clangd"))
  (add-to-list 'eglot-server-programs '((go-ts-mode) "gopls")))

(keymap-global-set "C-c r" 'eglot-rename)
(keymap-global-set "C-c d" 'eglot-format-buffer)
(keymap-global-set "C-." 'flymake-goto-next-error)
(keymap-global-set "C-," 'flymake-goto-prev-error)
(keymap-global-set "C-c k" 'eldoc)

;; Company
(use-package company
  :hook
  (c-ts-mode . company-mode))

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
(add-hook 'c-ts-mode-hook (lambda()
                            (company-mode)
                            (yas-minor-mode)
			    (display-line-numbers-mode)
			    (setq display-line-numbers 'relative)))

(add-hook 'go-ts-mode-hook (lambda ()
			     (company-mode)
                             (yas-minor-mode)
			     (display-line-numbers-mode)
			     (setq display-line-numbers 'relative)))

(add-hook 'emacs-lisp-mode-hook (lambda()
                                  (display-line-numbers-mode)
                                  (setq display-line-numbers 'relative)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(sanityinc-tomorrow-night))
 '(custom-safe-themes
   '("b11edd2e0f97a0a7d5e66a9b82091b44431401ac394478beb44389cf54e6db28" "76ddb2e196c6ba8f380c23d169cf2c8f561fd2013ad54b987c516d3cabc00216" "04aa1c3ccaee1cc2b93b246c6fbcd597f7e6832a97aaeac7e5891e6863236f9f" "6bdc4e5f585bb4a500ea38f563ecf126570b9ab3be0598bdf607034bb07a8875" "6fc9e40b4375d9d8d0d9521505849ab4d04220ed470db0b78b700230da0a86c1" default))
 '(package-selected-packages
   '(color-theme-sanityinc-tomorrow yasnippet vertico tuareg orderless magit company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
