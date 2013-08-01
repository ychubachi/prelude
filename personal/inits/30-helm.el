;;; 30-helm-mode.el -- Additional ettings for helm
;;; Commentary:

;; - https://github.com/emacs-helm/helm/wiki
;; - http://www49.atwiki.jp/ntemacs/m/pages/32.html
;; - http://qiita.com/akisute3@github/items/7c8ea3970e4cbb7baa97

;;; Code:
(prelude-require-packages '(helm-descbinds helm-migemo helm-themes imenu-anywhere yasnippet helm-c-yasnippet))

(require 'helm-config)
(helm-mode 1)

;; C-h でバックスペースと同じように文字を削除できるようにする
(require 'helm)
(define-key helm-map (kbd "C-h") 'delete-backward-char)
(require 'helm-files)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)

;; ミニバッファで C-k 入力時にカーソル以降を削除する
(setq helm-delete-minibuffer-contents-from-point t)

;; describe-bindings(C-h b)のhelm版
(require 'helm-descbinds)
(helm-descbinds-mode)

(require 'helm-migemo) ; ローマ字検索
(setq helm-use-migemo t)

(require 'helm-themes)
(require 'helm-imenu)
(setq imenu-auto-rescan t)

(require 'helm-c-yasnippet)

;;; 30-helm.el ends here
