;;; personal.el --- My minimum settings for Emacs
;;; Commentary:
;;; Change Log: Created on 2013-07-30
;;; Code:

;; 時刻の表示
(require 'time)
(setq display-time-24hr-format t)
(setq display-time-string-forms '(24-hours ":" minutes))
(display-time-mode t)

;; シンボリックリンクを開くときの質問省略
(setq vc-follow-symlinks t)

;; マウスで選択したリージョンをkill ringにコピーする
(setq mouse-drag-copy-region t)

;; ;; Use the clipboard, pretty please, so that copy/paste "works"
(setq x-select-enable-clipboard t)

;; UI
(add-to-list 'default-frame-alist '(alpha . 80))

;; wdiredを用い，diredから直接ファイルをリネームできるようにします．
(require 'wdired)
(define-key dired-mode-map "r"
  'wdired-change-to-wdired-mode)

;;; 00-builtin.el ends here
