# Strategic Lens Implementation Summary

**Date:** 2025-11-24  
**Status:** ✅ Implemented in v20 project, ready to test  
**Next:** Test, then update master templates if successful

---

## Problem We're Solving

**Observed Issue:** Round 3 (v20) generated technically valid but less strategically diverse approaches compared to v13.

**Root Cause:** All LLMs use the same generic system prompt, causing convergent thinking and "filter-combination" approaches rather than "strategic pattern" approaches.

**Example from v13 (Good Diversity):**
- Gemini generated **"Airspace Maximizer"** - creative capital structure, novel strategy
- Clear strategic lens alignment

**Example from v20 (Less Diversity):**
- All LLMs generated similar precedent/motivation-based approaches
- More "filter combinations" than "strategic patterns"

---

## Solution Implemented

### Per-Round, Per-LLM Strategic Lens Configuration

Added ability to force LLM-specific strategic lenses on a **per-round AND per-LLM basis**:

```bash
# Round 1: Force diversity (ALL LLMs)
SYSTEM_PROMPT_ROUND_1_GEMINI_STRATEGIC_LENS_MODE=1
SYSTEM_PROMPT_ROUND_1_CODEX_STRATEGIC_LENS_MODE=1
SYSTEM_PROMPT_ROUND_1_GROK_STRATEGIC_LENS_MODE=1
SYSTEM_PROMPT_ROUND_1_CLAUDE_STRATEGIC_LENS_MODE=1

# Rounds 2-3: Objective validation (ALL LLMs generic)
SYSTEM_PROMPT_ROUND_2_GEMINI_STRATEGIC_LENS_MODE=0
SYSTEM_PROMPT_ROUND_2_CODEX_STRATEGIC_LENS_MODE=0
# ... etc
```

**NEW:** You can enable/disable lenses for EACH LLM independently!

### LLM Strategic Lenses

When mode=1, each LLM gets a specific strategic focus:

| LLM | Strategic Lens | Focus Areas |
|-----|---------------|-------------|
| **Gemini** | Strategic & Regulatory | Airspace, PDR, regulation-driven, Grey Belt |
| **Codex** | Technical Precision | Assemblies, covenants, boundary adjustments, technical PDR |
| **Grok** | Speed & Arbitrage | Fresh consents, SHLAA, timing plays, information arbitrage |
| **Claude** | Risk Mitigation & Behavioral | Liquidation, long-hold, precedent replication, motivated sellers |

---

## Files Modified

### 1. `PROMPTS_CONFIG.sh`

**Added:**
- Per-round strategic lens mode variables
- LLM-specific strategic lens system prompts
- Helper functions:
  - `get_system_prompt_for_round()` - Returns appropriate prompt
  - `get_lens_mode_display()` - Returns mode description
  - `get_llm_lens_name()` - Returns lens name for LLM

### 2. `orchestrate_independent.sh`

**Changed:**
- Added `ITERATION_ROUND` variable (defaults to 1)
- Each LLM generation function now uses round-specific prompts
- Console output shows which lens each LLM is using
- Summary displays round number and lens mode

---

## How It Works

### Round 1 (Generation) with Mode=1:
```bash
./orchestrate_independent.sh

# Output:
🔷 Running Gemini...
   Lens: Strategic & Regulatory
🔶 Running ChatGPT...
   Lens: Technical Precision
...

╔══════════════════════════════════════════════════════════════╗
║  ✅ Phase 0 Complete: Independent Generation                 ║
║  📐 Round: 1                                                  ║
║  📐 Mode: LLM-Specific Strategic Lenses (FORCED DIVERSITY)   ║
╚══════════════════════════════════════════════════════════════╝
```

### Round 2-3 (Critique/Iteration) with Mode=0:
```bash
./orchestrate_crossvalidation.sh

# All LLMs use generic objective prompt
# No strategic bias during validation
```

---

## Testing Plan

### Recommended: Run Round 4 with Strategic Lenses

```bash
cd /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v20/.agents_v5

# 1. Enable Round 4 strategic lenses
# Edit PROMPTS_CONFIG.sh, add:
SYSTEM_PROMPT_ROUND_4_STRATEGIC_LENS_MODE=1

# 2. Run Round 4 generation
export ITERATION_ROUND=4
./orchestrate_independent.sh

# 3. Compare Round 4 vs Round 3 outputs
# Look for:
# - More unique strategic patterns
# - Each LLM aligned with their lens
# - Less overlap between LLMs
```

