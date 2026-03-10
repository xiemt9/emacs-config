# Repository Guidelines

## Project Structure & Module Organization

`init.el` is the entry point and should stay thin: it loads core modules and defers optional ones. Put startup-only tweaks in `early-init.el`, and keep shared defaults in `custom-vars.el`. Add new behavior under `lisp/`, grouped by concern: `lisp/lang/` for language support, `lisp/tools/` for integrations, `lisp/text/` for writing modes, and `lisp/misc/` for helpers. Treat `elpa/` as installed package content; avoid editing it unless you are intentionally debugging or vendoring upstream code.

## Build, Test, and Development Commands

- `emacs --batch -l init.el` - smoke test that the configuration loads without startup errors.
- `emacs --debug-init` - start Emacs with backtraces enabled; use this after changing hooks, package setup, or startup order.
- `git diff --stat` - confirm the change stays scoped to the intended modules before opening a PR.

This repo is meant to live at `~/.emacs.d`, so run commands from that location or an equivalent symlinked checkout.

## Coding Style & Naming Conventions

Use Emacs Lisp with standard file headers and `lexical-binding: t`. Follow default Emacs indentation (typically 2 spaces) and keep `use-package` blocks aligned by keyword. Name modules `init-<topic>.el` and prefer repository-local prefixes such as `my/` for new functions and variables. Favor lazy loading with `:hook`, `:commands`, `:bind`, or idle timers over eager `require` calls in `init.el`.

## Testing Guidelines

There is no dedicated `tests/` directory, so each change needs a load test plus a manual smoke check in the affected mode. Reproduce regressions in a fresh Emacs session, apply the fix, then rerun the same workflow. If a change depends on external tools such as Pyright or Jupyter, note that in the change description.

## Commit & Pull Request Guidelines

Recent history favors short, imperative subjects, usually with prefixes like `perf:`, `fix:`, or `feat:`. Keep commits focused on one logical change and mention the touched module when helpful, for example `perf: defer init-projectile loading`. PRs should describe the user-visible effect, list verification steps, and call out any startup or performance impact. Add screenshots only for UI-facing changes such as theme, modeline, or window behavior.

## Configuration Tips

Do not commit machine-specific secrets, transient Emacs state, or hard-coded personal paths unless they are guarded. Prefer checks such as `file-directory-p` or move local-only overrides into ignored files.
