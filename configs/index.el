;;; index --- configuration loader:
;;; Commentary:
;;; Code:
;; * Parameters and loading other config files *

;; TODO:
;; - move params in index.el

;; * START - Params *
(setq directory-root "/media/user/disk/emacs-config/configs/")
(defconst base-dir "~/.emacs.d/")
(defconst config-dir (concat base-dir "configs/"))
(defconst backups-dir (concat base-dir "backups/"))
(defconst themes-dir (concat directory-root "themes/"))
(defconst font "Menlo-9")
(defconst space-indent 3) ;; 3 spaces ;; used in indentation.el
(defconst indentation-color "#101010") ;; used in hooks.el
(defconst indentation-current-line-color "#101010") ;; used in hooks.el

;; define theme for window
(set 'win-theme 'sunburst)

;; define theme for terminal
(set 'term-theme 'sunburst)

;; Packages list
(setq package-list '(
                     smex
                     undo-tree
                     multiple-cursors
                     company
                     company-statistics
                     projectile
                     js2-mode
                     highlight-indentation
                     less-css-mode
                     web-mode
                     pug-mode
                     )
      )
;; * END *

;; Load configs
(load (concat directory-root "base"))
(load (concat directory-root "indentation"))
(load (concat directory-root "hooks"))



;; * Disable error on free variables *
;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; index.el ends here
