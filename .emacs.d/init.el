;; cmdキーを superとして割り当てる
(setq mac-command-modifier 'super)

;;バックスペースの設定
(global-set-key (kbd "C-h") 'delete-backward-char)

;; line numberの表示
(require 'linum)
(global-linum-mode 1)

;; tabサイズ
(setq default-tab-width 4)

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

;; スタートアップメッセージを表示させない
(setq inhibit-startup-message 1)

;; scratchの初期メッセージ消去
(setq initial-scratch-message "")

;; スクロールは1行ごとに
(setq mouse-wheel-scroll-amount '(1 ((shift) . 5)))

;; スタートアップメッセージを表示させない
(setq inhibit-startup-message 1)
