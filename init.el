;; package管理
(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))

;; ミニバッファの表示文字を白色に変換
(set-face-foreground 'minibuffer-prompt "white")
;; elispのオートロード設定
(add-to-list 'load-path "~/.emacs.d/elisp/")
;; 行の折り返し表示を切り替える
(define-key global-map(kbd "C-c l") 'toggle-turncate-lines)
;; ウィンドウの切り替えをスムーズにする
(define-key global-map(kbd "C-l") 'other-window)
;; コピーとペーストをクリップボードから可能にする
(setq x-select-enable-clipboard nil)
(define-key global-map(kbd "<mouse-2>") 'clipboard-yank)

;; バックスペースの設定
(global-set-key (kbd "C-h") 'delete-backward-char)

;; font
(add-to-list 'default-frame-alist '(font . "ricty-12"))


;; alpha
(if window-system 
    (progn
      (set-frame-parameter nil 'alpha 95)))

;; line numberの表示
(require 'linum)
(global-linum-mode 1)

;; tabサイズ
(setq default-tab-width 4)

;; メニューバーを非表示
(menu-bar-mode 0)

;; 現在ポイントがある関数名をモードラインに表示
(which-function-mode 1)

;; 対応する括弧をハイライト
(show-paren-mode 1)

;; リージョンのハイライト
(transient-mark-mode 1)

;; タイトルにフルパス表示
(setq frame-title-format "%f")

;;current directory 表示
(let ((ls (member 'mode-line-buffer-identification
                  mode-line-format)))
  (setcdr ls
    (cons '(:eval (concat " ("
            (abbreviate-file-name default-directory)
            ")"))
            (cdr ls))))
;; スクロールは1行ごとに
(setq mouse-wheel-scroll-amount '(1 ((shift) . 5)))

;; スクロールの加速をやめる
(setq mouse-wheel-progressive-speed nil)

;; bufferの最後でカーソルを動かそうとしても音をならなくする
(defun next-line (arg)
  (interactive "p")
  (condition-case nil
      (line-move arg)
    (end-of-buffer)))

;; エラー音をならなくする
(setq ring-bell-function 'ignore)

;; テーマカラーの変更
(load-theme 'wombat t)

