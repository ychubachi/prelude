;;; 30-smart-compile.el --- 賢いコンパイル
;;; Commentary:
;;; Code:
(dolist (package '(smart-compile))
  (when (not (package-installed-p package))
    (package-install package)))
(require 'smart-compile)

;; コンパイル前に自動保存
(setq compilation-ask-about-save nil)

;;; Ruby
;; キーバインドを設定
(define-key ruby-mode-map (kbd "C-c c") 'smart-compile)
(define-key ruby-mode-map (kbd "C-c C-c") (kbd "C-c c C-m"))
;; コンパイルコマンドを修正
(add-to-list 'smart-compile-alist '("\\.rb\\'" . "ruby %f"))
;;; 30-smart-compile.el ends here
