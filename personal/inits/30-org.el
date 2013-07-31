;;; 30-org.el --- orgの設定
;;; Commentary:
;;; Code:
(dolist (package '(org))
  (when (not (package-installed-p package))
    (package-install package)))

;; org-default-notes-fileのディレクトリ
(setq org-directory "~/Dropbox/Note")			; orgディレクトリ
(setq org-agenda-files `("~/Dropbox/Note/main.org"))    ; orgファイル
(setq org-mobile-inbox-for-pull "~/Dropbox/Note/flagged.org")
(setq org-mobile-directory "~/Dropbox/Note/MobileOrg")       ; MobileOrg用ディレクトリ

;; ;; org-default-notes-fileのファイル名
;; (setq org-default-notes-file "notes.org")

;; TODO状態
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAIT(w)" "|" "DONE(d)" "SOMEDAY(s)")))

(setq org-todo-keywords '((type "TODO(t)" "STARTED(s)" "WAITING(w)" "APPT(a)" "|"
                                "DONE(d)" "CANCELLED(c)" "DEFERRED(f)")))
(setq org-tag-alist '(("ANY" . ?a) ("HOME" . ?h) ("WORK" . ?w) ("OUTGO" . ?o)))

;; DONEの時刻を記録
(setq org-log-done 'time)

;; ================================================================
;; 連続操作を素敵にするsmartrep.el作った - sheephead
;; http://sheephead.homelinux.org/2011/12/19/6930/
;; ================================================================

(prelude-require-package 'smartrep)
(require 'smartrep)
(eval-after-load "org"
  '(progn
     (smartrep-define-key
      org-mode-map "C-c" '(("C-n" . (lambda ()
                                      (outline-next-visible-heading 1)))
                           ("C-p" . (lambda ()
                                      (outline-previous-visible-heading 1)))))))

;;; 30-org.el ends here
