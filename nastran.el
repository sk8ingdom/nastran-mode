;; (require 'vvb-mode)
;; (load "~/.emacs.d/plugins/vvb-mode")

;; (setq-default vvb-columns '(9 17 25 33 41 49 57 65 73 81)
;;               vvb-sticky-p nil
;;               vvb-permanent-p t)

;; (add-to-list 'auto-mode-alist (("\\.bdf\\'" . nastran-mode)
;;                                ("\\.dat\\'" . nastran-mode)
;;                                ("\\.bas\\'" . nastran-mode)))

(load "~/.emacs.d/plugins/fill-column-indicator.el")
(setq fci-rule-column 80)

(load "~/.emacs.d/plugins/column-marker")

(defvar nastran-font-lock-keywords
  (list
   '("^\\$.*$" . font-lock-comment-face)
   '("^\*[a-zA-Z].*[^a-zA-Z]" . font-lock-keyword-face)
   '("^[ \t]+$" . highlight)))

(defvar nastran-columns '(9 17 25 33 41 49 57 65 73))

(defun nastran-columns ()
  (column-marker-create column-marker-9)
  (column-marker-9 9)
  (column-marker-create column-marker-17)
  (column-marker-17 17)
  (column-marker-create column-marker-25)
  (column-marker-25 25)
  (column-marker-create column-marker-33)
  (column-marker-33 33)
  (column-marker-create column-marker-41)
  (column-marker-41 41)
  (column-marker-create column-marker-49)
  (column-marker-49 49)
  (column-marker-create column-marker-57)
  (column-marker-57 57)
  (column-marker-create column-marker-65)
  (column-marker-65 65)
  (column-marker-create column-marker-73)
  (column-marker-73 73))

(defun nastran-mode ()
  (interactive)
  (setq mode-name "nastran")
  (setq major-mode
        'nastran-mode
        mode-name "Nastran"
        font-lock-defaults '(nastran-font-lock-keywords)
        require-fine-newline t)
  (make-local-variable 'font-lock-defaults)
  (setq font-lock-defaults '(nastran-font-lock-keywords))
  (run-hooks 'nastran-mode-hook)
  ;; (use-local-map nastran-mode-map)
  ;; (while nastran-columns
  ;;  (column-marker-create (intern (concat "column-marker-" (number-to-string (car nastran-columns)))))
  ;;  (setq nastran-columns (cdr nastran-columns))))
  ;;(nastran-columns))
  )

(provide 'nastran-mode)
;; (run-hooks 'nastran-mode-hook)
