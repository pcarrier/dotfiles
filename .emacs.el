;; Hey dude, welcome to Emacs.
;; Use C-h v and C-h f to get docs for vars and fun.

(setq save-plate t
      line-number-mode t
      column-number-mode t
      size-indication-mode t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t
      tramp-default-method "ssh"
      ido-enable-flex-matching t
      ido-everywhere t
      ido-use-filename-at-point 'guess
      ido-create-new-buffer 'always
      ido-enable-prefix nil
      ido-auto-merge-work-directories-length nil
      ido-enter-matching-directory 'only
      ido-use-virtual-buffers t
      ido-max-prospects 10
      next-screen-context-lines 10
      frame-title-format '(buffer-file-name "%f" ("%b"))
      diff-switches "-u"
      visible-bell t
      color-theme-is-global t
      shift-select-mode nil
      sentence-end-double-space nil
      mouse-yank-at-point t
      default-frame-alist '((width . 120) (height . 60))
      ruby-deep-indent-paren nil
      whitespace-style '(face
                         trailing tabs empty
                         space-after-tab space-after-tab
                         tab-mark)
      package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(setq-default indent-tabs-mode nil      ; Airbnb says tabs are for Makefiles
              indicate-empty-lines t
              imenu-auto-rescan t)


(require 'package)
(package-initialize)
(dolist (p '(ido-ubiquitous
             rainbow-delimiters
             multiple-cursors
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
             fiplr
             ffap))
  (when (not (package-installed-p p))
    (package-install p)))


(dolist (r '(multiple-cursors
             paredit
             saveplace))
  (require r))

;(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)
(blink-cursor-mode -1)
(mouse-wheel-mode t)
(global-hl-line-mode t)

(set-default-font "Consolas 14")
(load-theme 'tango)
;;(list-colors-display) can help
(set-face-background hl-line-face "white")

(defalias 'yes-or-no-p 'y-or-n-p)

(ido-mode t)
(ido-ubiquitous t)
(show-paren-mode 1)
(global-whitespace-mode t)
(smex-initialize)

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook 'idle-highlight-mode)

;; Multiple Cursors awesomeness
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Smex is da shit
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(global-set-key (kbd "C-c f") 'fiplr-find-file)
(global-set-key (kbd "M-/") 'hippie-expand)
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; Don't hate, I like the OSX style
(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-buffer)
(global-set-key (kbd "s-<left>") 'beginning-of-line)
(global-set-key (kbd "s-<right>") 'end-of-line)
(global-set-key (kbd "s-<up>") 'scroll-down)
(global-set-key (kbd "s-<down>") 'scroll-up)

;; Regexp all the things
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "M-%") 'query-replace-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)
(global-set-key (kbd "C-M-%") 'query-replace)

;; imenu jumps
(global-set-key (kbd "C-x C-i") 'imenu)

;; Window jumper with M-arrow (no parm for S-)
(windmove-default-keybindings 'meta)

;; Eshell
;; Start/join
(global-set-key (kbd "C-x m") 'eshell)
;; Always start
(global-set-key (kbd "C-x M") (lambda () (interactive) (eshell t)))

;; Git
(global-set-key (kbd "C-c g") 'magit-status)

;; Lisp
(define-key read-expression-map (kbd "TAB") 'lisp-complete-symbol)
(define-key lisp-mode-shared-map (kbd "RET") 'reindent-then-newline-and-indent)

(defun pretty-fns ()
  (font-lock-add-keywords
   nil `(("(\\(\\<fn\\>\\)"
          (0 (progn (compose-region (match-beginning 1) (match-end 1) ?\u0192)
                    nil))))))
(add-hook 'prog-mode-hook 'pretty-fns)

(defun pretty-lambdas ()
  (font-lock-add-keywords
   nil `(("(?\\(lambda\\>\\)"
          (0 (progn (compose-region (match-beginning 1) (match-end 1) ?\u03bb)
                    nil))))))
(add-hook 'prog-mode-hook 'pretty-lambdas)

(defun sudo-it (&optional arg)
  (interactive "p")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

;; When I kill a buffer, I'm done with it.
;; So feel free to release emacsclient
(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)

;; Let's gooo!
(server-start)
