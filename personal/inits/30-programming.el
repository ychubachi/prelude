;;; 30-programming.el --- プログラミング用パッケージ
;;; Commentary:
;;;  auto-complete : 補間
;;; Code:

;; ================================================================
;; 自動補間
;; ================================================================

(prelude-require-package 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
;; (define-key ac-complete-mode-map "\C-n" 'ac-next)
;; (define-key ac-complete-mode-map "\C-p" 'ac-previous)

;; ================================================================
;; 複数のカーソルを扱う
;; ================================================================

(prelude-require-package 'multiple-cursors)
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

;; ================================================================
;; リージョンがある間のキーバインディングを変更する
;; ================================================================
;;

(prelude-require-package 'region-bindings-mode)
(require 'region-bindings-mode)
(region-bindings-mode-enable)
(define-key region-bindings-mode-map "a" 'mc/mark-all-like-this)
(define-key region-bindings-mode-map "p" 'mc/mark-previous-like-this)
(define-key region-bindings-mode-map "n" 'mc/mark-next-like-this)
(define-key region-bindings-mode-map "m" 'mc/mark-more-like-this-extended)

;;; 30-programming.el ends here
