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

;; wdiredを用い，diredから直接ファイルをリネームできるようにします．
(require 'wdired)
(define-key dired-mode-map "r"
  'wdired-change-to-wdired-mode)

;; ;; cp932エンコード時の表示を「P」とする
;; (coding-system-put 'cp932 :mnemonic ?P)
;; (coding-system-put 'cp932-dos :mnemonic ?P)
;; (coding-system-put 'cp932-unix :mnemonic ?P)
;; (coding-system-put 'cp932-mac :mnemonic ?P)

;; ;; Use the clipboard, pretty please, so that copy/paste "works"
;; (setq x-select-enable-clipboard t)

;; ;; Navigate windows with M-<arrows>
;; (windmove-default-keybindings 'meta)
;; (setq windmove-wrap-around t)

;; ;; avoid compiz manager rendering bugs
;; (add-to-list 'default-frame-alist '(alpha . 80))

;; ;; flymake
;; ;; (require 'flymake)
;; ;; (global-set-key [f3] 'flymake-display-err-menu-for-current-line)
;; ;; (global-set-key [f4] 'flymake-goto-next-error)

;; (setq text-mode-hook (function (lambda () (auto-fill-mode 1))))

;;; 00-builtin.el ends here
