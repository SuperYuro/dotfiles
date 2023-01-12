;;; ivy-migemo-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "ivy-migemo" "ivy-migemo.el" (0 0 0 0))
;;; Generated autoloads from ivy-migemo.el

(autoload 'ivy-migemo--regex "ivy-migemo" "\
Same as `ivy--regex' except using migemo.
Make regex sequence from STR (greedily if GREEDY is non-nil).
Each string made by splitting STR with space can match Japanese.

\(fn STR &optional GREEDY)" nil nil)

(autoload 'ivy-migemo--regex-plus "ivy-migemo" "\
Same as `ivy--regex-plus' except using migemo.
Make regex sequence from STR.
Each string made by splitting STR with space or `!' can match Japanese.

\(fn STR)" nil nil)

(autoload 'ivy-migemo--regex-fuzzy "ivy-migemo" "\
Same as `ivy--regex-fuzzy' except using migemo.
Make regex sequence from STR.
STR can match Japanese word (but not fuzzy match).

\(fn STR)" nil nil)

(autoload 'ivy-migemo-toggle-fuzzy "ivy-migemo" "\
Toggle the re builder to match fuzzy or not." t nil)

(autoload 'ivy-migemo-toggle-migemo "ivy-migemo" "\
Toggle the re builder to use/unuse migemo." t nil)

(defvar ivy-migemo-search-default-handling-mode nil "\
Non-nil if Ivy-Migemo-Search-Default-Handling mode is enabled.
See the `ivy-migemo-search-default-handling-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `ivy-migemo-search-default-handling-mode'.")

(custom-autoload 'ivy-migemo-search-default-handling-mode "ivy-migemo" nil)

(autoload 'ivy-migemo-search-default-handling-mode "ivy-migemo" "\
Minor mode to override functions which use `swiper--re-builder'.
This is to handle `search-default-mode' when `ivy-migemo'is turned on.

This is a minor mode.  If called interactively, toggle the
`Ivy-Migemo-Search-Default-Handling mode' mode.  If the prefix
argument is positive, enable the mode, and if it is zero or
negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value
\\='ivy-migemo-search-default-handling-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(define-obsolete-function-alias 'global-ivy-migemo-search-default-handling-mode 'ivy-migemo-search-default-handling-mode "1.3.4")

(register-definition-prefixes "ivy-migemo" '("ivy-migemo-"))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; ivy-migemo-autoloads.el ends here
