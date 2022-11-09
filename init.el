;;; init.el --- My init.el  -*- lexical-binding: t; -*-

;; Copyright (C) 2022  SuperYuro

;; Author: SuperYuro <a.gpgtdmgp@gmail.com>

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; My init.el.

;;; Code:

;; this enables this running method
;;   emacs -q -l ~/.debug.emacs.d/init.el
(eval-and-compile
  (when (or load-file-name byte-compile-current-file)
    (setq user-emacs-directory
          (expand-file-name
           (file-name-directory (or load-file-name byte-compile-current-file))))))

(eval-and-compile
  (customize-set-variable
   'package-archives '(("gnu"   . "https://elpa.gnu.org/packages/")
                       ("melpa" . "https://melpa.org/packages/")
                       ("org"   . "https://orgmode.org/elpa/")))
  (package-initialize)
  (unless (package-installed-p 'leaf)
    (package-refresh-contents)
    (package-install 'leaf))

  (leaf leaf-keywords
    :ensure t
    :init
    (leaf leaf-convert :ensure t)
    (leaf blackout :ensure t)

    :config
    ;; initialize leaf-keywords.el
    (leaf-keywords-init)))

;; ここに設定を書く
(add-to-list 'exec-path (expand-file-name "/usr/bin" user-emacs-directory))
(add-to-list 'exec-path (expand-file-name "~/.local/bin" user-emacs-directory))
(add-to-list 'exec-path (expand-file-name "~/.cargo/bin" user-emacs-directory))

;; Set Theme
(leaf blackboard-theme
  :doc "TextMate Blackboard Theme"
  :req "emacs-24"
  :tag "emacs>=24"
  :url "https://github.com/don9z/blackboard-theme"
  :added "2022-11-02"
  :emacs>= 24
  :ensure t)

(leaf nord-theme
  :doc "An arctic, north-bluish clean and elegant theme"
  :req "emacs-24"
  :tag "emacs>=24"
  :url "https://github.com/arcticicestudio/nord-emacs"
  :added "2022-11-09"
  :emacs>= 24
  :ensure t
  :config (load-theme 'nord t))

;; Japanese IME configuration
(leaf mozc
  :doc "minor mode to input Japanese with Mozc"
  :tag "input method" "multilingual" "mule"
  :ensure t
  :custom (mozc-candidate-style . 'echo-area)
  :config
  (set-input-method 'japanese-mozc)
  (set-fontset-font t 'japanese-jisx0208 "Noto Serif CJK JP-10"))

(leaf linum
  :doc "display line numbers in the left margin"
  :tag "builtin"
  :global-minor-mode global-linum-mode)

(leaf cus-edit
  :doc "tools for customizing Emacs and Lisp packages"
  :tag "builtin" "faces" "help"
  :custom `((custom-file . ,(locate-user-emacs-file "custom.el"))))

(leaf cus-start
  :doc "define customization properties of builtins"
  :tag "builtin" "internal"
  :preface
  (defun c/redraw-frame nil
    (interactive)
    (redraw-frame))

  :bind (("M-ESC ESC" . c/redraw-frame)
         ("C-h" . delete-backward-char))
  :custom '((user-full-name . "SuperYuro")
            (user-mail-address . "a.gpgtdmgp@gmail.com")
            (user-login-name . "yuro")
            (create-lockfiles . nil)
            (debug-on-error . t)
            (init-file-debug . t)
            (frame-resize-pixelwise . t)
            (enable-recursive-minibuffers . t)
            (history-length . 1000)
            (history-delete-duplicates . t)
            (scroll-preserve-screen-position . t)
            (scroll-conservatively . 100)
            (mouse-wheel-scroll-amount . '(1 ((control) . 5)))
            (ring-bell-function . 'ignore)
            (text-quoting-style . 'straight)
            (truncate-lines . t)
            (inhibit-splash-screen . t)
            ;; (use-dialog-box . nil)
            ;; (use-file-dialog . nil)
            (word-wrap . t)
            (line-wrapping . t)
            (menu-bar-mode . nil)
            (tool-bar-mode . nil)
            (scroll-bar-mode . nil)
            (indent-tabs-mode . nil))
  :config
  (defalias 'yes-or-no-p 'y-or-n-p)
  (keyboard-translate ?\C-h ?\C-?)
  (add-to-list 'default-frame-alist '(font . "Hack Nerd Font-10")))

(leaf autorevert
  :doc "revert buffers when files on disk change"
  :tag "builtin"
  :custom ((auto-revert-interval . 1))
  :global-minor-mode global-auto-revert-mode)

(leaf cc-mode
  :doc "major mode for editing C and similar languages"
  :tag "builtin"
  :defvar (c-basic-offset)
  :bind (c-mode-base-map
         ("C-c c" . compile))
  :mode-hook
  (c-mode-hook . ((c-set-style "bsd")
                  (setq c-basic-offset 4)))
  (c++-mode-hook . ((c-set-style "bsd")
                    (setq c-basic-offset 4))))

(leaf delsel
  :doc "delete selection if you insert"
  :tag "builtin"
  :global-minor-mode delete-selection-mode)

(leaf paren
  :doc "highlight matching paren"
  :tag "builtin"
  :custom ((show-paren-delay . 0.1))
  :global-minor-mode show-paren-mode)

(leaf smartparens
  :doc "Automatic insertion, wrapping and paredit-like navigation with user defined pairs."
  :req "dash-2.13.0" "cl-lib-0.3"
  :tag "editing" "convenience" "abbrev"
  :url "https://github.com/Fuco1/smartparens"
  :added "2022-11-06"
  :ensure t
  :global-minor-mode smartparens-global-mode)

(leaf simple
  :doc "basic editing commands for Emacs"
  :tag "builtin" "internal"
  :custom ((kill-ring-max . 100)
           (kill-read-only-ok . t)
           (kill-whole-line . t)
           (eval-expression-print-length . nil)
           (eval-expression-print-level . nil)))

(leaf files
  :doc "file input and output commands for Emacs"
  :tag "builtin"
  :custom `((auto-save-timeout . 15)
            (auto-save-interval . 60)
            (auto-save-file-name-transforms . '((".*" ,(locate-user-emacs-file "backup/") t)))
            (backup-directory-alist . '((".*" . ,(locate-user-emacs-file "backup"))
                                        (,tramp-file-name-regexp . nil)))
            (version-control . t)
            (delete-old-versions . t)))

(leaf startup
  :doc "process Emacs shell arguments"
  :tag "builtin" "internal"
  :custom `((auto-save-list-file-prefix . ,(locate-user-emacs-file "backup/.saves-"))))

(leaf ivy
  :doc "Incremental Vertical completYon"
  :req "emacs-24.5"
  :tag "matching" "emacs>=24.5"
  :url "https://github.com/abo-abo/swiper"
  :emacs>= 24.5
  :ensure t
  :blackout t
  :leaf-defer nil
  :custom ((ivy-initial-inputs-alist . nil)
           (ivy-use-selectable-prompt . t))
  :global-minor-mode t
  :config
  (leaf swiper
    :doc "Isearch with an overview. Oh, man!"
    :req "emacs-24.5" "ivy-0.13.0"
    :tag "matching" "emacs>=24.5"
    :url "https://github.com/abo-abo/swiper"
    :emacs>= 24.5
    :ensure t
    :bind (("C-s" . swiper)))

  (leaf counsel
    :doc "Various completion functions using Ivy"
    :req "emacs-24.5" "swiper-0.13.0"
    :tag "tools" "matching" "convenience" "emacs>=24.5"
    :url "https://github.com/abo-abo/swiper"
    :emacs>= 24.5
    :ensure t
    :blackout t
    :bind (("C-S-s" . counsel-imenu)
           ("C-x C-r" . counsel-recentf))
    :custom `((counsel-yank-pop-separator . "\n----------\n")
              (counsel-find-file-ignore-regexp . ,(rx-to-string '(or "./" "../") 'no-group)))
    :global-minor-mode t))

(leaf prescient
  :doc "Better sorting and filtering"
  :req "emacs-25.1"
  :tag "extensions" "emacs>=25.1"
  :url "https://github.com/raxod502/prescient.el"
  :emacs>= 25.1
  :ensure t
  :custom ((prescient-aggressive-file-save . t))
  :global-minor-mode prescient-persist-mode)

(leaf ivy-prescient
  :doc "prescient.el + Ivy"
  :req "emacs-25.1" "prescient-4.0" "ivy-0.11.0"
  :tag "extensions" "emacs>=25.1"
  :url "https://github.com/raxod502/prescient.el"
  :emacs>= 25.1
  :ensure t
  :after prescient ivy
  :custom ((ivy-prescient-retain-classic-highlighting . t))
  :global-minor-mode t)

(leaf flycheck
  :doc "On-the-fly syntax checking"
  :req "dash-2.12.1" "pkg-info-0.4" "let-alist-1.0.4" "seq-1.11" "emacs-24.3"
  :tag "minor-mode" "tools" "languages" "convenience" "emacs>=24.3"
  :url "http://www.flycheck.org"
  :emacs>= 24.3
  :ensure t
  :bind (("M-n" . flycheck-next-error)
         ("M-p" . flycheck-previous-error))
  :global-minor-mode global-flycheck-mode)

(leaf company
  :doc "Modular text completion framework"
  :req "emacs-24.3"
  :tag "matching" "convenience" "abbrev" "emacs>=24.3"
  :url "http://company-mode.github.io/"
  :emacs>= 24.3
  :ensure t
  :blackout t
  :leaf-defer nil
  :bind ((company-active-map
          ("M-n" . nil)
          ("M-p" . nil)
          ("C-s" . company-filter-candidates)
          ("C-n" . company-select-next)
          ("C-p" . company-select-previous)
          ("<tab>" . company-complete-selection))
         (company-search-map
          ("C-n" . company-select-next)
          ("C-p" . company-select-previous)))
  :custom ((company-idle-delay . 0)
           (company-minimum-prefix-length . 1)
           (company-transformers . '(company-sort-by-occurrence)))
  :global-minor-mode global-company-mode)

(leaf company-c-headers
  :doc "Company mode backend for C/C++ header files"
  :req "emacs-24.1" "company-0.8"
  :tag "company" "development" "emacs>=24.1"
  :added "2020-03-25"
  :emacs>= 24.1
  :ensure t
  :after company
  :defvar company-backends
  :config
  (add-to-list 'company-backends 'company-c-headers))

(leaf counsel-tramp
  :doc "Tramp ivy interface for ssh, docker, vagrant"
  :req "emacs-24.3" "counsel-0.10"
  :tag "emacs>=24.3"
  :url "https://github.com/masasam/emacs-counsel-tramp"
  :added "2022-11-02"
  :emacs>= 24.3
  :ensure t
  :after counsel)

(leaf docker-tramp
  :doc "TRAMP integration for docker containers"
  :req "emacs-24" "cl-lib-0.5"
  :tag "convenience" "docker" "emacs>=24"
  :url "https://github.com/emacs-pe/docker-tramp.el"
  :added "2022-11-04"
  :emacs>= 24
  :ensure t
  :custom (docker-tramp-use-names . t))

(leaf migemo
  :doc "Japanese incremental search through dynamic pattern expansion"
  :req "cl-lib-0.5"
  :url "https://github.com/emacs-jp/migemo"
  :added "2022-11-06"
  :ensure t
  :custom ((migemo-command . "cmigemo")
           (migemo-options '("-q" "--emacs"))
           (migemo-user-dictionary . nil)
           (migemo-regex-dictionary . nil)
           (migemo-coding-system . 'utf-8-unix)))

(leaf ivy-migemo
  :doc "Use migemo on ivy"
  :req "emacs-24.3" "ivy-0.13.0" "migemo-1.9.2" "nadvice-0.3"
  :tag "matching" "emacs>=24.3"
  :url "https://github.com/ROCKTAKEY/ivy-migemo"
  :added "2022-11-06"
  :emacs>= 24.3
  :ensure t
  :after ivy migemo nadvice)

(provide 'init)

;; Local Variables:
;; indent-tabs-mode: nil
;; End:

;;; init.el ends here
