;;; editorconfig-autoloads.el --- automatically extracted autoloads (do not edit)   -*- lexical-binding: t -*-
;; Generated by the `loaddefs-generate' function.

;; This file is part of GNU Emacs.

;;; Code:

(add-to-list 'load-path (or (and load-file-name (directory-file-name (file-name-directory load-file-name))) (car load-path)))



;;; Generated autoloads from editorconfig.el

(defvar editorconfig-mode nil "\
Non-nil if Editorconfig mode is enabled.
See the `editorconfig-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `editorconfig-mode'.")
(custom-autoload 'editorconfig-mode "editorconfig" nil)
(autoload 'editorconfig-mode "editorconfig" "\
Toggle EditorConfig feature.

To disable EditorConfig in some buffers, modify
`editorconfig-exclude-modes' or `editorconfig-exclude-regexps'.

This is a global minor mode.  If called interactively, toggle the
`Editorconfig mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='editorconfig-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

(fn &optional ARG)" t)
(autoload 'editorconfig-version "editorconfig" "\
Get EditorConfig version as string.

If called interactively or if SHOW-VERSION is non-nil, show the
version in the echo area and the messages buffer.

(fn &optional SHOW-VERSION)" t)
(register-definition-prefixes "editorconfig" '("editorconfig-"))


;;; Generated autoloads from editorconfig-conf-mode.el

(autoload 'editorconfig-conf-mode "editorconfig-conf-mode" "\
Major mode for editing .editorconfig files.

(fn)" t)
(add-to-list 'auto-mode-alist '("\\.editorconfig\\'" . editorconfig-conf-mode))
(register-definition-prefixes "editorconfig-conf-mode" '("editorconfig-conf-mode-"))


;;; Generated autoloads from editorconfig-core.el

(autoload 'editorconfig-core-get-nearest-editorconfig "editorconfig-core" "\
Return path to .editorconfig file that is closest to DIRECTORY.

(fn DIRECTORY)")
(autoload 'editorconfig-core-get-properties "editorconfig-core" "\
Get EditorConfig properties for FILE.
If FILE is not given, use currently visiting file.
Give CONFNAME for basename of config file other than .editorconfig.
If need to specify config format version, give CONFVERSION.

This function returns an alist of properties.  Each element will
look like (KEY . VALUE).

(fn &optional FILE CONFNAME CONFVERSION)")
(autoload 'editorconfig-core-get-properties-hash "editorconfig-core" "\
Get EditorConfig properties for FILE.
If FILE is not given, use currently visiting file.
Give CONFNAME for basename of config file other than .editorconfig.
If need to specify config format version, give CONFVERSION.

This function is almost same as `editorconfig-core-get-properties', but returns
hash object instead.

(fn &optional FILE CONFNAME CONFVERSION)")
(register-definition-prefixes "editorconfig-core" '("editorconfig-core--"))


;;; Generated autoloads from editorconfig-core-handle.el

(register-definition-prefixes "editorconfig-core-handle" '("editorconfig-core-handle"))


;;; Generated autoloads from editorconfig-fnmatch.el

(register-definition-prefixes "editorconfig-fnmatch" '("editorconfig-fnmatch-"))


;;; Generated autoloads from editorconfig-tools.el

(autoload 'editorconfig-apply "editorconfig-tools" "\
Get and apply EditorConfig properties to current buffer.

This function does not respect the values of `editorconfig-exclude-modes' and
`editorconfig-exclude-regexps' and always applies available properties.
Use `editorconfig-mode-apply' instead to make use of these variables." t)
(autoload 'editorconfig-mode-apply "editorconfig-tools" "\
Get and apply EditorConfig properties to current buffer.

This function does nothing when the major mode is listed in
`editorconfig-exclude-modes', or variable `buffer-file-name' matches
any of regexps in `editorconfig-exclude-regexps'." t)
(autoload 'editorconfig-find-current-editorconfig "editorconfig-tools" "\
Find the closest .editorconfig file for current file." t)
(autoload 'editorconfig-display-current-properties "editorconfig-tools" "\
Display EditorConfig properties extracted for current buffer." t)
(defalias 'describe-editorconfig-properties #'editorconfig-display-current-properties)
(autoload 'editorconfig-format-buffer "editorconfig-tools" "\
Format buffer according to .editorconfig indent_style and indent_width." t)

;;; End of scraped data

(provide 'editorconfig-autoloads)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; no-native-compile: t
;; coding: utf-8-emacs-unix
;; End:

;;; editorconfig-autoloads.el ends here
