;; ;; under mac, have Command as Meta and keep Option for localized input
;; (when (string-match "apple-darwin" system-configuration)
;;   (setq mac-allow-anti-aliasing t)
;;   (setq mac-command-modifier 'meta)
;;   (setq mac-option-modifier 'none))

;; (unless (string-match "apple-darwin" system-configuration)
;;   ;; on mac, there's always a menu bar drown, don't have it empty
;;   (menu-bar-mode -1))

;; ;; choose your own fonts, in a system dependant way
;; (if (string-match "apple-darwin" system-configuration)
;;     (set-face-font 'default "Monaco-13")
;;   (set-face-font 'default "Monospace-10"))

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
(("^-apple-hiragino.*" . 1.2) (".*osaka-bold.*" . 1.2) (".*osaka-medium.*" . 1.2) (".*courier-bold-.*-mac-roman" . 1.0) (".*monaco cy-bold-.*-mac-cyrillic" . 0.9) (".*monaco-bold-.*-mac-roman" . 0.9) ("-cdac$" . 1.3))
