(require 'package)

(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
	("melpa-stable" . "http://stable.melpa.org/packages/")))

(package-initialize)

(setq url-http-attempt-keepalives nil)

(setq inhibit-splash-screen t
      inhibit-startup-message t
      backup-inhibited t)

(menu-bar-mode -1)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'clojure-mode)
  (package-install 'clojure-mode))

(unless (package-installed-p 'cider)
  (package-install 'cider))

(unless (package-installed-p 'paredit)
  (package-install 'paredit))

(unless (package-installed-p 'zenburn-theme)
  (package-install 'zenburn-theme))

(load-theme 'zenburn t)

(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
