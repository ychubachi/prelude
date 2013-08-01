;;; cocoa-emacs-setting.el --- Mac用設定
;;; Commentary:
;;; Code:

;; ================================================================
;; Keyboard settings
;; ================================================================

;; option <-> meta
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

;;システムへ修飾キーを渡さない
(setq mac-pass-control-to-system nil)
(setq mac-pass-command-to-system nil)
(setq mac-pass-option-to-system nil)

;;; C-oで日本語切り替え
(mac-input-method-mode t)
(global-set-key "\C-o" 'toggle-input-method)

;; かな
(mac-set-input-method-parameter
 "com.google.inputmethod.Japanese.base" 'cursor-color 'green)

;; 英数字
(mac-set-input-method-parameter
 "com.google.inputmethod.Japanese.Roman" 'cursor-color 'red)

;; change cursor type
(mac-set-input-method-parameter
 "com.google.inputmethod.Japanese.base" 'cursor-type 'box)

;; ================================================================
;; Fonts
;; ================================================================

;; |あああああ|
;; |+-+-+-+-+-|
;; |imimimimim|

(set-fontset-font (frame-parameter nil 'font)
                  'unicode
                  (font-spec :family "Hiragino Maru Gothic ProN")
                  nil
                  'append)
(setq face-font-rescale-alist '(("Hiragino.*" . 1.2)))

;;; cocoa-emacs-setting.el ends here
