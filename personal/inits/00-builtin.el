;;; 00-builtin.el --- My minimum settings for Emacs
;;; Commentary:
;;; Change Log: Created on 2013-07-30
;;; Code:

;; 時刻の表示
(require 'time)
(setq display-time-24hr-format t)
(setq display-time-string-forms '(24-hours ":" minutes))
(display-time-mode t)

;; wdiredを用い，diredから直接ファイルをリネームできるようにします．
(require 'wdired)
(define-key dired-mode-map "r"
  'wdired-change-to-wdired-mode)

;;; 00-builtin.el ends here
