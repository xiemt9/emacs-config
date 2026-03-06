;;; init-python.el --- Python development settings -*- lexical-binding: t -*-
;;; Commentary:
;; This file contains Python specific settings, including LSP, virtual envs and Jupyter

;;; Code:

;; ========== Python 基础模式 ==========
(use-package python
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode))


;; ========== 虚拟环境管理 ==========
(use-package pyvenv
  :ensure t
  :config
  (pyvenv-mode 1))

(use-package lsp-pyright
  :ensure t
  :after lsp-mode
  :hook (python-mode . (lambda ()
                         (lsp-deferred))))


;; ========== Jupyter Notebook 支持（EIN） ==========
(use-package ein
  :ensure t
  :commands (ein:login ein:notebooklist-open ein:notebook-open)
  :defer t
  :config
  (setq ein:jupyter-default-notebook-directory "~/notebooks"))

(provide 'init-python)
;;; init-python.el ends here
