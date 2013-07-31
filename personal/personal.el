;;; personal.el --- My minimum settings for Emacs
;;; Commentary:
;;; Change Log: Created on 2013-07-30
;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Key-bindings
;;

(global-set-key "\C-h" 'delete-backward-char)
(global-set-key (kbd "C-c C-h") 'help-command)
(global-set-key (kbd "C-z") 'eshell)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; 自作関数
;;

(defun my/open-init-folder()
  "設定フォルダを開きます．"
  (interactive)
  (dired "~/.emacs.d/"))
(global-set-key (kbd "<f1>") 'my/open-init-folder)

(defun my/open-note()
  "備忘録を開きます．"
  (interactive)
  (find-file "~/Dropbox/Note/index.org"))
(global-set-key (kbd "<f2>") 'my/open-note)

(defun my/open-todo()
  "備忘録を開きます．"
  (interactive)
  (find-file "~/Dropbox/Todo/todo.txt"))
(global-set-key (kbd "<f3>") 'my/open-todo)

(defun my/open-project-folder()
  "プロジェクトフォルダを開きます．"
  (interactive)
  (dired "~/git/"))
(global-set-key (kbd "<f4>") 'my/open-project-folder)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; init-loaderの設定
;;

;; init-loaderのインストール
(setq package-name 'init-loader)

;; パッケージがなければインストール
(when (not (package-installed-p package-name))
  (package-install package-name))

;; init-loaderの初期化
(require 'init-loader)
;(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/personal/inits")

;;; personal.el ends here
