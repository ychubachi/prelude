;;; 40-ruby.el --- Ruby development
;;; Commentary:
;
; http://hmi-me.ciao.jp/wordpress/archives/1295

;; パッケージのインストール

;;; Code:

(dolist (package '(flymake-ruby ruby-end rspec-mode))
  (when (not (package-installed-p package))
    (package-install package)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;
;; ;; ruby-mode
;; ;;

(add-to-list 'auto-mode-alist '("Berksfile" . ruby-mode))

;; (add-hook 'ruby-mode-hook
;;           '(lambda ()
;;              (abbrev-mode 1)
;;              (electric-pair-mode t)
;;              (electric-indent-mode t)
;;              (electric-layout-mode t)))

;; (add-hook 'ruby-mode-hook
;;           '(lambda ()
;;              (add-to-list 'ruby-encoding-map '(undecided . utf-8))))

;; ;; endを補間します
;; (require 'ruby-end)

;; ================================================================
;; flymake-ruby
;; ================================================================
(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; rspec-mode
;;
(require 'rspec-mode)
(add-hook 'dired-mode-hook 'rspec-dired-mode)

;; 2013-07-26 下記設定をしても，Launcherから起動したときはうまくいきません
(defadvice rspec-compile (around rspec-compile-around)
  "Use BASH shell for running the specs because of ZSH issues."
  (let ((shell-file-name "/bin/bash"))
    ad-do-it))
(ad-activate 'rspec-compile)

;; ================================================================
;; haml
;; ================================================================

;; パッケージのインストール
(prelude-require-packages '(haml-mode flymake-haml)

(setq auto-mode-alist
      (cons (cons "\\.haml$" 'haml-mode) auto-mode-alist))
(autoload 'haml-mode "haml-mode.el" "haml-mode" t)
(add-hook 'haml-mode-hook
          '(lambda ()
             (setq indent-tabs-mode nil)
             (define-key haml-mode-map "\C-m" 'newline-and-indent)))

;; flymake-haml
(require 'flymake-haml)
(add-hook 'haml-mode-hook 'flymake-haml-load)

;; ================================================================
;; scss
;; ================================================================

;; パッケージのインストール
(dolist (package '(scss-mode flymake-sass))
  (when (not (package-installed-p package))
    (package-install package)))

(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(add-to-list 'auto-mode-alist '("\\.sass\\'" . scss-mode))
(add-hook 'scss-mode-hook
          '(lambda ()
             (setq indent-tabs-mode nil)
             (define-key haml-mode-map "\C-m" 'newline-and-indent)))
(setq scss-compile-at-save nil) ; 保存時自動コンパイルしない

;; ;; sass/scssモードでauto-complete-modeを有効にする
;; (add-to-list 'ac-modes 'sass-mode)
;; (add-to-list 'ac-modes 'scss-mode)

;;
;; flymake-sass
;;
(require 'flymake-sass)
(add-hook 'sass-mode-hook 'flymake-sass-load)

;; ================================================================
;; javascript
;; ================================================================

(prelude-require-package '(js2-mode))
(setq auto-mode-alist
      (cons (cons "\\.json$" 'js2-mode) auto-mode-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; coffeescript
;;

;; パッケージのインストール
(dolist (package '(coffee-mode flymake-coffee))
  (when (not (package-installed-p package))
    (package-install package)))

;;
;; coffeescript
;;
(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))
(setq whitespace-action
      '(auto-cleanup)) ;; automatically clean up bad whitespace
(setq whitespace-style
      '(trailing space-before-tab indentation empty space-after-tab)) ;; only show bad whitespace
(defun coffee-custom ()
  "coffee-mode-hook"
  ;; CoffeeScript uses two spaces.
  (make-local-variable 'tab-width)
  (set 'tab-width 2))

(add-hook 'coffee-mode-hook 'coffee-custom)

;;
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
