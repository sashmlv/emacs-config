;;; hooks --- hooks configuration:
;;; Commentary:
;;; Code:

;; * START - Highlight indentation hook *
(highlight-indentation-mode 1) ;; for disable error
(add-hook 'highlight-indentation-mode-hook (lambda()(setq highlight-indentation-offset current_indent))) ;; set indent size ;; "current_indent" in index.el
(add-hook 'prog-mode-hook 'highlight-indentation-mode) ;; highlight indent on each buffer
(set-face-background 'highlight-indentation-face indentation_color) ;; "indentation-color" in index.el
(set-face-background 'highlight-indentation-current-column-face indentation_current_line_color) ;; "indentation-current-line-color" in index.el
;; * END *

;; js2-mode on js files
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;; tern-mode
;; (add-hook 'js2-mode-hook (lambda () (tern-mode t)))

;; less-css-mode on less files
(add-to-list 'auto-mode-alist '("\\.less\\'" . less-css-mode))
;; highlight colors
(add-hook 'less-css-mode-hook 'xah-syntax-color-hex)

;; pug-mode on pug files
(add-to-list 'auto-mode-alist '("\\.\\(jade\\|pug\\)\\'" . pug-mode))

;; yaml-mode on yml files
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

;; web-mode on php files
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))

;; * Disable error on free variables *
;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; hooks.el ends here
