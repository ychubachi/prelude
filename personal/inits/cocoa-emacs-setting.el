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

;; ;; change title
;; (mac-set-input-method-parameter
;;  "com.google.inputmethod.Japanese.base" 'title "J")

;; *** know current input source name
;; (mac-get-current-input-source)

;; *** know current face setting of input source
;; (mac-get-input-method-parameter input-source-name key)

;; ================================================================
;; Fonts
;; ================================================================
(when (>= emacs-major-version 23)
  (set-face-attribute 'default nil
                      :family "monaco"
                      :height 140)
  (set-fontset-font
   (frame-parameter nil 'font)
   'japanese-jisx0208
   '("Hiragino Maru Gothic Pro" . "iso10646-1"))
  (set-fontset-font
   (frame-parameter nil 'font)
   'japanese-jisx0212
   '("Hiragino Maru Gothic Pro" . "iso10646-1"))
  (set-fontset-font
   (frame-parameter nil 'font)
   'mule-unicode-0100-24ff
   '("monaco" . "iso10646-1"))
  (setq face-font-rescale-alist
        '(("^-apple-hiragino.*" . 1.2)
          (".*osaka-bold.*" . 1.2)
          (".*osaka-medium.*" . 1.2)
          (".*courier-bold-.*-mac-roman" . 1.0)
          (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
          (".*monaco-bold-.*-mac-roman" . 0.9)
          ("-cdac$" . 1.3))))

;; cocoa-emacs-setting ends here
