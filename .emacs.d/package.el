(require 'package)

(setq package-archives
             '(
	       ("gnu" . "http://elpa.gnu.org/packages/")
	       ("marmalade" . "http://marmalade-repo.org/packages/")
	       ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
