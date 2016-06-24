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

(show-paren-mode 1)
(setq show-paren-delay 0)

(add-hook 'before-save-hook #'delete-trailing-whitespace)

(load-theme 'zenburn t)

;; CIDER
(add-hook 'clojure-mode-hook 'paredit-mode)
(setq cider-prompt-save-file-on-load 'always-save)
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)
(add-hook 'cider-repl-mode-hook #'paredit-mode)
(add-hook 'cider-mode-hook #'eldoc-mode)

;; ido
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Compojure
(require 'clojure-mode)

(define-clojure-indent
  (defroutes 'defun)
  (GET 2)
  (POST 2)
  (PUT 2)
  (DELETE 2)
  (HEAD 2)
  (ANY 2)
  (context 2))
