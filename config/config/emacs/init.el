;;; init.el --- メインの設定 -*- lexical-binding: t; -*-

;;; Commentary:
;; パッケージ管理は組み込みの package.el と use-package を使う。
;; 組み込みパッケージには :ensure nil を付け、外部パッケージだけをインストールする。

;;; Code:

;;;; パッケージ管理

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(require 'use-package)
(setq use-package-always-ensure t)

;; M-x customize による変更は init.el ではなく custom.el に書き出す
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file 'noerror 'nomessage)

;;;; 基本設定

(use-package emacs
  :ensure nil
  :custom
  ;; インデント（Neovimと同じく、スペース2つ）
  (indent-tabs-mode nil)
  (tab-width 2)
  ;; スクロール
  (scroll-margin 10)
  (scroll-conservatively 101)
  (pixel-scroll-precision-mode t)
  ;; ファイル
  (make-backup-files nil)
  (create-lockfiles nil)
  (require-final-newline t)
  ;; 操作
  (use-short-answers t)
  (ring-bell-function #'ignore)
  (confirm-kill-emacs #'y-or-n-p)
  (enable-recursive-minibuffers t)
  ;; 表示
  (frame-title-format '("%b - Emacs"))
  (column-number-mode t)
  :config
  (set-language-environment "Japanese")
  (prefer-coding-system 'utf-8))

;;;; 見た目

;; footと同じフォント
(set-face-attribute 'default nil :family "PlemolJP Console NF" :height 120)

;; NeovimのCatppuccin Latteに揃える
(use-package catppuccin-theme
  :custom
  (catppuccin-flavor 'latte)
  :config
  (load-theme 'catppuccin :no-confirm))

;; 相対行番号
(use-package display-line-numbers
  :ensure nil
  :hook ((prog-mode text-mode conf-mode) . display-line-numbers-mode)
  :custom
  (display-line-numbers-type 'relative)
  (display-line-numbers-width-start t))

(use-package hl-line
  :ensure nil
  :hook (after-init . global-hl-line-mode))

;;;; 編集

(use-package elec-pair
  :ensure nil
  :hook (after-init . electric-pair-mode))

(use-package delsel
  :ensure nil
  :hook (after-init . delete-selection-mode))

;; 外部で変更されたファイルを自動で読み直す
(use-package autorevert
  :ensure nil
  :hook (after-init . global-auto-revert-mode)
  :custom
  (global-auto-revert-non-file-buffers t))

;;;; 履歴

;; ミニバッファの履歴
(use-package savehist
  :ensure nil
  :hook (after-init . savehist-mode))

;; 最近開いたファイル
(use-package recentf
  :ensure nil
  :hook (after-init . recentf-mode)
  :custom
  (recentf-max-saved-items 200))

;; ファイルごとのカーソル位置
(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode))

;;;; ミニバッファ補完

;; 候補を縦に並べる
(use-package vertico
  :hook (after-init . vertico-mode)
  :custom
  (vertico-cycle t))

;; スペース区切りで絞り込む（順不同）
(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion)))))

;; 候補の横に説明を表示する
(use-package marginalia
  :hook (after-init . marginalia-mode))

;; 絞り込みとプレビュー付きの検索・移動コマンド
(use-package consult
  :bind
  ;; 見出しの一覧から選んでジャンプする（Markdown・MDXでも使える）
  ("M-g o" . consult-outline))

;; キー入力の途中で続きのキーを表示する
(use-package which-key
  :ensure nil
  :hook (after-init . which-key-mode)
  :custom
  (which-key-idle-delay 0.3))

;;;; tree-sitter

(use-package treesit
  :ensure nil
  :custom
  ;; 対応する *-ts-mode があれば常にそちらを使う
  (treesit-enabled-modes t)
  ;; 文法が未インストールなら、確認してからインストールする
  (treesit-auto-install-grammar 'ask)
  (treesit-font-lock-level 4))

;;;; Markdown

;; 折り返しを日本語の文字の境界でも行う（visual-line-mode用）
(setq-default word-wrap-by-category t)

;; .md はGitHub Flavored Markdownとして開く
(use-package markdown-mode
  :mode (("\\.md\\'" . gfm-mode)
         ("\\.markdown\\'" . gfm-mode))
  :hook (markdown-mode . visual-line-mode)
  :custom
  ;; プレビュー（C-c C-c l）で使う変換コマンド
  (markdown-command "cmark")
  ;; コードブロックを言語ごとにハイライトする
  (markdown-fontify-code-blocks-natively t)
  ;; 見出しのレベルに応じて文字を大きくする
  (markdown-header-scaling t)
  (markdown-list-indent-width 2)
  ;; 見出しは "# 見出し" の形（閉じの # を付けない）
  (markdown-asymmetric-header t))

(defun my/markdown-outline-search (&optional bound move backward looking-at)
  "コードブロックの中を除いて、Markdownの見出しを探す。
`outline-search-function' と同じ引数を取る。"
  (let ((regexp (concat "^\\(?:" outline-regexp "\\)")))
    (if looking-at
        (save-excursion
          (beginning-of-line)
          (and (looking-at regexp)
               (not (markdown-code-block-at-point-p))))
      (let ((start (point)) found)
        (while (and (setq found (if backward
                                    (re-search-backward regexp bound t)
                                  (re-search-forward regexp bound t)))
                    (markdown-code-block-at-point-p (match-beginning 0))))
        (unless found
          (goto-char (if move
                         (or bound (if backward (point-min) (point-max)))
                       start)))
        found))))

(defun my/markdown-consult-outline ()
  "コードブロック内の # で始まる行を除いて `consult-outline' を実行する。"
  (interactive)
  ;; コードブロックの判定に使うテキストプロパティを全体に付けておく
  (syntax-propertize (point-max))
  (let ((outline-search-function #'my/markdown-outline-search))
    (consult-outline)))

(with-eval-after-load 'markdown-mode
  (keymap-set markdown-mode-map "M-g o" #'my/markdown-consult-outline))

;; C-c ' でコードブロックを別バッファで、その言語のモードで編集する
(use-package edit-indirect)

;; MDX（Markdown + JSX）用のモード。MELPAに専用モードがないため、
;; gfm-mode を元に、import/export 行・<Component>・{式} の色分けを足す。
(define-derived-mode mdx-mode gfm-mode "MDX"
  "MDXファイルを編集するためのモード。"
  (font-lock-add-keywords
   nil
   '(("^\\(?:import\\|export\\)\\_>.*$" . 'font-lock-preprocessor-face)
     ;; JSXコンポーネントは大文字で始まる（<Chart>、</Chart>、<Foo.Bar>）
     ("</?\\([A-Z][[:alnum:]_.]*\\)" 1 'font-lock-type-face)
     ("{[^{}\n]*}" . 'font-lock-constant-face))))

(add-to-list 'auto-mode-alist '("\\.mdx\\'" . mdx-mode))

;;; init.el ends here
