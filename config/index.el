;;; index.el --- configuration loader
;;; Commentary:
;;; Code:

(require 'package)
(package-initialize)
(setq package-archives nil)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
;;(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/") t)
;;(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
;;(add-to-list 'package-archives '("elpy" . "https://jorgenschaefer.github.io/packages/") t)

(setq package-list
      '(restart-emacs ;; support only linux and windows
        smex ;; minibuffer improvements
        ;; ido-vertical-mode
        multiple-cursors
        company ;; autocompletition
        company-statistics
        ;; projectile ;; project management
        highlight-indentation ;; or highlight-indent-guides
        rainbow-delimiters ;; rainbow parentheses
        js2-mode js2-refactor rjsx-mode less-css-mode php-mode
        pug-mode yaml-mode markdown-mode json-mode dockerfile-mode svelte-mode
        haskell-mode web-mode
        eslint-fix ;; fix current file using ESLint
        js-comint ;; js repl
        bongo volume ;; media player
        magit ;; git support
        highlight-symbol ;; highlight occurrences
        google-translate
        yasnippet ;; template system
        yasnippet-snippets
        ivy-yasnippet
        vimish-fold ;; fold-unfold library
        ;; wakatime-mode ;; time tracking
        xah-find
        avy
        expand-region ;; fast text selection
        ;; dumb-jump ;; jump to variable definition
        bm ;; visible bookmarks
        syntax-subword ;; make word editing and motion more fine-grained
        smartscan ;; jumps between other symbols found at point
        goto-chg ;; goto-last-change
        ivy ;; completion for Emacs
        counsel ;;  Ivy-enhanced versions of common Emacs commands
        swiper ;; Ivy-enhanced alternative to isearch
        diff-hl ;; git highlights
        drag-stuff ;; drag stuf around
        restclient ;; rest client
        company-restclient ;; restclient completions
        popup-kill-ring ;; kill ring menu
        ;; trr ;; type-writing trainer
        ;; speed-type ;; practice touch/speed typing in emacs
        flycheck ;; syntax checking
        undo-propose ;; stage undo’s in a temporary buffer
        ;; undo-fu ;; linear undo with redo
        ag ;; search using ag (the silver searcher)
        rg ;; search using ripgrep
        editorconfig ;; editorconfig plugin
        ob-mongo ;; mongodb support for org-mode
        typescript-mode tide
        rust-mode racer
        lsp-mode dap-mode
        ))

;; install packages from list
;; check installed packages
(setq need_package_install nil)
(dolist (package package-list)
  (if(not(package-installed-p package))
      (setq need_package_install t)))
(if need_package_install ;; install packages if need
    (progn
      (package-refresh-contents) ;; fetch list of packages available in melpa
      (dolist (package package-list) ;; install the missing packages
        (unless (package-installed-p package)
          ;; (if (y-or-n-p (format "Package \"%s\" is missing. Do you want to install it? " package))
          (package-install package)
          ;; )
          ))))

(defun load-directory (path files)
  "Load files from a path, parameter \"path\" is a directory path and \"files\" is a file list."

  (if (and (stringp path) (not (null files)))
      (dolist (file files)
        (load (concat path file)))))

;; lisp files (configs, params)
(setq lisp-list ;; "doom-modeline" "highlight-indent-guides" "ido-vertical" "wakatime"
      `(
        "ag" "avy" "bm" "font"
        ,(concat (file-name-as-directory "column-marker") "highlight-100-mode")
        "company" "css" "dockerfile" "drag-stuff" "eshell" "flycheck" "google-translate"
        "grep" "haskell" "hide-new-line" "highlight-indentation" "highlight-symbol" "highlight-words"
        "ivy" "json" "js-typescript" "markdown" "midnight-mode" "mode-line" "org" "perl" "php"
        ,(concat (file-name-as-directory "pomodoro") "pomodoro-setup")
        "pug" "recentf-mode" "restclient" "rust" "smex" "svelte" "vimish-fold" "webjump"
        "xah-change-bracket-pairs" "xah-syntax-color-hex" "yaml" "yasnippet" "dired"
        "prog-mode" "base-setup" ;; last modes
        ))

;; common configs
(setq common-list '("indentation" "theme" "whitespace" "keybindings" "search"))

(load (concat (file-name-directory load-file-name) (file-name-as-directory "common") "configs")) ;; load configs file ( see for params )

(setq need_emacs_restart nil) ;; change while initialization

;; load files
(load (concat configs_dir (file-name-as-directory "common") "projects")) ;; project specific params before
(load-directory (concat configs_dir (file-name-as-directory "lisp")) lisp-list)
(load-directory (concat configs_dir (file-name-as-directory "common")) common-list)

(if need_emacs_restart
    (if (or
         (string-equal system-type "gnu/linux")
         (string-equal system-type "windows-nt"))
        (restart-emacs)
      (kill-emacs))) ;; if no linux/windows

;;; index.el ends here
