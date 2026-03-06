# AGENTS.md

## Repository Purpose

This repository contains a personal Emacs configuration optimized for:

- terminal usage
- fast startup
- programming in C and Python
- modular configuration

Agents modifying this repository should prioritize maintainability,
clarity, and performance.

---

# Configuration Philosophy

The configuration follows several principles:

1. Keep `init.el` minimal
2. Prefer modular configuration
3. Use `use-package` for package management
4. Avoid loading packages during startup unless required
5. Prefer lazy loading
6. Maintain terminal compatibility

Startup performance is important.

---

# Repository Structure

The repository follows a modular structure.

init.el
    Main entry point.

early-init.el
    Startup optimizations and UI settings.

lisp/
    Modular configuration files.

Modules may include:

lisp/ui.el
lisp/editor.el
lisp/programming.el
lisp/keybindings.el

Agents should place new functionality in modules under `lisp/`.

Avoid expanding `init.el` unnecessarily.

---

# Package Management

This configuration uses:

use-package

Preferred pattern:

(use-package package-name
  :ensure t
  :defer t)

Agents should:

- use lazy loading
- avoid immediate `require`
- avoid loading packages at startup

Example:

(use-package magit
  :commands (magit-status)
  :bind ("C-x g" . magit-status))

---

# Performance Guidelines

Emacs startup performance is important.

Agents should:

- defer packages
- avoid synchronous operations
- avoid unnecessary `require`

Prefer:

:commands  
:hook  
:bind  

over immediate loading.

Startup target:

< 1 second in terminal mode.

---

# Keybinding Philosophy

Keybindings should follow standard Emacs conventions.

Preferred patterns:

C-c <letter>    user bindings  
C-x <key>       standard command bindings

Agents should avoid overriding core Emacs bindings.

---

# Programming Environment

Primary languages supported:

- C
- Python
- Emacs Lisp

Development tools may include:

- lsp-mode or eglot
- company
- flycheck
- project.el
- magit

Agents should integrate new packages with these tools.

---

# LSP Configuration

LSP should:

- start only for supported modes
- not run globally
- use hooks

Example:

(add-hook 'python-mode-hook #'lsp-deferred)

Agents should avoid starting LSP during Emacs startup.

---

# Testing Configuration

After modifying the configuration, agents should ensure:

1. Emacs starts without errors
2. Packages install correctly
3. Keybindings do not conflict

Basic test command:

emacs --batch -l init.el

---

# Allowed Changes

Agents may:

- add new packages
- improve modularity
- optimize startup performance
- improve documentation

Agents should avoid:

- introducing heavy dependencies
- loading packages eagerly
- breaking terminal compatibility

---

# Documentation

If major configuration changes occur, agents should update:

README.md

to explain new behavior.

---

# Commit Guidelines

Commits should be small and descriptive.

Examples:

feat: add magit integration  
perf: defer lsp-mode loading  
fix: correct python lsp configuration
