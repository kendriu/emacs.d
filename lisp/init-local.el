(setq custom-safe-themes t)
(setq frame-background-mode 'dark)
(set-terminal-parameter nil 'background-mode 'dark)

(require-package 'solarized-theme)
(load-theme 'solarized-dark)

(require-package 'airline-themes)
(require-package 'powerline)
(load-theme 'airline-solarized-alternate-gui)

(desktop-save-mode 1)
(global-linum-mode t)

(require-package 'evil)
(evil-mode t)

(require-package 'evil-nerd-commenter)
(evilnc-default-hotkeys)

(require-package 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-key
  "b" 'buffer-menu
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

(setq-default flycheck-flake8-maximum-line-length 99)
(require-package 'yasnippet)
(yas-global-mode 1)
;; jedi
(require-package 'virtualenvwrapper)
(require-package 'jedi)
(defun project-directory (buffer-name)
  "Returns the root directory of the project that contains the
given buffer. Any directory with a .git or .jedi file/directory
is considered to be a project root."
  (interactive)
  (let ((root-dir (file-name-directory buffer-name)))
    (while (and root-dir
                (not (file-exists-p (concat root-dir ".git")))
                (not (file-exists-p (concat root-dir ".jedi"))))
      (setq root-dir
            (if (equal root-dir "/")
                nil
              (file-name-directory (directory-file-name root-dir)))))
    root-dir))

(defun project-name (buffer-name)
  "Returns the name of the project that contains the given buffer."
  (let ((root-dir (project-directory buffer-name)))
    (if root-dir
        (file-name-nondirectory
         (directory-file-name root-dir))
      nil)))

(defun jedi-setup-venv ()
  "Activates the virtualenv of the current buffer."
  (let ((project-name (project-name buffer-file-name)))
    (when project-name (venv-workon project-name))))

(setq jedi:complete-on-dot t)
(add-hook 'python-mode-hook 'jedi-setup-venv)
(add-hook 'python-mode-hook (lambda ()
                              (hack-local-variables)
                              (venv-workon project-venv-name)))
(add-hook 'python-mode-hook 'jedi:setup)

(require-package 'company-jedi)
(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)
;; end jedi


(setq ring-bell-function 'ignore)

(require-package 'smerge-mode)
(setq smerge-command-prefix "\C-xv")

(require-package 'evil-indent-plus)
(evil-indent-plus-default-bindings)

(require-package 'go-mode)

(provide 'init-local)
