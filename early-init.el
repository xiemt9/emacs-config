;;; early-init.el --- Early startup optimizations -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Prevent package.el from loading packages before init.el.
(setq package-enable-at-startup nil)

;; Reduce GC pressure during startup.
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

(defvar my/default-gc-cons-threshold (* 32 1024 1024)
  "Default value to restore `gc-cons-threshold' after startup.")

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold my/default-gc-cons-threshold
                  gc-cons-percentage 0.1)))

;;; early-init.el ends here
