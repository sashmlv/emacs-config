;;; index --- configuration loader:
;;; Commentary:
;;; Code:
;; * Parameters and loading other config files *

;; Package repositories
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(setq need_emacs_restart nil)
(defconst configs_dir "/media/user/disk/emacs-config/configs/")
(defconst base_dir (concat (file-name-as-directory (getenv "HOME")) (file-name-as-directory ".emacs.d")))
(defconst backups_dir (concat base_dir (file-name-as-directory "backups")))
(defconst themes_dir (concat configs_dir (file-name-as-directory "themes")))
(defconst undo_redo_dir (concat base_dir (file-name-as-directory "undo_redo"))) ;; save undo-redo history in this dir

(defconst current_font "Fira Mono-9")
(defconst current_indent 3)
(defconst indentation_color "#101010")
(defconst indentation_current_line_color "#101010")

(defconst brackets_match_foreground "white")
(defconst brackets_match_background "blue3")
(defconst brackets_mismatch_foreground "white")
(defconst brackets_mismatch_background "red3")

(defconst whitespace_foreground "#212121")
(defconst whitespace_background "#070707")
(defconst whitespace_weight 'light)

(defconst whitespace_trailing_foreground "#ff2020")
(defconst whitespace_trailing_background "#070707")
(defconst whitespace_trailing_weight 'light)

(defconst hl_line_background "#101010")
(defconst hl_region_background "#232323")
(defconst hl_occurrences_color "cyan")

(defconst cursor_color "green2")

;; is need use undo-tree history files
(defconst use_undo_tree_history_files t)

;; yasnippets directory
(defconst yasnippets_directory (concat configs_dir (directory-file-name "yasnippets")))

;; define theme for window
;; (set 'win-theme 'sunburst)
(set 'win-theme 'flatland-black)

;; define theme for terminal
(set 'term-theme 'sunburst)

;; Packages list
(setq package-list '(
                     restart-emacs ;; support only linux and windows
                     smex ;; minibuffer improvements
                     undo-tree ;; undo-redo history
                     multiple-cursors
                     company ;; autocompletition
                     company-statistics
                     projectile ;; project management
                     highlight-indentation
                     js2-mode js2-refactor typescript-mode less-css-mode php-mode pug-mode yaml-mode markdown-mode json-mode rjsx-mode
                     bongo volume ;; media player
                     syntax-subword ;; subword navigation
                     magit ;; git support
                     highlight-symbol ;; highlight occurrences
                     google-translate
                     dockerfile-mode
                     yasnippet ;; template system
                     vimish-fold ;; fold-unfold library
                     wakatime-mode ;; for time tracking
                     xah-find
                     ido-vertical-mode
                     ace-jump-mode
                     indium ;; see for setup: https://indium.readthedocs.io/en/latest/setup.html
                     expand-region ;; expand-region for fastest text selection
                     )
      )

;; Prepare config directories *
(if(not(file-accessible-directory-p backups_dir))
   (make-directory backups_dir t)
  )
(if(not(file-accessible-directory-p undo_redo_dir))
   (make-directory undo_redo_dir t)
  )

;; Load configs
(load (concat configs_dir (file-name-as-directory "modes") "base-setup"))
(load (concat configs_dir (file-name-as-directory "modes") "multiple-cursors"))
(load (concat configs_dir (file-name-as-directory "modes") "smex"))
(load (concat configs_dir (file-name-as-directory "modes") "ido-vertical"))
(load (concat configs_dir (file-name-as-directory "modes") "whitespace"))
(load (concat configs_dir (file-name-as-directory "modes") "highlight-symbol"))
(load (concat configs_dir (file-name-as-directory "modes") "google-translate"))
(load (concat configs_dir (file-name-as-directory "modes") "markdown"))
(load (concat configs_dir (file-name-as-directory "modes") "xah-syntax-color-hex"))
(load (concat configs_dir (file-name-as-directory "modes") "xah-change-bracket-pairs"))
(load (concat configs_dir (file-name-as-directory "modes") "undo-tree"))
(load (concat configs_dir (file-name-as-directory "modes") "ace-jump"))
(load (concat configs_dir (file-name-as-directory "modes") "vimish-fold"))
(load (concat configs_dir (file-name-as-directory "modes") "yasnippet"))
(load (concat configs_dir (file-name-as-directory "modes") "wakatime"))
(load (concat configs_dir (file-name-as-directory "common") "indentation"))
(load (concat configs_dir (file-name-as-directory "common") "hooks"))

;; Set some parameters
;; (set-background-color "#000")

;; restart emacs if needed
(if need_emacs_restart
    (if (or (string-equal system-type "gnu/linux") (string-equal system-type "windows-nt")) ;; if linux or windows
        (restart-emacs)
      (kill-emacs) ;; on other type system
      )
  )

;; * Disable error on free variables *
;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; index.el ends here
