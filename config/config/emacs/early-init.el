;;; early-init.el --- GUIの初期化前に読み込まれる設定 -*- lexical-binding: t; -*-

;;; Commentary:
;; フレーム作成前に効かせたい設定だけを置く。

;;; Code:

;; 起動中はGCを止め、起動後に通常の値へ戻す
(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'emacs-startup-hook
          (lambda () (setq gc-cons-threshold (* 64 1024 1024))))

;; LSPなど大きな出力を読むプロセス向けにバッファを広げる
(setq read-process-output-max (* 4 1024 1024))

;; 描画前にUI要素を消しておく（起動時のちらつき防止）
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
(setq menu-bar-mode nil
      tool-bar-mode nil
      scroll-bar-mode nil)

;; フォントと初期サイズ。サイズは文字数で指定するので、
;; 最初のフレームを作る前にフォントを決めておく（footと同じフォント）
(push '(font . "PlemolJP Console NF-12") default-frame-alist)
;; 本文の幅（visual-fill-column の100桁）より広くとり、左右に余白を残す
(push '(width . 160) default-frame-alist)
(push '(height . 40) default-frame-alist)

;; フォント変更などでフレームサイズが変わらないようにする
(setq frame-inhibit-implied-resize t)

(setq inhibit-startup-screen t
      initial-scratch-message nil)

;; ネイティブコンパイルの警告でバッファがポップアップしないようにする
(setq native-comp-async-report-warnings-errors 'silent)

;;; early-init.el ends here
