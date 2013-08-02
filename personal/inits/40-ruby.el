;;; 40-ruby.el --- Ruby development
;;; Commentary:
;; Preludeのモジュールとして次のものを有効にしています．
;; - coffee, js, ruby, scss


;; S式から正規表現を作成する - by shigemk2
;; - http://d.hatena.ne.jp/shigemk2/20120419/1334762456

;; EmacsでRubyの開発環境をめちゃガチャパワーアップしたまとめ | Futurismo
;; http://hmi-me.ciao.jp/wordpress/archives/1295

;;; Code:

;; ================================================================
;; Ruby DSLs
;; ================================================================

(add-to-list 'auto-mode-alist '("Berksfile" . ruby-mode))

;; ================================================================
;; outline-minnor-mode
;; ================================================================

(require 'outline)
(add-hook 'ruby-mode-hook
          (function
           (lambda ()
             (defun ruby-outline-level ()
               (or (and (match-string 1)
                        (or (cdr (assoc (match-string 1) outline-heading-alist))
                            (- (match-end 1) (match-beginning 1))))
                   (cdr (assoc (match-string 0) outline-heading-alist))
                   (- (match-end 0) (match-beginning 0))))

             (set (make-local-variable 'outline-level) 'ruby-outline-level)

             (set (make-local-variable 'outline-regexp)
                  (rx (group (* " "))
                      bow
                      (or "begin" "case" "class" "def" "else" "elsif" "end"
                          "ensure" "if" "module" "rescue" "when" "unless")
                      eow))
             (outline-minor-mode))))

;; ================================================================
;; flymake関係
;; ================================================================

(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

(require 'flymake-haml)
(add-hook 'haml-mode-hook 'flymake-haml-load)

(require 'flymake-sass)
(add-hook 'sass-mode-hook 'flymake-sass-load)

(require 'flymake-coffee)
(add-hook 'coffee-mode-hook 'flymake-coffee-load)

;; ================================================================
;; 賢いコンパイル
;; ================================================================

(prelude-require-package 'smart-compile)
(require 'smart-compile)

;; コンパイル前に自動保存
(setq compilation-ask-about-save nil)

;; Ruby用キーバインドを設定
(define-key ruby-mode-map (kbd "C-c c") 'smart-compile)
(define-key ruby-mode-map (kbd "C-c C-c") (kbd "C-c c C-m"))

;; コンパイルコマンドを変更
(add-to-list 'smart-compile-alist '("\\.rb\\'" . "ruby %f"))

;;; 40-ruby.el ends here

;; (defun ruby-outline-level ()
;;   "Ruby outline level."
;;   (or (and (match-string 1)
;;            (or (cdr (assoc (match-string 1) outline-heading-alist))
;;                (- (match-end 1) (match-beginning 1))))
;;       (cdr (assoc (match-string 0) outline-heading-alist))
;;       (- (match-end 0) (match-beginning 0))))

;; (set (make-local-variable 'outline-level) 'ruby-outline-level)

;; (set (make-local-variable 'outline-regexp)
;;      (rx (group (* " "))
;;          bow
;;          (or "begin" "case" "class" "def" "else" "elsif" "end"
;;              "ensure" "if" "module" "rescue" "when" "unless")
;;          eow))

;; (outline-minor-mode)
