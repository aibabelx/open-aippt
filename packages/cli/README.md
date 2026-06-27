# @open-aippt/cli

Scaffold a workspace for [open-aippt](https://github.com/aibabelx/open-aippt) — a React-based slide framework with Claude Code skills preconfigured.

## Usage

```bash
npx @open-aippt/cli init my-slide
cd my-slide
pnpm install
pnpm dev
```

This creates a workspace containing:

- `slides/getting-started/` — a starter slide you can edit or delete.
- `package.json` — depends on `@open-aippt/core`, which provides the runtime (home page, slide viewer, fullscreen mode) and the `open-aippt` CLI.
- `open-aippt.config.ts` — optional typed config (slidesDir, port).
- `.claude/skills/` and `.agents/skills/` — Claude Code skills (`create-slide`, `apply-comments`, …).
- `CLAUDE.md` — agent guide for authoring slides.

You won't see any Vite, React, or tsconfig files in the workspace. They live inside `@open-aippt/core` and you never touch them.

## Commands

| Command | Description |
| --- | --- |
| `open-aippt init [dir]` | Scaffold a new workspace in `dir` (defaults to current dir). |
| `open-aippt init --force` | Scaffold into a non-empty directory. |
| `open-aippt init --name <name>` | Override the generated `package.json` name. |

(Once installed in the workspace, `@open-aippt/core` provides `open-aippt dev`, `open-aippt build`, and `open-aippt preview` via its own bin.)

## Authoring

Inside the scaffolded workspace, slides live under `slides/<kebab-case-id>/index.tsx` and default-export an array of `Page` components. Each page renders into a fixed 1920×1080 canvas; the framework handles scaling.

Ask Claude Code to "make slides about X" and the `create-slide` skill will take it from there.
