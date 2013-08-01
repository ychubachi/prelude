;;; 90-personal-map.el --- 個人用キーマップ
;;; Commentary:
;;
;; http://www.emacswiki.org/emacs/PrefixKey
;;
;;; Code:

(define-prefix-command 'personal-map)
(global-set-key (kbd "C-q") 'personal-map)
(define-key 'personal-map  (kbd "q") 'quoted-insert)
(define-key 'personal-map  (kbd "i") 'helm-imenu-anywhere)
(define-key 'personal-map  (kbd "h") 'helm-mini)
;(define-key 'personal-map  (kbd "e") 'flymake-display-err-menu-for-current-line)
;(define-key 'personal-map  (kbd "n") 'flymake-goto-next-error)

;;; 90-personal-map.el ends here
