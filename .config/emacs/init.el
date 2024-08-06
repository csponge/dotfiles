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

;; theme
(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-material-dark t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;; vertico
(use-package vertico
  :init
  (vertico-mode))

(use-package orderless)

(use-package eglot
  :custom
  (add-to-list 'eglot-server-programs '((c-mode) "clangd"))
  (add-to-list 'eglot-server-programs '((c++-mode) "clangd"))
  (add-to-list 'eglot-server-programs '((go-ts-mode) "gopls")))

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
  (setq c-basic-offset 4)
  (display-line-numbers-mode)
  (company-mode)
  (setq display-line-numbers 'relative))

(add-hook 'go-ts-mode-hook 'go-hook)

(defun elisp-hook()
  (display-line-numbers-mode)
  (setq display-line-numbers 'relative))

(add-hook 'emacs-lisp-mode-hook 'elisp-hook)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("2721b06afaf1769ef63f942bf3e977f208f517b187f2526f0e57c1bd4a000350" "da75eceab6bea9298e04ce5b4b07349f8c02da305734f7c0c8c6af7b5eaa9738" "7ec8fd456c0c117c99e3a3b16aaf09ed3fb91879f6601b1ea0eeaee9c6def5d9" "88f7ee5594021c60a4a6a1c275614103de8c1435d6d08cc58882f920e0cec65e" "f5f80dd6588e59cfc3ce2f11568ff8296717a938edd448a947f9823a4e282b66" "8c7e832be864674c220f9a9361c851917a93f921fedb7717b1b5ece47690c098" "4e2e42e9306813763e2e62f115da71b485458a36e8b4c24e17a2168c45c9cf9d" "77fff78cc13a2ff41ad0a8ba2f09e8efd3c7e16be20725606c095f9a19c24d3d" "7e377879cbd60c66b88e51fad480b3ab18d60847f31c435f15f5df18bdb18184" "6f1f6a1a3cff62cc860ad6e787151b9b8599f4471d40ed746ea2819fcd184e1a" "4ade6b630ba8cbab10703b27fd05bb43aaf8a3e5ba8c2dc1ea4a2de5f8d45882" "b5fd9c7429d52190235f2383e47d340d7ff769f141cd8f9e7a4629a81abc6b19" "014cb63097fc7dbda3edf53eb09802237961cbb4c9e9abd705f23b86511b0a69" default))
 '(package-selected-packages '(doom-themes vertico tuareg orderless magit company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
