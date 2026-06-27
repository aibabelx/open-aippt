# 发布到 NPM 服务器

## 前置条件

1. npm 账号已注册并登录：`npm login`
2. npm 账号已开启 2FA 双因素认证
3. 已创建 Granular Access Token（勾选 Bypass 2FA）

## 发布步骤

```bash
# 1. 设置 token（替换为你的实际 token）
npm config set //registry.npmjs.org/:_authToken=npm_YOUR_TOKEN

# 2. 发布 core
cd /Users/aix/aiworkspacex/open-aippt/packages/core
npm publish --access public

# 3. 发布 cli
cd ../cli
npm publish --access public
```

## 验证

```bash
npm view @open-aippt/core version
npm view @open-aippt/cli version
npx @open-aippt/cli init test-deck
```

## 注意事项

- Token 不要提交到 Git 仓库
- Token 过期后需在 https://www.npmjs.com/settings/aibabelx/tokens 重新生成
- 构建失败时先运行 `pnpm core build && pnpm cli build`
