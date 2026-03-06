;;; init-utils.el --- Misc utility integrations -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package atomic-chrome
  :ensure t
  :defer t
  :hook (after-init . atomic-chrome-start-server))

(provide 'init-utils)
;;; init-utils.el ends here
