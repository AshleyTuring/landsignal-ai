# Strategic Lens Quick Reference

**Date:** 2025-11-24  
**Feature:** Per-Round, Per-LLM Strategic Lens Control

---

## Variable Format

```bash
SYSTEM_PROMPT_ROUND_X_LLMNAME_STRATEGIC_LENS_MODE=0/1

# X = Round number (1, 2, 3, 4, ...)
# LLMNAME = GEMINI, CODEX, GROK, or CLAUDE (uppercase)
# 0 = Generic prompt
# 1 = LLM-specific strategic lens
```

---

## LLM Strategic Lenses

| LLM | Lens Name | Focus |
|-----|-----------|-------|
| **GEMINI** | Strategic & Regulatory | Airspace, PDR, regulation, Grey Belt, policy timing |
| **CODEX** | Technical Precision | Assemblies, covenants, boundaries, technical PDR |
| **GROK** | Speed & Arbitrage | Fresh consents, SHLAA, timing plays, information arbitrage |
| **CLAUDE** | Risk Mitigation & Behavioral | Liquidation, long-hold, precedent, motivated sellers |

---

## Common Configurations

### Maximum Diversity (Recommended for Round 1)
```bash
SYSTEM_PROMPT_ROUND_1_GEMINI_STRATEGIC_LENS_MODE=1
SYSTEM_PROMPT_ROUND_1_CODEX_STRATEGIC_LENS_MODE=1
SYSTEM_PROMPT_ROUND_1_GROK_STRATEGIC_LENS_MODE=1
SYSTEM_PROMPT_ROUND_1_CLAUDE_STRATEGIC_LENS_MODE=1
```

### All Generic (Recommended for Rounds 2-3)
```bash
SYSTEM_PROMPT_ROUND_2_GEMINI_STRATEGIC_LENS_MODE=0
SYSTEM_PROMPT_ROUND_2_CODEX_STRATEGIC_LENS_MODE=0
SYSTEM_PROMPT_ROUND_2_GROK_STRATEGIC_LENS_MODE=0
SYSTEM_PROMPT_ROUND_2_CLAUDE_STRATEGIC_LENS_MODE=0
```

### Only Strategic LLM (Gemini)
```bash
SYSTEM_PROMPT_ROUND_1_GEMINI_STRATEGIC_LENS_MODE=1   # Strategic
SYSTEM_PROMPT_ROUND_1_CODEX_STRATEGIC_LENS_MODE=0    # Generic
SYSTEM_PROMPT_ROUND_1_GROK_STRATEGIC_LENS_MODE=0     # Generic
SYSTEM_PROMPT_ROUND_1_CLAUDE_STRATEGIC_LENS_MODE=0   # Generic
```

### Strategic + Behavioral Pair
```bash
SYSTEM_PROMPT_ROUND_1_GEMINI_STRATEGIC_LENS_MODE=1   # Strategic patterns
SYSTEM_PROMPT_ROUND_1_CODEX_STRATEGIC_LENS_MODE=0    # Generic
SYSTEM_PROMPT_ROUND_1_GROK_STRATEGIC_LENS_MODE=0     # Generic
SYSTEM_PROMPT_ROUND_1_CLAUDE_STRATEGIC_LENS_MODE=1   # Behavioral signals
```

---

## Runtime Override

Override without editing config file:

```bash
# Enable Gemini strategic lens for Round 4
export SYSTEM_PROMPT_ROUND_4_GEMINI_STRATEGIC_LENS_MODE=1
export ITERATION_ROUND=4
./orchestrate_independent.sh
```

---

## Helper Functions

### `get_system_prompt_for_round(llm, round)`
Returns the appropriate system prompt for the given LLM and round.

### `get_llm_lens_name(llm, round)`
Returns the lens name (e.g., "Strategic & Regulatory" or "Generic").