### Success Metrics:

| Metric | Mode=0 (Generic) | Mode=1 (Strategic Lenses) |
|--------|------------------|---------------------------|
| Unique Patterns | 3-4 | 6-8 |
| LLM Overlap | High | Low |
| Approach Type | Filter-combinations | Strategic patterns |
| Creativity | Moderate | High |

---

## Expected Benefits

### When Mode=1 (Strategic Diversity):
1. ✅ **Maximum diversity** - Each LLM explores different strategic space
2. ✅ **Novel approaches** - More "Airspace Maximizer" style creativity
3. ✅ **Broader testing** - More strategic patterns empirically tested
4. ✅ **Better learnings** - More diverse results = more insights

### When Mode=0 (Generic):
1. ✅ **Objective validation** - No bias during critique
2. ✅ **Convergent thinking** - All LLMs agree on best approaches
3. ✅ **Technical focus** - Filter correctness prioritized

---

## Configuration Flexibility

### Per-Project Customization Examples:

```bash
# Example 1: Conservative (all generic)
SYSTEM_PROMPT_ROUND_1_GEMINI_STRATEGIC_LENS_MODE=0
SYSTEM_PROMPT_ROUND_1_CODEX_STRATEGIC_LENS_MODE=0
# ... all 0

# Example 2: Maximum diversity (all strategic in Round 1)
SYSTEM_PROMPT_ROUND_1_GEMINI_STRATEGIC_LENS_MODE=1
SYSTEM_PROMPT_ROUND_1_CODEX_STRATEGIC_LENS_MODE=1
SYSTEM_PROMPT_ROUND_1_GROK_STRATEGIC_LENS_MODE=1
SYSTEM_PROMPT_ROUND_1_CLAUDE_STRATEGIC_LENS_MODE=1

# Example 3: Hybrid (only Gemini strategic, others generic)
SYSTEM_PROMPT_ROUND_1_GEMINI_STRATEGIC_LENS_MODE=1   # Strategic
SYSTEM_PROMPT_ROUND_1_CODEX_STRATEGIC_LENS_MODE=0    # Generic
SYSTEM_PROMPT_ROUND_1_GROK_STRATEGIC_LENS_MODE=0     # Generic
SYSTEM_PROMPT_ROUND_1_CLAUDE_STRATEGIC_LENS_MODE=0   # Generic

# Example 4: Complementary pair (Gemini strategic + Claude behavioral)
SYSTEM_PROMPT_ROUND_1_GEMINI_STRATEGIC_LENS_MODE=1   # Strategic patterns
SYSTEM_PROMPT_ROUND_1_CODEX_STRATEGIC_LENS_MODE=0    # Generic
SYSTEM_PROMPT_ROUND_1_GROK_STRATEGIC_LENS_MODE=0     # Generic
SYSTEM_PROMPT_ROUND_1_CLAUDE_STRATEGIC_LENS_MODE=1   # Behavioral signals
```

### Runtime Override:

```bash
# Force strategic lenses for Round 4 without editing config:
export SYSTEM_PROMPT_ROUND_4_STRATEGIC_LENS_MODE=1
./orchestrate_independent.sh
```

---

## Next Steps

1. ✅ **Test in v20** - Run Round 4 with mode=1
2. ⏳ **Evaluate results** - Compare diversity vs Round 3
3. ⏳ **If successful** - Update master templates in `/templates/.agents_v5/`
4. ⏳ **Document** - Add findings to `LEARNINGS_DATABASE.md`
5. ⏳ **Set default** - Decide default for future projects (recommend mode=1 for Round 1)

---

## Rollback Plan

If strategic lensing doesn't improve diversity:

```bash
# Restore original files from master templates
cp /home/ashsubband/landsignal/templates/.agents_v5/PROMPTS_CONFIG.sh .
cp /home/ashsubband/landsignal/templates/.agents_v5/orchestrate_independent.sh .
```

**Risk:** Low - Easy to disable by setting mode=0

---

**Status:** ✅ Ready to test  
**Files Changed:** 2 (`PROMPTS_CONFIG.sh`, `orchestrate_independent.sh`)  
**Impact:** Round 1 generation only (Rounds 2-3 unchanged)  
**Reversible:** Yes (set mode=0 or restore from templates)

