(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://stable.melpa.org/packages/") t)

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'clojure-mode)
  (package-install 'clojure-mode))

(unless (package-installed-p 'cider)
  (package-install 'cider))

(unless (package-installed-p 'paredit)
  (package-install 'paredit))

(unless (package-installed-p 'company)
  (package-install 'company))

(show-paren-mode 1)
(menu-bar-mode -1)

(add-hook 'before-save-hook #'delete-trailing-whitespace)

(load-theme 'tango-dark t)

;; CIDER
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)
(add-hook 'cider-repl-mode-hook #'paredit-mode)
(add-hook 'cider-mode-hook #'eldoc-mode)

;; ido
(ido-mode 1)

(setq inhibit-splash-screen t
      inhibit-startup-message t
      backup-inhibited t
      show-paren-delay 0
      ido-enable-flex-matching t
      ido-everywhere t
      cider-prompt-save-file-on-load 'always-save)
