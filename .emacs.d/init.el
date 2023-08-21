;; Load packages


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

(load-file "~/.emacs.d/package-list.el")
(load-file "~/.emacs.d/package.el")

(setq custom-emacs "~/.emacs.d/custom-emacs.el")
(setq custom-hooks "~/.emacs.d/custom-hooks.el")
(setq custom-modes "~/.emacs.d/custom-modes.el")
(load custom-emacs)
(load custom-hooks)
(load custom-modes)

(load-file "~/.emacs.d/functions.el")
(load-file "~/.emacs.d/key-binding.el")
