(setq custom-safe-themes t)
(setq frame-background-mode 'dark)
(set-terminal-parameter nil 'background-mode 'dark)

(require-package 'solarized-theme)

(require-package 'airline-themes)
(require-package 'powerline)

(load-file "~/sources/airline-themes/airline-themes.el")
(load-theme 'airline-solarized-gui)
(load-theme 'solarized-dark)
(setq-default custom-enabled-themes '(solarized-dark airline-solarized-alternate-gui))

(desktop-save-mode 1)
(global-linum-mode t)

(require-package 'evil)
(evil-mode t)

(require-package 'evil-nerd-commenter)
(evilnc-default-hotkeys)

(require-package 'evil-surround)
(global-evil-surround-mode 1)

(require-package 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-key
  "b" 'ibuffer
  "d" 'projectile-find-file
  "g" 'magit-status
  "w" 'projectile-save-project-buffers
  "s" 'projectile-ag
  "m" 'recentf-open-files)

(require-package 'neotree)
(global-set-key (kbd "<f2>") 'neotree-toggle)
(setq neo-smart-open t)
(add-hook 'neotree-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

(require-package 'beacon)
(beacon-mode 1)
(blink-cursor-mode -1)

(windmove-default-keybindings)
(setq windmove-wrap-around t)

(setq-default flycheck-flake8-maximum-line-length 160)
(require-package 'yasnippet)
(yas-global-mode 1)

(setq ring-bell-function 'ignore)

(require-package 'evil-indent-plus)
(evil-indent-plus-default-bindings)
(define-key evil-normal-state-map (kbd "M-.") nil)

(defun run-python-once ()
  (remove-hook 'anaconda-mode-hook 'run-python-once)
  (switch-to-buffer (last-buffer))
  (run-python (python-shell-parse-command))
  (split-window-sensibly)
  (switch-to-buffer-other-window (python-shell-get-buffer)))

(add-hook 'anaconda-mode-hook 'run-python-once)

(pythonic-activate "~/.virtualenvs/turbo")
(require-package 'go-mode)

(provide 'init-local)
