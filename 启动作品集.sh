#!/bin/bash
# 作品集一键启动脚本
# 双击或在终端运行即可

cd "$(dirname "$0")"

# 获取局域网IP
IP=$(ipconfig getifaddr en0 2>/dev/null || ipconfig getifaddr en1 2>/dev/null || echo "127.0.0.1")
PORT=8000

echo "========================================="
echo "  田狄翔作品集"
echo "========================================="
echo ""
echo "  电脑访问: http://127.0.0.1:$PORT"
echo "  手机扫码: http://$IP:$PORT"
echo ""
echo "  手机和电脑需连接同一WiFi"
echo "  二维码会自动使用当前IP，无需重新生成"
echo "  按 Ctrl+C 停止服务器"
echo "========================================="
echo ""

# 打开浏览器
sleep 1
open "http://127.0.0.1:$PORT"

# 启动服务器（绑定所有网卡，手机可访问）
python3 -m http.server $PORT --bind 0.0.0.0
