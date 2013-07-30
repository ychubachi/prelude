;;; expand-region.el --- リージョンの拡大/縮小
;;; Commentary:
;;; Change Log: Created on 2013-07-30
;;; Code:

;; パッケージのインストール
(defvar package-list '(expand-region))
(dolist (package package-list)
  (when (not (package-installed-p package))
    (package-install package)))

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "M-=") 'er/contract-region)
;;; 30-expand-region.el ends here
