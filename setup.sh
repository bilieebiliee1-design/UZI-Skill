#!/bin/bash
# UZI-Skill 一键安装脚本
# 用法: bash <(curl -fsSL https://raw.githubusercontent.com/wbh604/UZI-Skill/main/setup.sh)

set -e

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🎯 游资（UZI）Skills · 安装中..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# 检查 Python
if ! command -v python3 &>/dev/null && ! command -v python &>/dev/null; then
    echo "❌ 未找到 Python，请先安装 Python 3.9+"
    exit 1
fi

PYTHON=$(command -v python3 || command -v python)
echo "✓ Python: $($PYTHON --version)"

# 检查 git
if ! command -v git &>/dev/null; then
    echo "❌ 未找到 git"
    exit 1
fi

# 克隆（如果不在仓库内）
if [ ! -f "run.py" ]; then
    if [ -d "UZI-Skill" ]; then
        echo "✓ UZI-Skill 目录已存在，更新中..."
        cd UZI-Skill && git pull
    else
        echo "⏬ 克隆仓库..."
        git clone https://github.com/wbh604/UZI-Skill.git
        cd UZI-Skill
    fi
else
    echo "✓ 已在仓库目录中"
fi

# 安装依赖
echo "📦 安装 Python 依赖..."
$PYTHON -m pip install -r requirements.txt -q

# 验证
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ 安装完成！"
echo ""
echo "用法:"
echo "  python run.py 贵州茅台           # 分析 A 股"
echo "  python run.py AAPL              # 分析美股"
echo "  python run.py 00700.HK          # 分析港股"
echo "  python run.py 600519.SH --remote # 生成公网链接"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
