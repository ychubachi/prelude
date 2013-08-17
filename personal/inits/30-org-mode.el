;;; 30-org-mode.el -- Org mode
;;; Commentary:
;;; Code:

(prelude-require-package 'org-mode)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;;; 30-org-mode.el ends here
