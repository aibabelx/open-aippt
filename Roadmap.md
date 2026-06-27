# open-aippt — Feature Roadmap

> open-aippt is a slide framework for the agent era. Describe a deck in natural language; your coding agent writes the React. open-aippt handles the canvas, scaling, navigation, hot reload, present mode, and export so the agent can focus on content.

---

## ✅ 已完成功能

### 🚀 项目脚手架

- `npx @open-aippt/cli init` — 一键创建项目
- 自动检测包管理器（npm/pnpm/yarn/bun）
- 自动初始化 git 并提交
- 内置 Agent 技能开箱即用
- 自带 `vercel.json` + `netlify.toml` 部署配置
- 参数：`--force`、`--name`、`--no-install`、`--no-git`

### 🎬 幻灯片查看器 & 演示

- 1920×1080 固定画布，自适应缩放
- 缩略图侧边栏（可拖拽调整宽度）
- 键盘（方向键）、滚轮、触屏翻页
- 全屏演示模式 + 控制栏（自动显隐）
- 演讲者模式（独立弹窗，BroadcastChannel 实时同步）
- 页面概览网格（快速跳转）
- 激光笔、黑屏/白屏切换
- 闲置检测（2 秒自动隐藏光标）
- 移动端适配（安全区域、横向缩略图）

### 🔍 浏览器内检查器

- 点击画布元素即时选中
- 内容编辑（含 IME 输入法支持）
- 字体大小 / 粗细 / 行高 / 字间距编辑
- 文字颜色 + 背景色（取色器 + 十六进制）
- 文本对齐控制
- 文字范围选中 + 内联样式注入
- 图片替换 + 裁剪（fill/fit）
- 拖拽替换图片
- ImagePlaceholder → 图片转换

### 💬 评论系统

- 元素级 `@slide-comment` 标记，写入源码
- 评论面板（浮动按钮 + 列表）
- 新增 / 删除评论
- `/apply-comments` Agent 自动应用编辑

### 🎨 设计系统

- Design Tokens 面板（快捷键 `D`）
- 实时编辑：背景色 / 文字色 / 强调色 / 字体 / 字号 / 圆角
- 12 套设计预设 + 随机切换
- CSS 变量注入（`--osd-bg`、`--osd-text` 等）
- 撤销 / 重做
- 源码 AST 持久化

### 🖌️ 主题系统

- `themes/<id>.md` + `.demo.tsx` 双文件结构
- 主题画廊 + 在线预览
- 幻灯片关联主题
- 调色板 / 字体 / 布局 / 动效元数据

### 📦 导出

| 格式 | 状态 |
|------|------|
| 静态 HTML（自包含） | ✅ 已完成 |
| PDF（浏览器打印） | ✅ 已完成 |
| 图片 PPTX（PNG → pptx） | ✅ 已完成 |
| 可编辑 PPTX | 🔜 计划中 |

### 🖼️ 资产管理

- 幻灯片级 + 全局资产目录
- 上传 / 重命名 / 删除
- 拖拽上传
- svgl Logo 搜索集成
- 资产使用追踪（删除前警告引用）

### 📁 幻灯片管理

- 文件夹系统（创建 / 编辑 / 删除 / 排序）
- 幻灯片拖拽到文件夹
- 幻灯片重命名 / 复制 / 删除 / 移动
- 页面排序 / 复制 / 删除
- 全文搜索（ID + 标题）
- 按时间 / 标题排序

### 🌐 多语言

- English（默认）
- 日本語
- 简体中文（zh-CN）
- 繁體中文（zh-TW）
- 复数处理 + 模板变量

### 🎬 幻灯片过渡 & 动效

- `SlideTransition` 过渡系统
- 共享元素过渡（`SharedElement`）
- `Step` / `Steps` 逐步揭示
- 前进 / 后退 / 跳转方向感知

### 🤖 Agent 技能

| 技能 | 说明 |
|------|------|
| `slide-authoring` | 幻灯片编写技术参考 |
| `create-slide` | 端到端创作幻灯片 |
| `create-theme` | 创建 / 提取主题 |
| `current-slide` | 解析用户当前所在页面 |
| `apply-comments` | 处理检查器标记 |

### 🗣️ 演讲备注

- 每页独立备注编辑器
- 自动保存（状态指示器）
- 持久化到源码 `export const notes`
- 演讲者模式中显示

### 🏗️ CLI 命令

| 命令 | 说明 |
|------|------|
| `open-aippt dev` | 启动开发服务器（`--port`/`--host`/`--open`） |
| `open-aippt build` | 构建静态站点（`--out-dir`） |
| `open-aippt preview` | 预览构建产物 |
| `open-aippt sync:skills` | 同步 Agent 技能（`--dry-run`） |

### ⚙️ 配置

```ts
type OpenAipptConfig = {
  base?: string;            // 部署子路径
  slidesDir?: string;       // 幻灯片目录
  themesDir?: string;       // 主题目录
  port?: number;            // 端口
  build?: {
    showSlideBrowser?: boolean;
    showSlideUi?: boolean;
    allowHtmlDownload?: boolean;
  };
};
```

### 🚀 部署

- 纯静态输出，支持任意静态托管
- Vercel / Netlify 一键部署
- 子路径部署（`base` 配置）

### 📚 官网 & 文档

- Next.js + Fumadocs 文档站点
- 完整 CLI / API / 原语 / 配置参考
- LLMs.txt 供 AI 上下文抓取
- Open Graph 图片

### 🔒 安全

- API 请求来源校验
- OIDC 可信发布到 npm
- GitHub Actions CI（lint + typecheck + test）

---

## 🔜 规划中

| 功能 | 优先级 | 说明 |
|------|--------|------|
| 可编辑 PPTX 导出 | 高 | UI 已标注 "Coming soon" |
| 远程部署集成 | 中 | 一键部署到 Vercel/Netlify 无需离开界面 |
| 协作编辑 | 低 | 多人同时编辑幻灯片 |
| 在线模板市场 | 低 | 社区主题 / 幻灯片模板分享 |
| 视频嵌入 | 低 | Page 内原生视频支持 |
| 演讲者远程控制 | 低 | 手机端遥控演示 |

---

## 📊 技术指标

| 指标 | 数值 |
|------|------|
| npm 包数量 | 2（`@open-aippt/core` + `@open-aippt/cli`） |
| 支持语言 | 4（en / ja / zh-CN / zh-TW） |
| Agent 技能 | 5 |
| 导出格式 | 3（HTML / PDF / PPTX） |
| CLI 命令 | 5 |
| 画布尺寸 | 1920 × 1080 |
| Node 最低版本 | 18 |
