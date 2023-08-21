(custom-set-variables

 ;; Removes trailing whitespaces before saving
 '(before-save-hook (quote (delete-trailing-whitespace)))

 ;; start flycheck
 '(after-init-hook (quote (global-flycheck-mode)))

 )
