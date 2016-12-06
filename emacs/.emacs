;; ******************* basic settings *******************
(setq user-full-name "Eric King")
(setq user-mail-address "jinqiqiqi@gmail.com")

;; ******************* package info *******************

(require 'package)
(add-to-list 'package-archives
	'("marmalade". "https://marmalade-repo.org/packages/")
	t)
(add-to-list 'package-archives
	'("milkbox". "http://melpa.milkbox.net/packages/")
	t)
(package-initialize)



;; ******************* time settings *******************
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

;; ******************* color settings *******************
(load-theme 'wombat)
(set-cursor-color "gold1")

;; ******************* start server *******************
(server-start)

;; ******************* sync copy/paste clipboard with linux x11 *******************
(setq x-select-enable-clipboard t)
(setq x-select-enable-primary t)


;; ******************* display and encoding *******************
(set-default-font "DejaVu Sans Mono-12")
(set-language-environment 'UTF-8)
(set-locale-environment "UTF-8")

; (setq default-major-mode 'text-mode)

;; hide the startup screen and messages
(setq inhibit-startup-message t)
(setq gnus-inhibit-startup-message t)

;; enable to display images
(auto-image-file-mode t)

;; replace yes/no with y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; line number settings
(global-linum-mode t)
(setq line-number-mode t)
(setq column-number-mode t)
(setq hl-line-mode t)


;; scroll bar and menu bar settings
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
;; (toggle-frame-fullscreen)

;; match the () and []
(show-paren-mode t)
(setq show-paren-style 'parenthesis)
(electric-pair-mode t)

;; show the whitespaces
;; (whitespace-mode t)

;; set the width of tab = 4 spaces
(setq default-tab-width 4)

;; enable the disabled functions
(setq version-control t)

;; extend the ring steps for reverting
(setq kill-ring-max 200)

;; disable to generate backup files
(setq make-backup-files -1)
(setq auto-save-default nil)
(setq create-lockfiles -1)

;; ******************* auto hightlight symbol *******************
(require 'auto-highlight-symbol "~/.emacs.d/elpa/auto-highlight-symbol-20130313.243/auto-highlight-symbol.el")
(global-auto-highlight-symbol-mode t)
(ahs-set-idle-interval 0.5)

;; ******************* highlight symbol *******************
(require 'highlight-symbol "~/.emacs.d/elpa/highlight-symbol-20160102.1209/highlight-symbol.el")
(global-set-key [(control f3)] 'highlight-symbol)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)


;; ******************* mode settings *******************

;; saving emacs sessions
(desktop-save-mode 1)
(save-place-mode t)
(savehist-mode t)


;; for php mode
(autoload 'php-mode "php-mode" "PHP editing mode" t)
(setq shell-file-name "/bin/bash")
(unless (package-installed-p 'ac-php )
	(package-refresh-contents)
	(package-install 'ac-php )
)
(require 'cl)
;; It seems the blow settings are not working for some reason.
(require 'php-mode)
(setq ac-php-debug-flag t)
(add-hook 'php-mode-hook
	'(lambda ()
	   (auto-complete-mode t)
	   (require 'ac-php)
	   (setq ac-sources '(ac-source-php ) )
	   (yas-global-mode 1)
	   (define-key php-mode-map (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
	   (define-key php-mode-map (kbd "C-t") 'ac-php-location-stack-back   ) ;go back
   ))

;; for scala settings
;; settings for exec path
(setq exec-path (append exec-path (list "/usr/local/bin/")))
(require 'scala-mode)
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
(put 'scroll-left 'disabled nil)


;; winner mode
(winner-mode t)


;; auto complete
(require 'auto-complete)
(global-auto-complete-mode t)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-1.4/auto-complete.el")
(ac-config-default)
(setq ac-auto-start 1)
(setq ac-auto-show-menu 0.1)

;; yasnippet
(require 'yasnippet)
(setq yas/prompt-functions
   '(yas/dropdown-prompt yas/x-prompt yas/completing-prompt yas/ido-prompt yas/no-prompt))
(yas/global-mode 1)
(yas/minor-mode-on)

;; ido mode
; (require 'ido)
; (setq ido-enable-flex-matching t)
; (setq ido-use-filename-at-point 'guess)
; (setq ido-everywhere t)
; (ido-mode 1)


; Helm mode
(require 'helm)
(require 'helm-config)
(helm-mode t)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-b") #'helm-buffers-list)
(global-set-key (kbd "C-x C-f") #'helm-find-files)

;; gtags and helm-gtags
(gtags-mode t)								
(global-set-key (kbd "M-g .") 'helm-gtags-find-tag)
(global-set-key (kbd "M-g r") 'helm-gtags-find-rtag)
(global-set-key (kbd "M-g ,") 'helm-gtags-pop-stack)
(global-set-key (kbd "M-g f") 'helm-gtags-find-files)
(global-set-key (kbd "M-g u") 'helm-gtags-update-tags)
(global-set-key (kbd "M-g s") 'helm-gtags-find-symbol)



;; projectile mode
(projectile-mode t)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

;; org mode settings
(setq org-log-done 'time)
(setq org-todo-keywords
	'((sequence "TODO(t)" "FEEDBACK(f!/@)" "VERIFY(v!)" "DOING(i!)" "WAIT(w!)" "REOPEN(r@/!)" "|" "DONE(d!)" "CANCELED(c@)" "DELEGATED(g@)")))

(setq org-clock-persist 'history)
;; (org-clock-persistence-insinuate)
(add-hook 'org-mode-hook
		  (lambda () (setq truncate-lines nil)))
;; (setq org-cycle-separator-lines 0)

;; org-capture settings
(setq org-directory "~/MEGA/Public/TODOs/")
(setq org-default-notes-file "~/MEGA/Public/TODOs/inbox.org")

(global-set-key (kbd "C-c c") 'org-capture)

(setq org-agenda-files (list "~/MEGA/Public/TODOs/task.org"
							 "~/MEGA/Public/TODOs/project.org"
							 "~/MEGA/Public/TODOs/note.org"
							 "~/MEGA/Public/TODOs/inbox.org"))


(setq org-refile-targets
	  (quote (("~/MEGA/Public/TODOs/task.org" :maxlevel . 2)
			  ("~/MEGA/Public/TODOs/project.org" :level . 2)
			  ("~/MEGA/Public/TODOs/finished.org" :level . 2)
			  ("~/MEGA/Public/TODOs/trash.org" :level . 2)
			  )))

(setq org-capture-templates
	  (quote (("i" "Inbox" entry (file "~/MEGA/Public/TODOs/inbox.org")
			   "* TODO %?\n%U\n%a\n")
			  ("n" "Note" entry (file "~/MEGA/Public/TODOs/note.org")
			   "* %?\n%T\n")
			  ("t" "Task" entry (file+headline "~/MEGA/Public/TODOs/task.org" "Tasks")
			   "* TODO %?\n%T\n")
			  ("d" "Idea" entry (file+headline "~/MEGA/Public/TODOs/task.org" "Ideas")
			   "* TODO %?\n%T\n")
			  
			  )))




;; ******************* other settings *******************




;; other settings
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
	(pomodoro company-php php-company ggtags gtags helm-gtags iedit company-web helm-cscope helm-flycheck magit magit-gitflow magit-svn redis ac-emmet chinese-wbim ecb git-command helm-projectile restclient-helm auto-compile ac-html-angular angular-snippets ng2-mode nginx-mode ido-vertical-mode better-shell company-shell flymake-shell composer docker dockerfile-mode angular-mode emacsql-mysql git ac-php helm-ls-git helm-git-files auto-complete helm-emmet helm-git atom-dark-theme atom-one-dark-theme bash-completion sublime-themes helm web-mode smartparens restclient quickrun projectile phpunit php-mode maker-mode heroku flycheck feature-mode expand-region ensime auto-highlight-symbol ac-helm))))
'(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
