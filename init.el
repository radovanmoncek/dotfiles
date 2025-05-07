					;References:
					;https://emojiterra.com/billed-cap/
					;https://www.jetbrains.com/lp/mono/
					;https://www.youtube.com/watch?v=81MdyDYqB-A
; https://www.reddit.com/r/emacs/comments/ggd90c/color_emoji_in_emacs_27/

(setq visible-bell t)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)
(tool-bar-mode -1)
(set-face-attribute 'default nil :font "JetBrains Mono Regular" :height 160)
(set-fontset-font t 'emoji "Segoe UI Emoji" nil 'append)
(setq-default frame-title-format '("🧢"))
(global-display-line-numbers-mode t)
(load-theme 'gruber-darker t)
(setq inhibit-startup-message t)
(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1)) ; ctrl + g to quit prompt or esc

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
			rainbow-delimiters visual-fill-column
			which-key)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
