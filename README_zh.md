# open-aippt — 为 AI Agent 而生的幻灯片框架

[![GitHub stars](https://img.shields.io/github/stars/aibabelx/open-aippt?style=for-the-badge)](https://github.com/aibabelx/open-aippt/stargazers)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)
[![npm version](https://img.shields.io/npm/v/@open-aippt/core?style=for-the-badge&color=red)](https://www.npmjs.com/package/@open-aippt/core)

**用自然语言描述你的演示文稿 — AI Agent 帮你写 React 代码。open-aippt 负责画布、缩放、导航、热更新和全屏演示，你只需专注内容。**

每张幻灯片渲染在固定的 **1920 × 1080** 画布上，页面是任意的 React 组件，没有受限的 DSL。

---

## 快速开始（用户）

### 创建新项目

```bash
npx @open-aippt/cli init my-slides
cd my-slides
pnpm install
pnpm dev
```

然后在浏览器中打开 `http://localhost:5173`，对 AI Agent 说："make slides about X"。

### 脚手架包含什么

- `slides/getting-started/` — 入门示例幻灯片
- `package.json` — 依赖 `@open-aippt/core`，提供运行时和 CLI
- `open-aippt.config.ts` — 可选的类型化配置
- `.claude/skills/` — Claude Code 技能（`create-slide`、`apply-comments` 等）
- `CLAUDE.md` — Agent 编写指南

你不会在项目中看到 Vite、React 或 tsconfig 配置文件 — 它们封装在 `@open-aippt/core` 内部。

---

## npm 包

本项目发布两个包到 [npm](https://www.npmjs.com/)：

### `@open-aippt/core` [![npm](https://img.shields.io/npm/v/@open-aippt/core?color=red)](https://www.npmjs.com/package/@open-aippt/core)

核心运行时 + CLI 工具。大多数用户通过 `npx @open-aippt/cli init` 自动安装。如果你需要手动接入已有项目：

```bash
pnpm add @open-aippt/core
```

安装后可在工作区使用 `open-aippt` 命令：

| 命令 | 说明 |
|------|------|
| `open-aippt dev` | 启动开发服务器。参数：`-p, --port <port>`、`--host [host]`、`--open` |
| `open-aippt build` | 构建静态站点。参数：`--out-dir <dir>`（默认 `dist`） |
| `open-aippt preview` | 预览生产版本。参数：`-p, --port <port>`、`--host [host]`、`--open` |

### `@open-aippt/cli` [![npm](https://img.shields.io/npm/v/@open-aippt/cli?color=red)](https://www.npmjs.com/package/@open-aippt/cli)

项目脚手架：

```bash
npx @open-aippt/cli init my-slides   # 创建新项目
npx @open-aippt/cli init --force     # 覆盖非空目录
npx @open-aippt/cli init --name foo  # 自定义 package.json 名称
```

---

## 编写幻灯片

幻灯片文件位于 `slides/<kebab-case-id>/index.tsx`，默认导出一个 `Page` 组件数组：

```tsx
import type { Page } from '@open-aippt/core';

const Cover: Page = () => (
  <div className="flex h-full w-full items-center justify-center">
    <h1 className="text-[120px] font-bold">你好，open-aippt</h1>
  </div>
);

const pages: Page[] = [Cover];
export default pages;

export const meta = { title: '我的幻灯片' };
```

### 导出的常量与类型

```ts
import {
  CANVAS_WIDTH,                // 1920
  CANVAS_HEIGHT,               // 1080
  unstable_SharedElement,      // 跨页面共享元素过渡
  type Page,
  type SlideMeta,
  type SlideModule,
  type SlideTransition,
  type OpenAipptConfig,
} from '@open-aippt/core';
```

### 配置文件

在项目根目录创建 `open-aippt.config.ts`（所有字段均可选）：

```ts
import type { OpenAipptConfig } from '@open-aippt/core';

const openAipptConfig: OpenAipptConfig = {
  slidesDir: 'slides',
  port: 5173,
  base: '/my-slides/',  // 部署到子路径时设置
};

export default openAipptConfig;
```

---

## 为什么选择 open-aippt

幻灯片本质是可视化代码。AI 擅长写代码。open-aippt 是把"用 X 主题做幻灯片"转化为精美、可演示的成品的关键运行时 — 无需离开聊天窗口。

### 🤖 Agent 原生创作

兼容所有主流 AI Coding Agent（Claude Code、Codex、Cursor 等）。脚手架内置技能：

- **`/create-slide`** — 端到端创作幻灯片。询问范围问题（主题 & 风格、页数、文本密度、动效），规划结构，撰写页面。
- **`/slide-authoring`** — 1920×1080 画布、字体比例、调色板、布局规则的技术参考。

### 🎯 浏览器内检查器

在开发服务器中点击任意元素，附加评论 — *"把这个改成红色"*、*"缩小标题"*。评论以 `@slide-comment` 标记持久化在源代码中。运行 `/apply-comments`，Agent 会自动应用所有待处理编辑并清除标记。

工作循环：演示 → 点击评论 → `/apply-comments` → 重复。

### 🎬 专业演示模式

全屏播放 + 键盘导航 + **演讲者模式**（当前/下一页预览、演讲备注、计时器）。为演讲台设计，不仅是浏览器标签页。

### 📦 导出静态 HTML 和 PDF

一条命令将幻灯片导出为自包含的静态 HTML 站点或可打印 PDF。

### 🚀 部署友好

输出纯静态构建 — 一键部署到 Vercel、Cloudflare Pages、Netlify 或任意静态托管。无服务端、无运行时、无锁定。

---

## 项目结构（贡献者）

一个 pnpm + Turbo monorepo，包含 4 个子包：

```
open-aippt/
├── packages/core/     @open-aippt/core   核心运行时 + Vite 插件 + CLI
├── packages/cli/      @open-aippt/cli    项目脚手架 (npx init)
├── apps/demo/         demo               开发用示例工作区
└── apps/web/          web                官网 (Next.js)
```

| 路径 | 包名 | 职责 |
|------|------|------|
| `packages/core` | `@open-aippt/core` | 运行时（首页、查看器、演示模式、检查器），Vite 插件，`open-aippt` CLI |
| `packages/cli` | `@open-aippt/cli` | `npx @open-aippt/cli init` 脚手架 + 项目模板 |
| `apps/demo` | private | 通过 `workspace:*` 消费 core，日常开发目标 |
| `apps/web` | private | 官网站点，文档 |

---

## 开发（贡献者）

### 环境要求

- Node.js >= 18
- pnpm >= 10

### 开始开发

```bash
pnpm install          # 安装依赖
pnpm dev              # 一键启动 demo + web
pnpm dev:demo         # 仅启动 demo
pnpm dev:web          # 仅启动官网
```

`pnpm dev` 执行流程：
1. Turbo 先构建 `packages/core`
2. `apps/demo` 执行 `open-aippt dev`，启动 Vite 开发服务器
3. `apps/web` 启动 Next.js 开发服务器

### 常用命令

| 命令 | 作用 |
|------|------|
| `pnpm dev` | 启动开发环境 |
| `pnpm build` | 构建所有包 |
| `pnpm typecheck` | TypeScript 类型检查 |
| `pnpm test` | 运行 vitest 测试 |
| `pnpm check` | Biome 格式化 + lint + import 整理 |
| `pnpm check:fix` | Biome 自动修复 |
| `pnpm core <cmd>` | 在 core 包上执行命令 |
| `pnpm cli <cmd>` | 在 cli 包上执行命令 |

### 核心架构

**CLI**（`packages/core/src/cli/run.ts`）：

| 命令 | 说明 |
|------|------|
| `open-aippt dev` | 启动 Vite 开发服务器，HMR 热更新 |
| `open-aippt build` | 构建生产版本 |
| `open-aippt preview` | 预览构建产物 |

**Vite 插件**（`packages/core/src/vite/open-aippt-plugin.ts`）：
- 扫描 `slides/` 目录，将 `.tsx` 作为虚拟模块加载
- 加载 `themes/` 主题系统
- 提供编辑、资产管理等运行时 API
- 文件变更自动热更新

**React 应用**（`packages/core/src/app/`）：
- 查看器模式：侧边栏导航 + 1920×1080 画布
- 演示模式：全屏播放 + 演讲者模式
- 检查器：元素选择、属性编辑、`@slide-comment` 标记

---

## 发布到 npm

```bash
# 1. 添加变更记录
pnpm changeset
# 选择包 (core / cli)，选择版本级别 (patch / minor / major)

# 2. 构建 + 发布
pnpm release
```

发布流程由 [Changesets](https://github.com/changesets/changesets) + GitHub Actions 自动化 — 推送 `main` 分支后触发。

### 发布规范

- **修改 `packages/core` 或 `packages/cli` 时，必须添加 changeset。**
- `apps/demo`、`apps/web` 和根工具配置不需要 changeset。
- 不要手动修改版本号或 CHANGELOG.md — 由 `changeset version` 管理。
- 提交前必须通过 Biome 检查（`pnpm check`）。

---

## 技术栈

| 类别 | 技术 |
|------|------|
| 构建工具 | Vite 5、tsdown、Turbo |
| 前端框架 | React 18、React Router 7 |
| 样式 | Tailwind CSS 4、shadcn/ui、Radix UI |
| CLI | Commander、Chalk |
| 代码质量 | Biome、Vitest、TypeScript 5 |
| 包管理 | pnpm、Changesets |
| 官网 | Next.js、Fumadocs、PostHog |

---

## License

MIT © aibabelx
