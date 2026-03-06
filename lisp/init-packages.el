;;; init-packages.el --- Package management settings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; 初始化包源
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; 在非Linux平台上初始化use-package
(unless (package-installed-p 'use-package)
  (unless package-archive-contents
    (package-refresh-contents))
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)
(setq use-package-expand-minimally t)

;; 指令日志（注释掉了）
;; (use-package command-log-mode)

;;ace-window 对 C-x o 重新绑定，使用时可以为每个 window 编个号，用编号进行跳转
(use-package ace-window
  :ensure t
  :bind (("C-x o" . 'ace-window)))

(provide 'init-packages)
;;; init-packages.el ends here
