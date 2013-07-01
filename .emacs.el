(setq line-number-mode t
      column-number-mode t
      size-indication-mode t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t
      tramp-default-method "ssh"
      show-trailing-whitespace t
      helm-idle-delay 0.1
      helm-input-idle-delay 0.1
      helm-quick-update t
      whitespace-style '(face
                         trailing tabs empty
                         space-after-tab space-after-tab
                         tab-mark)
      package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/"))
      ;; Blame it on the HHKB, but feels awesome
      mac-option-modifier 'super
      mac-command-modifier 'meta)

(require 'package)
(package-initialize)

(dolist (p '(helm
             helm-ls-git
             helm-descbinds
             rainbow-delimiters
             multiple-cursors
             paredit
             git-commit-mode
             magit
             clojure-mode
             clojure-test-mode
             nrepl
             coffee-mode))
  (when (not (package-installed-p p))
    (package-install p)))

(dolist (r '(helm-config
             helm-ls-git
             multiple-cursors
             rainbow-delimiters
             paredit
             whitespace))
  (require r))

(set-default-font "Inconsolata 16")
;;(load-theme 'wombat)

(tool-bar-mode -1)
(defalias 'yes-or-no-p 'y-or-n-p)

(global-whitespace-mode t)
(helm-mode 1)
(helm-descbinds-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "C-x f") 'helm-for-files)

;; Airbnb reserves tabs to Makefiles.
(setq-default indent-tabs-mode nil)

(server-start)
