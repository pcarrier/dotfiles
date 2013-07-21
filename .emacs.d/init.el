;; Hey dude, welcome to Emacs.
;; Use C-h v and C-h f to get docs for vars and fun.

(setq make-backup-files nil
      auto-save-default nil
      save-place t
      inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t
      tramp-default-method "ssh"
      ido-enable-flex-matching t
      ido-everywhere t
      ;; doesn't play nice with projectile
      ;; ido-use-filename-at-point 'guess
      ido-create-new-buffer 'always
      ido-enable-prefix nil
      ido-auto-merge-work-directories-length nil
      ido-enter-matching-directory 'only
      ido-use-virtual-buffers t
      next-screen-context-lines 5
      frame-title-format '(buffer-file-name "%f" ("%b"))
      diff-switches "-u"
      ;; visible-bell t
      shift-select-mode nil
      sentence-end-double-space nil
      mouse-yank-at-point t
      default-frame-alist '((width . 120) (height . 60))
      ruby-deep-indent-paren nil
      european-calendar-style t
      uniquify-buffer-name-style 'post-forward-angle-brackets
      uniquify-after-kill-buffer-p t
      ac-dwim t
      ;; pop-up-frames t ; pops just too many frames :)

      undo-tree-auto-save-history t
      undo-tree-visualizer-diff t
      undo-tree-visualizer-timestamps t

      isearch-allow-scroll t
      ns-auto-hide-menu-bar t
      ns-use-native-fullscreen nil
      projectile-keymap-prefix (kbd "s-/")

      projectile-ack-function '(ag-regexp)
      ag-highlight-search t
      scheme-program-name "csi -:c"
      ;; Seems to cause some issues: projectile-enable-caching t
      whitespace-style '(face
                         trailing tabs empty
                         space-after-tab space-after-tab
                         tab-mark)
      package-archives '(("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))

(setq-default indent-tabs-mode nil      ; Airbnb says tabs are for Makefiles
              indicate-empty-lines t
              imenu-auto-rescan t)

(require 'package)
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(dolist (p '(undo-tree
             rainbow-delimiters
             multiple-cursors
             ace-jump-mode
             paredit
             git-commit-mode
             magit
             clojure-mode
             clojure-test-mode
             markdown-mode
             nrepl
             coffee-mode
             smex
             idle-highlight-mode
             ffap
             projectile
             auto-complete
             ac-nrepl
             nginx-mode
             ruby-tools
             ag
             debian-changelog-mode
             scheme-complete
             dtrt-indent
             expand-region
             ido-vertical-mode
             editorconfig
             flymake-cursor
             flymake-ruby
             flymake-lua
             flymake-coffee
             align-cljlet
             lua-mode))
  (when (not (package-installed-p p))
    (package-install p)))

(dolist (r '(multiple-cursors
             saveplace
             uniquify
             auto-complete-config
             ac-nrepl
             editorconfig
             ruby-tools))
  (require r))

(blink-cursor-mode -1)
(global-hl-line-mode 1)
(dtrt-indent-mode 1)
(delete-selection-mode 1)
(global-linum-mode 1)
(show-paren-mode 1)
(global-whitespace-mode 1)
(which-function-mode 1)
(electric-indent-mode 1)
(electric-layout-mode 1)
(electric-pair-mode 1)
(global-reveal-mode 1)
(ido-mode 1)
(ido-vertical-mode 1)
(line-number-mode 1)
(column-number-mode 1)
(size-indication-mode -1)
(global-visual-line-mode 1)
(transient-mark-mode 1)

;; Stupid under OSX, it's free ;)
;;(menu-bar-mode -1)
(when window-system
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1)
  (mouse-wheel-mode 1)
  (set-frame-font "Source Code Pro 12" nil t)
  (load-theme 'leuven)
  (set-face-background hl-line-face "ghost white"))

(defalias 'yes-or-no-p 'y-or-n-p)
(projectile-global-mode)
(smex-initialize)

;; Auto-complete awesomeness
(ac-config-default)

(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'nrepl-mode))
(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))
(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)
(define-key nrepl-interaction-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc)
(add-hook 'nrepl-interaction-mode-hook 'set-auto-complete-as-completion-at-point-function)

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook 'idle-highlight-mode)
(add-hook 'prog-mode-hook (lambda () (flymake-mode 1)))

;; Multiple Cursors awesomeness
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this) ;; Smex is da shit
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;;(global-set-key (kbd "M-/") 'hippie-expand)

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; expand-region is real nice
(global-set-key (kbd "C-=") 'er/expand-region)

;; Regexp all the things
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "M-%") 'query-replace-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)
(global-set-key (kbd "C-M-%") 'query-replace)

;; imenu jumps
(global-set-key (kbd "C-x C-i") 'imenu)

;; Window jumper with M-arrow
(windmove-default-keybindings 'meta)
(setq windmove-wrap-around t)

;; Ace Jump
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)

;; Eshell
;; Start/join
(global-set-key (kbd "C-x m") 'eshell)
;; Always start
(global-set-key (kbd "C-x M") (lambda () (interactive) (eshell t)))

;; Git
(global-set-key (kbd "C-c g") 'magit-status)

(defun sudo-it (&optional arg)
  (interactive "p")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

;; When I kill a buffer, I'm done with it.
;; So feel free to release emacsclient
(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)

;;(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
(define-key nrepl-interaction-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc)

(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer.
   Including indent-buffer, which should not be called automatically on save."
  (interactive)
  (untabify-buffer)
  (delete-trailing-whitespace)
  (indent-buffer))

(global-set-key (kbd "C-c i") 'cleanup-buffer)

(server-start)
