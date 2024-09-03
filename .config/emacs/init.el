;;; packge --- Summary

;;; Commentary:
;;; Colten's Emacs config

;;; Code:

;; Update some UI
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(add-to-list 'default-frame-alist '(font . "IosevkaNerdFont-11"))

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

;; doom-themes
(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-spacegrey t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;; treesitter
(use-package treesit-auto
  :config
  (global-treesit-auto-mode))

(setq treesit-auto-langs '(c go gomod))

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
  :custom
  (add-to-list 'eglot-server-programs '((c-ts-mode) "clangd"))
  (add-to-list 'eglot-server-programs '((go-ts-mode) "gopls"))
  (add-to-list 'eglot-server-programs '((c++-mode) "clangd")))

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

(add-hook 'emacs-lisp-mode-hook (lambda()
                                  (display-line-numbers-mode)
                                  (setq display-line-numbers 'relative)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("77fff78cc13a2ff41ad0a8ba2f09e8efd3c7e16be20725606c095f9a19c24d3d" "ffafb0e9f63935183713b204c11d22225008559fa62133a69848835f4f4a758c" default))
 '(package-selected-packages
   '(doom-themes yasnippet vertico tuareg treesit-auto orderless magit company color-theme-sanityinc-tomorrow)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