### `get_lens_mode_display(round)`
Returns overall mode description for the round:
- "LLM-Specific Strategic Lenses (ALL - FORCED DIVERSITY)" - all 4 enabled
- "Mixed Mode (N LLMs with strategic lens)" - some enabled
- "Generic Lens (ALL - OBJECTIVE VALIDATION)" - all disabled

---

## Console Output Examples

### All Strategic Lenses Enabled:
```
🔷 Running Gemini...
   Lens: Strategic & Regulatory
🔶 Running ChatGPT...
   Lens: Technical Precision
🟣 Running Grok...
   Lens: Speed & Arbitrage
🔵 Running Claude...
   Lens: Risk Mitigation & Behavioral

╔══════════════════════════════════════════════════════════════╗
║  ✅ Phase 0 Complete: Independent Generation                 ║
║  📐 Round: 1                                                  ║
║  📐 Mode: LLM-Specific Strategic Lenses (ALL - FORCED DIVERSITY) ║
╚══════════════════════════════════════════════════════════════╝

Outputs:
  • Gemini (Strategic & Regulatory): 245 lines
  • ChatGPT (Technical Precision): 189 lines
  • Grok (Speed & Arbitrage): 312 lines
  • Claude (Risk Mitigation & Behavioral): 156 lines
```

### Mixed Mode (Only Gemini Strategic):
```
🔷 Running Gemini...
   Lens: Strategic & Regulatory
🔶 Running ChatGPT...
   Lens: Generic
🟣 Running Grok...
   Lens: Generic
🔵 Running Claude...
   Lens: Generic

╔══════════════════════════════════════════════════════════════╗
║  ✅ Phase 0 Complete: Independent Generation                 ║
║  📐 Round: 1                                                  ║
║  📐 Mode: Mixed Mode (1 LLMs with strategic lens)            ║
╚══════════════════════════════════════════════════════════════╝
```

### All Generic:
```
🔷 Running Gemini...
   Lens: Generic
🔶 Running ChatGPT...
   Lens: Generic
🟣 Running Grok...
   Lens: Generic
🔵 Running Claude...
   Lens: Generic

╔══════════════════════════════════════════════════════════════╗
║  ✅ Phase 0 Complete: Independent Generation                 ║
║  📐 Round: 1                                                  ║
║  📐 Mode: Generic Lens (ALL - OBJECTIVE VALIDATION)          ║
╚══════════════════════════════════════════════════════════════╝
```

---

## When to Use Each Mode

| Scenario | Configuration | Why |
|----------|---------------|-----|
| **Maximum Diversity** | All LLMs=1 | Exploratory projects, want broad strategic space |
| **Conservative** | All LLMs=0 | Want convergent validation, proven approaches |
| **Gemini Strategic Only** | Gemini=1, others=0 | Want ONE creative voice, others validate |
| **Strategic + Behavioral** | Gemini=1, Claude=1, others=0 | Pattern diversity + motivation signals |
| **Technical Focus** | Codex=1, others=0 | Want precision on niche opportunities |
| **Speed Focus** | Grok=1, others=0 | Time-sensitive or arbitrage strategies |

---

## Troubleshooting

**Q: Console shows "Generic" even though I set mode=1**  
A: Check variable name format - must be uppercase LLM name:
- ✅ `SYSTEM_PROMPT_ROUND_1_GEMINI_STRATEGIC_LENS_MODE=1`
- ❌ `SYSTEM_PROMPT_ROUND_1_gemini_STRATEGIC_LENS_MODE=1`

**Q: Mode shows "Mixed Mode (0 LLMs)" but I want all strategic**  
A: You set all to 1, but forgot to export or source the updated config:
```bash
source .agents_v5/PROMPTS_CONFIG.sh
```

**Q: Want to disable mid-workflow**  
A: Edit `PROMPTS_CONFIG.sh`, change mode=1 to mode=0, re-run script.

---

**Quick Test:** Run with all strategic lenses, compare output diversity vs previous runs.

