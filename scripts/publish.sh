#!/usr/bin/env bash
set -euo pipefail

# publish.sh — 发布 @open-aippt/core 和 @open-aippt/cli 到 npm
#
# 用法:
#   ./scripts/publish.sh              # 使用当前 token 发布
#   ./scripts/publish.sh <otp>        # 使用 2FA 验证码发布
#   ./scripts/publish.sh --token xxx  # 使用指定 token 发布

ROOT="$(cd "$(dirname "$0")/.." && pwd)"

echo "=== 1. 检查 npm 登录状态 ==="
npm whoami || { echo "❌ 未登录 npm，请先执行 npm login"; exit 1; }

echo "=== 2. 构建 ==="
cd "$ROOT"
pnpm core build
pnpm cli build

echo "=== 3. 检查版本号 ==="
CORE_VER=$(node -e "console.log(require('$ROOT/packages/core/package.json').version)")
CLI_VER=$(node -e "console.log(require('$ROOT/packages/cli/package.json').version)")
echo "  @open-aippt/core: $CORE_VER"
echo "  @open-aippt/cli:  $CLI_VER"

echo "=== 4. 发布 core ==="
cd "$ROOT/packages/core"
if [ -n "${1:-}" ] && [[ "$1" != --* ]]; then
  npm publish --access public --otp="$1"
else
  npm publish --access public
fi

echo ""
echo "=== 5. 发布 cli ==="
cd "$ROOT/packages/cli"
if [ -n "${1:-}" ] && [[ "$1" != --* ]]; then
  npm publish --access public --otp="$1"
else
  npm publish --access public
fi

echo ""
echo "✅ 发布完成！"
echo "  @open-aippt/core@$CORE_VER"
echo "  @open-aippt/cli@$CLI_VER"
echo ""
echo "验证: npx @open-aippt/cli init test-deck"