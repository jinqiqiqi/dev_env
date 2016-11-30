(load-theme 'wombat)
(set-cursor-color "gold1")

(setq make-backup-files -1)

(set-language-environment 'UTF-8)
(set-locale-environment "UTF-8")

(set-default-font "DejaVu Sans Mono-12")

(global-linum-mode t)
; (setq auto-complete-mode t)

; (require 'auto-complete)
; (global-auto-complete-mode t)

; (ac-config-default)



; (require 'auto-complete-config)
; (add-to-list 'ac-dictionary-directories "
; (ac-config-default)

(show-paren-mode t)
(set-language-environment 'UTF-8)
(set-locale-environment "UTF-8")

(set-default-font "DejaVu Sans Mono-12")

(global-linum-mode t)
; (setq auto-complete-mode t)

; (require 'auto-complete)
; (global-auto-complete-mode t)

; (ac-config-default)



; (require 'auto-complete-config)
; (add-to-list 'ac-dictionary-directories "
; (ac-config-default)

(show-paren-mode t)
(setq show-paren-style 'parenthesis)

; (projectile-mode)
(toggle-scroll-bar -1)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(setq ido-everywhere t)
(ido-mode 1)

(column-number-mode)
;; (global-hl-line-mode)
(winner-mode t)


(require 'package)

(add-to-list 'package-archives
	'("marmalade". "https://marmalade-repo.org/packages/")
	t)

(add-to-list 'package-archives
	'("milkbox". "http://melpa.milkbox.net/packages/")
	t)

(package-initialize)


;; 设置时间显示
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)


(setq inhibit-startup-message t)
(setq gnus-inhibit-startup-message t)

(fset 'yes-or-no-p 'y-or-n-p)



(setq line-number-mode t)
(setq column-number-mode t)

; Helm配置部分
(require 'helm)
(require 'helm-config)
(helm-mode 1)

(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-b") #'helm-buffers-list)
(global-set-key (kbd "C-x C-f") #'helm-find-files)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" default)))
 '(gud-gdb-command-name "gdb --annotate=1")
 '(large-file-warning-threshold nil)
 '(make-backup-files nil)
 '(package-selected-packages
   (quote
    (auto-compile ac-html-angular angular-snippets ng2-mode nginx-mode ido-vertical-mode better-shell company-shell flymake-shell composer docker dockerfile-mode angular-mode emacsql-mysql git ac-php helm-ls-git helm-git-files auto-complete helm-emmet helm-git atom-dark-theme atom-one-dark-theme bash-completion sublime-themes helm web-mode smartparens restclient quickrun projectile phpunit php-mode maker-mode heroku flycheck feature-mode expand-region ensime auto-highlight-symbol ac-helm))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))

(autoload 'php-mode "php-mode" "PHP editing mode" t)
(setq shell-file-name "/bin/bash")


;; for scala settings
;; settings for exec path
(setq exec-path (append exec-path (list "/usr/local/bin/")))
(require 'scala-mode)
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
(put 'scroll-left 'disabled nil)
