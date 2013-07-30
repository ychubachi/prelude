;;; linux.el --- My settings for Emacs in Linux
;;; Commentary:
;;; Change Log: Created on 2013-07-30
;;; Code:

;;
;; Settings for IBUS
;;

;; 注意: in ~/.Xresourcesに
;;   Emacs*useXIM:	false
;; と設定しておくこと．
;;
;; Thanks: http://www11.atwiki.jp/s-irie/pages/21.html#basic
;; Thanks: http://d.hatena.ne.jp/iRiE/20100530/1275212234

(require 'ibus)
;; Turn on ibus-mode automatically after loading .emacs
(add-hook 'after-init-hook 'ibus-mode-on)

;; Use C-SPC for Set Mark command
(ibus-define-common-key ?\C-\s nil)
;; Use C-/ for Undo command
(ibus-define-common-key ?\C-/ nil)
;; Toggle input status by C-o
(global-set-key (kbd "C-o") 'ibus-toggle)

;; Change cursor color depending on IBus status
(setq ibus-cursor-color '("green" "red" "blue"))

;; Set the window position
(setq ibus-prediction-window-position t)
;; Use henkan key to enable IBus
(global-set-key [henkan] 'ibus-enable)
;; Use muhenkan key to disable IBus
(global-set-key [muhenkan] 'ibus-disable)

;;
;; Font設定
;;

;; http://stickydiary.blog88.fc2.com/blog-entry-107.html
;; 14 px 以外にも 12 px (9 pt)、16 px (12 pt)、18 px (13.5 pt)、
;; 20 px (15 pt)、22 px (16.5 pt) あたりが有効かと思います。
;; mmm あいうえお｜｜｜｜｜
;; iii ｜｜｜｜｜｜｜｜｜｜
(set-default-font "Ricty:pixelsize=14:spacing=0")


;;
;; dbus for YaTeX
;;

;; http://oku.edu.mie-u.ac.jp/~okumura/texwiki/?Emacs#v19f2543
(require 'dbus)

(defun un-urlify (fname-or-url)
  "A trivial function that replaces a prefix of file:/// with just /."
  (if (string= (substring fname-or-url 0 8) "file:///")
      (substring fname-or-url 7)
    fname-or-url))

(defun evince-inverse-search (file linecol &rest ignored)
  (let* ((fname (un-urlify file))
         (buf (find-file fname))
         (line (car linecol))
         (col (cadr linecol)))
    (if (null buf)
        (message "[Synctex]: %s is not opened..." fname)
      (switch-to-buffer buf)
      (goto-line (car linecol))
      (unless (= col -1)
        (move-to-column col)))))

(when (boundp 'dbus-message-type-method-call) nil t
      (dbus-register-signal
       :session nil "/org/gnome/evince/Window/0"
       "org.gnome.evince.Window" "SyncSource"
       'evince-inverse-search))
