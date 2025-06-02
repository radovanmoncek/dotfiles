					;References:
					;https://emojiterra.com/billed-cap/
					;https://www.jetbrains.com/lp/mono/
					;https://www.youtube.com/watch?v=81MdyDYqB-A
; https://www.reddit.com/r/emacs/comments/ggd90c/color_emoji_in_emacs_27/
					; ctrl + g to quit prompt or esc
					; Initialize package sources source: youtube: System Crafters
					; ido-mode
					;https://learns.edu.vn/learn/who-said-those-who-do-not-learn-from-history/
					;https://www.gnu.org/software/emacs/manual/html_node/emacs/Display-Custom.html
					;https://chrismaiorana.com/relative-line-numbers-in-emacs/

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless (package-installed-p 'use-package)
    (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)
(use-package smex)
(use-package magit)
(load-theme 'gruber-darker t)
(set-face-attribute 'default nil :font "JetBrains Mono Regular" :height 160)
(setq visible-bell t)
(setq inhibit-startup-message t)
(setq-default frame-title-format '("Those who do not learn from history are destined to repeat it. - George Santayana"))
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)
(tool-bar-mode -1)
(set-fontset-font t 'emoji "Segoe UI Emoji" nil 'append)
(global-display-line-numbers-mode t)
(ido-mode 1)
(ido-everywhere 1)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-,") 'duplicate-line)
(setq display-line-numbers-type 'relative)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e13beeb34b932f309fb2c360a04a460821ca99fe58f69e65557d6c1b10ba18c7"
     default))
 '(package-selected-packages
   '(counsel-projectile doom-themes emojify forge general
			gruber-darker-theme helpful ivy-rich
			modus-themes org-bullets powershell
			rainbow-delimiters smex visual-fill-column
			which-key)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
