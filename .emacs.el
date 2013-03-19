(load "~/repos/tomorrow-theme/GNU Emacs/tomorrow-night-bright-theme")
(custom-set-variables
 '(column-number-mode t)
 '(size-indication-mode t))
(set-default-font "Droid Sans Mono 14")

(let ((base "~/.emacs.d/vendor"))
  (dolist (f (directory-files base))
    (let ((name (concat base "/" f)))
      (when (and (file-directory-p name) 
                 (not (equal f "..")))
        (add-to-list 'load-path name)))))

(require 'iedit)
(require 'flymake)
(require 'flymake-puppet)
(require 'rainbow-delimiters)
(require 'peepopen)
(require 'textmate)
(textmate-mode)
(setq ns-pop-up-frames nil)

(setq tramp-default-method "ssh")
(setq flymake-run-in-place nil)

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet manifests")
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))

(server-start)
