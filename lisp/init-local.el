(setq custom-safe-themes t)
(setq frame-background-mode 'dark)
(set-terminal-parameter nil 'background-mode 'dark)
(require-package 'solarized-theme)

(set-face-attribute 'default t :font "Inconsolata for Powerline 13" )
;; (set-face-attribute 'default t :font "DejaVu Sans Mono for Powerline 14" )
;; (set-frame-font "Inconsolata for Powerline 13" nil t)


(require-package 'airline-themes)
(require-package 'powerline)

(load-file "~/sources/airline-themes/airline-themes.el")
(load-theme 'airline-solarized-gui)
(load-theme 'solarized-dark)
(setq-default custom-enabled-themes '(solarized-dark airline-solarized-alternate-gui))
(setq powerline-utf-8-separator-left        #xe0b0
      powerline-utf-8-separator-right       #xe0b2
      airline-utf-glyph-separator-left      #xe0b0
      airline-utf-glyph-separator-right     #xe0b2
      airline-utf-glyph-subseparator-left   #xe0b1
      airline-utf-glyph-subseparator-right  #xe0b3
      airline-utf-glyph-branch              #xe0a0
      airline-utf-glyph-readonly            #xe0a2
      airline-utf-glyph-linenumber          #xe0a1)

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
  "m" 'recentf-open-files
  "p" 'py-autopep8-enable-on-save)

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

(global-set-key (kbd "M-h")  'windmove-left)
(global-set-key (kbd "M-j")  'windmove-down)
(global-set-key (kbd "M-k")  'windmove-up)
(global-set-key (kbd "M-l")  'windmove-right)
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

(require-package 'py-autopep8)
(setq py-autopep8-options '("--max-line-length=160" "--ignore=E309"))
(add-hook 'anaconda-mode-hook 'py-autopep8-enable-on-save)

(require-package 'go-mode)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

(global-prettify-symbols-mode 0)


(setq require-final-newline t)

(provide 'init-local)
