;;set bell to flash
(setq visible-bell t)

;;disable scroll bar
(scroll-bar-mode -1)
;;disable top top bar
(menu-bar-mode -1)
;;disable tooltips
(tooltip-mode -1)
;disable top icons
(tool-bar-mode -1)

;;do not display starting message
(setq inhibit-startup-message t)

;;font
(set-face-attribute 'default nil :font "Code New Roman" :height 160)

;;emoji
;;source: https://ianyepan.github.io/posts/emacs-emojis/
;(when (member "Segoe UI Symbol" (font-family-list))
;  (set-fontset-font
;   t 'symbol (font-spec :family "Segoe UI Symbol") nil 'prepend))

					;http://xahlee.info/emacs/emacs/emacs_set_font_emoji.html
(progn

  ;; set font for emoji
  ;; if before emacs 28, this should come after setting symbols, because emacs 28 now has 'emoji . before, emoji is part of 'symbol

  (set-fontset-font
   t
   (if (< emacs-major-version 28)
       '(#x1f300 . #x1fad0)
     'emoji
     )
   (cond
    ((member "Apple Color Emoji" (font-family-list)) "Apple Color Emoji")
    ((member "Segoe UI Symbol" (font-family-list)) "Segoe UI Symbol")
    ((member "Noto Color Emoji" (font-family-list)) "Noto Color Emoji")
    ((member "Noto Emoji" (font-family-list)) "Noto Emoji")
    ((member "Segoe UI Emoji" (font-family-list)) "Segoe UI Emoji")
    ((member "Symbola" (font-family-list)) "Symbola"))))
;; set font for cuneiform
(set-fontset-font
 t
 'cuneiform
 (cond
  ((eq system-type 'windows-nt)
   (cond
    ((member "Segoe UI Historic" (font-family-list)) "Segoe UI Historic")))
  ((eq system-type 'darwin)
   (cond
    ((member "Noto Sans Cuneiform Regular" (font-family-list)) "Noto Sans Cuneiform Regular")))
  ((eq system-type 'gnu/linux)
   (cond
    ((member "Noto Sans Cuneiform Regular" (font-family-list)) "Noto Sans Cuneiform Regular")))))

(set-fontset-font
 t
 'phoenician
 (cond
  ((eq system-type 'windows-nt)
   (cond
    ((member "Segoe UI Historic" (font-family-list)) "Segoe UI Historic")))
  ((eq system-type 'darwin)
   (cond
    ((member "Noto Sans Phoenician Regular" (font-family-list)) "Noto Sans Phoenician Regular")))
  ((eq system-type 'gnu/linux)
   (cond
    ((member "Noto Sans Phoenician Regular" (font-family-list)) "Noto Sans Phoenician Regular")))))

(set-fontset-font
 t
 'deseret
 (cond
  ((eq system-type 'windows-nt)
   (cond
    ((member "Segoe UI Symbol" (font-family-list)) "Segoe UI Symbol")))
  ((eq system-type 'darwin)
   (cond
    ((member "Apple Symbols" (font-family-list)) "Apple Symbols")))
  ((eq system-type 'gnu/linux)
   (cond
    ((member "Noto Sans Deseret" (font-family-list)) "Noto Sans Deseret")))))

(set-fontset-font
 t
 'shavian
 (cond
  ((eq system-type 'windows-nt)
   (cond
    ((member "Segoe UI Historic" (font-family-list)) "Segoe UI Historic")))
  ((eq system-type 'darwin)
   (cond
    ((member "Apple Symbols" (font-family-list)) "Apple Symbols")))
  ((eq system-type 'gnu/linux)
   (cond
    ((member "Noto Sans Shavian Regular" (font-family-list)) "Noto Sans Shavian Regular")))))

(set-fontset-font
 t
 'egyptian
 (cond
  ((eq system-type 'windows-nt)
   (cond
    ((member "Segoe UI Historic" (font-family-list)) "Segoe UI Historic")))
  ((eq system-type 'darwin)
   (cond
    ((member "Noto Sans Egyptian Hieroglyphs" (font-family-list)) "Noto Sans Egyptian Hieroglyphs")))
  ((eq system-type 'gnu/linux)
   (cond
    ((member "Aegyptus" (font-family-list)) "Aegyptus")))))

;https://github.com/iqbalansari/emacs-emojify
;(use-package emojify
;  :hook (after-init . global-emojify-mode))

(load-theme 'doom-gruvbox t)

;;make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;;TODO: dotfiles and symlink

;; Initialize package sources source: youtube: System Crafters
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(unless (package-installed-p 'use-package)
    (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;;enabe clipboard
(setq x-select-enable-clipboard t)

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(magit counsel-projectile projectile powershell general doom-themes helpful ivy-rich iviy-rich which-key wchich-key rainbow-delimiters emojify counsel swiper ivy)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;https://emacs.stackexchange.com/questions/64853/auto-load-ivy-elc-failed-to-define-swiper
(use-package swiper :ensure t)

(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil))

;;line numbers

(column-number-mode)
(global-display-line-numbers-mode t)

;;disable line numbers for some modes
;;https://www.youtube.com/watch?v=IspAZtNTslY&list=PLEoMzSkcN8oPH1au7H6B7bBJ4ZO7BXjSZ&index=2

(dolist (mode '(org-mode-hook
		term-mode-hook
		eshell-mode-hook
		shell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package helpful
  :ensure t
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-function] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package doom-themes)

(use-package general
  :config
  (general-create-definer rune/leader-keys
			  :keymaps '(normal insert visual emacs)
;			  :prefix "SPC"
			  :global-prefix "C-SPC")
  (rune/leader-keys
    "t" '(:ignore t :which-key "toggles")
    "tt" '(counsel-load-theme :wchich-key "choose theme")))

(general-define-key
 "C-M-j" 'counsel-switch-buffer)

;powershell https://powershellcommands.com/emacs-powershell-mode

(use-package powershell)

(add-hook 'powershell-mode-hook
          (lambda ()
            (setq powershell-indent-then-offset 2)
            (setq powershell-indent-criteria 'criteria)))

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  ;; NOTE: Set this to the folder where you keep your Git repos!
;  (when (file-directory-p "~/Projects/Code")
;    (setq projectile-project-search-path '("~/Projects/Code")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package counsel-projectile
  :config (counsel-projectile-mode))

(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))
