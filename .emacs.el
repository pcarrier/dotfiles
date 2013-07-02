(setq line-number-mode t
      column-number-mode t
      size-indication-mode t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t
      tramp-default-method "ssh"
      ido-enable-flex-matching t
      ido-everywhere t
      ido-use-filename-at-point 'guess
      ido-create-new-buffer 'always
      ido-enable-prefix t
      ido-enter-matching-directory 'only
      whitespace-style '(face
                         trailing tabs empty
                         space-after-tab space-after-tab
                         tab-mark)
      package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(require 'package)
(package-initialize)

(dolist (p '(rainbow-delimiters
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

(dolist (r '(multiple-cursors
             rainbow-delimiters
             paredit
             whitespace
             ido))
  (require r))

(set-default-font "Inconsolata 14")
;;(load-theme 'wombat)

(tool-bar-mode -1)
(defalias 'yes-or-no-p 'y-or-n-p)

(ido-mode 1)
(global-whitespace-mode t)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Airbnb reserves tabs to Makefiles.
(setq-default indent-tabs-mode nil)

(server-start)
