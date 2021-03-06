;;; hide-new-lines.el --- hide-new-line configuration
;;; Commentary:
;;; Code:

(defun hide-ctrl-M ()
  "Hides the disturbing '^M' showing up in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

;;; hide-new-lines.el ends here
