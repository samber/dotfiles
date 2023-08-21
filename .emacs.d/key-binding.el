
;; scroll one line at a time (less "jumpy" than defaults)
(require 'mouse)

;; (xterm-mouse-mode t)

(global-set-key [mouse-4] (lambda ()
                            (interactive)
                            (scroll-down 1)))
(global-set-key [mouse-5] (lambda ()
                            (interactive)
                            (scroll-up 1)))

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time


;; ctrl-c (twice) to comment line or black
(global-set-key (kbd "C-c C-c") 'comment-or-uncomment-region-or-line)
