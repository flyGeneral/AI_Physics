#!/usr/bin/env bash
# 启动都江堰分水模型
# 用法:
#   ./start.sh          直接用默认浏览器打开（纯静态页面，无需服务器）
#   ./start.sh --serve  同时启动一个本地静态服务器 http://localhost:8623
set -e
cd "$(dirname "$0")"

if [ "$1" = "--serve" ]; then
  echo "都江堰分水模型已启动: http://localhost:8623  (Ctrl+C 停止)"
  ( sleep 1; open http://localhost:8623 2>/dev/null || true ) &
  exec python3 -m http.server 8623
fi

# 纯静态页面，直接打开即可（WebGL 无需服务器）
if command -v open >/dev/null 2>&1; then          # macOS
  open index.html
elif command -v xdg-open >/dev/null 2>&1; then    # Linux
  xdg-open index.html
else
  echo "请手动在浏览器中打开: $(pwd)/index.html"
fi
