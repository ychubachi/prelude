;;; 90-personal-map.el --- 個人用キーマップ
;;; Commentary:
;;
;; http://www.emacswiki.org/emacs/PrefixKey
;;
;;; Code:

;; ================================================================
;; 個人用キーマップを設定する
;; ================================================================

(define-prefix-command 'personal-map)
(global-set-key (kbd "C-q") 'personal-map)
(define-key 'personal-map (kbd "q") 'quoted-insert)
(define-key 'personal-map (kbd "m") 'helm-imenu-anywhere)
(define-key 'personal-map (kbd "h") 'helm-mini)

(define-key 'personal-map (kbd "i") 'yas-insert-snippet)
(define-key 'personal-map (kbd "n") 'yas-new-snippet)
(define-key 'personal-map (kbd "v") 'yas-visit-snippet-file)

(define-key 'personal-map (kbd "y") 'helm-c-yas-complete)
(define-key 'personal-map (kbd "s") 'helm-c-yas-create-snippet-on-region)

;; ================================================================
;; リージョンがある間のキーバインディングを変更する
;; ================================================================

(prelude-require-package 'region-bindings-mode)
(require 'region-bindings-mode)
(region-bindings-mode-enable)
(define-key region-bindings-mode-map "a" 'mc/mark-all-like-this)
(define-key region-bindings-mode-map "p" 'mc/mark-previous-like-this)
(define-key region-bindings-mode-map "n" 'mc/mark-next-like-this)
(define-key region-bindings-mode-map "m" 'mc/mark-more-like-this-extended)
(define-key region-bindings-mode-map "e" 'mc/edit-lines)

;;; 90-personal-map.el ends here
