;;; init-lsp.el --- LSP settings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; LSP模式设置
(use-package lsp-mode
  :ensure t
  :defer t
  :init
  ;; 设置lsp-command-keymap的前缀
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; 各种模式启动LSP
         (c-mode . lsp-deferred)
         (python-mode . lsp-deferred)
         ;; which-key集成
         (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-deferred)
  :config
  ;; 性能优化
  (setq read-process-output-max (* 1024 1024)) ;; 1MB
  (setq lsp-idle-delay 0.500))

;; 可选：添加LSP UI增强
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-position 'at-point))


(provide 'init-lsp)
;;; init-lsp.el ends here
