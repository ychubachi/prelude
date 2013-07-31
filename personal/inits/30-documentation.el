;;; 30-documentation.el --- 文書作成用
;;; Commentary:
;;; Code:

;; ================================================================
;; markdownモードでアウトラインを有効にする
;; ================================================================
(add-hook 'markdown-mode-hook
          '(lambda () (outline-minor-mode t)))

;;; 30-documentation.el ends here
