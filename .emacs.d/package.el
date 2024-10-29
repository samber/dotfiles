(require 'package)

(setq package-archives
      '(
	      ("gnu" . "http://elpa.gnu.org/packages/")
	      ("marmalade" . "http://marmalade-repo.org/packages/")
	      ("melpa" . "http://melpa.milkbox.net/packages/")))


;; package manager for copilot
(unless (package-installed-p 'quelpa)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.githubusercontent.com/quelpa/quelpa/master/quelpa.el")
    (eval-buffer)
    (quelpa-self-upgrade)))
(quelpa
 '(quelpa-use-package
   :fetcher git
   :url "https://github.com/quelpa/quelpa-use-package.git"))
(require 'quelpa-use-package)



(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))


;; install deps in package-list.el
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


;; install copliot
;; (use-package copilot
;;   :quelpa (copilot :fetcher github
;;                    :repo "copilot-emacs/copilot.el"
;;                    :branch "main"
;;                    :files ("*.el")))
