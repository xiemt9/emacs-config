;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:

;; Produce backtraces when errors occur: can be helpful to diagnose startup issues
;;(setq debug-on-error t)

(let ((minver "27.1"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version< emacs-version "28.1")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

;; 设定源码加载路径
(dolist (dir '("lisp" "lisp/lang" "lisp/tools" "lisp/text" "lisp/misc"))
  (add-to-list 'load-path (expand-file-name dir user-emacs-directory)))

;;使所有帮助类型的 buffer（包括 C-h m 显示的模式帮助）在右侧显示，且窗口宽度为当前帮助的 30%。
(add-to-list 'display-buffer-alist
             '("\\*Help\\*"
               (display-buffer-reuse-window display-buffer-in-side-window)
               (side . right)
               (window-width . 0.5)))

;; 加载自定义变量文件
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

;; 基础设置
(require 'init-core)       ;; 核心设置
(require 'init-packages)   ;; 包管理设置
(require 'init-ui)         ;; 界面相关设置
(require 'init-editor)     ;; 编辑器行为设置

;; 延迟加载非核心模块，减少启动阻塞
(defvar my/deferred-init-modules
  '(init-completion
    init-lsp
    init-python
    init-org
    init-markdown
    init-git
    init-projectile
    init-utils)
  "Modules loaded lazily after Emacs startup.")

(defun my/load-deferred-init-modules ()
  "Load deferred modules after startup when Emacs becomes idle."
  (run-with-idle-timer
   1 nil
   (lambda ()
     (dolist (feature my/deferred-init-modules)
       (require feature nil t)))))

(add-hook 'emacs-startup-hook #'my/load-deferred-init-modules)

(provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init.el ends here
