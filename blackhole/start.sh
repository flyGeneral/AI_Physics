#!/usr/bin/env bash
# 启动黑洞模拟应用
# 用法:
#   ./start.sh          直接用默认浏览器打开（纯静态页面，无需服务器）
#   ./start.sh --serve  同时启动一个本地静态服务器 http://localhost:8622
set -e
cd "$(dirname "$0")"

if [ "$1" = "--serve" ]; then
  echo "黑洞模拟已启动: http://localhost:8622  (Ctrl+C 停止)"
  ( sleep 1; open http://localhost:8622 2>/dev/null || true ) &
  exec python3 -m http.server 8622
fi

# 纯静态页面，直接打开即可（WebGL 无需服务器）
if command -v open >/dev/null 2>&1; then          # macOS
  open index.html
elif command -v xdg-open >/dev/null 2>&1; then    # Linux
  xdg-open index.html
else
  echo "请手动在浏览器中打开: $(pwd)/index.html"
fi
