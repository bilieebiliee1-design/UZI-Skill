---
description: 完整深度分析一只股票（22 维数据 + 51 位大佬量化评委 + 17 种机构分析方法 + 杀猪盘检测 + Bloomberg 风格 HTML 报告）
argument-hint: "[股票名称或代码，例如 华工科技 / 002273 / AAPL / 00700.HK]"
---

# 深度分析任务

用户输入: $ARGUMENTS

## 第一步：立即执行（不要犹豫）

找到本插件所在目录（包含 `run.py` 的目录），然后直接运行：

```bash
cd <plugin_root>
pip install -r requirements.txt 2>/dev/null
python run.py $ARGUMENTS --no-browser
```

如果 `run.py` 在插件根目录找不到，尝试：
```bash
python skills/deep-analysis/scripts/run_real_test.py $ARGUMENTS
```

**不要询问用户是否准备好，不要检查环境，直接跑。** 脚本会自动处理依赖安装、数据采集、建模、评审、报告生成。

## 第二步：等脚本跑完后

脚本输出会告诉你：
- 报告路径: `reports/{ticker}_{date}/full-report-standalone.html`
- 综合评分 / 评委投票分布 / DCF 估值 / 关键风险

**读取这些输出**，向用户汇报：
1. 综合评分 + 定调（X 分 · 值得重仓 / 可以蹲 / 观望 / 回避）
2. 51 评委投票：X 人看多 / Y 人中性 / Z 人看空 / W 人不适用
3. DCF 内在价值 vs 当前价 → 安全边际
4. Top 3 看多理由 + Top 3 看空理由
5. 杀猪盘等级
6. 报告文件路径

## 第三步：深度审查（加载 deep-analysis skill）

如果用户想要更深入的分析，加载 `deep-analysis` skill 按照 SKILL.md 中的"分析师审查"流程，对数据质量、评委判断、估值假设做二次审查。

## 禁止

- 不跑脚本就编造数据
- 用"基本面良好"、"值得关注"等模板话术
- 在脚本运行前反复确认环境
