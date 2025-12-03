# Strategic Lens Testing Guide

**Date:** 2025-11-24  
**Purpose:** Test per-round strategic lens configuration

---

## What Was Changed

### 1. `PROMPTS_CONFIG.sh`
- ✅ Added per-round strategic lens mode configuration
- ✅ Added LLM-specific strategic lenses:
  - **Gemini:** Strategic & Regulatory specialist
  - **Codex:** Technical Precision specialist  
  - **Grok:** Speed & Arbitrage specialist
  - **Claude:** Risk Mitigation & Behavioral specialist
- ✅ Added helper functions:
  - `get_system_prompt_for_round()` - Returns appropriate prompt based on round
  - `get_lens_mode_display()` - Returns display name for mode
  - `get_llm_lens_name()` - Returns lens name for specific LLM

### 2. `orchestrate_independent.sh`
- ✅ Uses `$ITERATION_ROUND` variable (defaults to 1)
- ✅ Each LLM function now uses round-specific system prompts
- ✅ Console output shows which lens each LLM is using
- ✅ Summary shows round number and lens mode

---

## Current Configuration

```bash
# In PROMPTS_CONFIG.sh - PER-ROUND, PER-LLM CONTROL:

# Round 1: All LLMs use strategic lenses
SYSTEM_PROMPT_ROUND_1_GEMINI_STRATEGIC_LENS_MODE=1   # Strategic & Regulatory
SYSTEM_PROMPT_ROUND_1_CODEX_STRATEGIC_LENS_MODE=1    # Technical Precision
SYSTEM_PROMPT_ROUND_1_GROK_STRATEGIC_LENS_MODE=1     # Speed & Arbitrage
SYSTEM_PROMPT_ROUND_1_CLAUDE_STRATEGIC_LENS_MODE=1   # Risk Mitigation & Behavioral

# Round 2-3: All LLMs use generic (objective validation)
SYSTEM_PROMPT_ROUND_2_GEMINI_STRATEGIC_LENS_MODE=0
SYSTEM_PROMPT_ROUND_2_CODEX_STRATEGIC_LENS_MODE=0
# ... etc
```

**Meaning:** 
- Round 1: ALL LLMs use their strategic lenses (maximum diversity)
- Rounds 2-3: ALL LLMs use generic prompts (objective validation)

**NEW FLEXIBILITY:** You can now enable lenses per-LLM per-round!

Example - Only Gemini strategic in Round 1:
```bash
SYSTEM_PROMPT_ROUND_1_GEMINI_STRATEGIC_LENS_MODE=1  # Strategic lens
SYSTEM_PROMPT_ROUND_1_CODEX_STRATEGIC_LENS_MODE=0   # Generic
SYSTEM_PROMPT_ROUND_1_GROK_STRATEGIC_LENS_MODE=0    # Generic
SYSTEM_PROMPT_ROUND_1_CLAUDE_STRATEGIC_LENS_MODE=0  # Generic
```

---

## How to Test

### Option 1: Re-run Round 1 of v20 (Compare with existing)

This will overwrite existing Round 1 outputs, so first backup:

```bash
cd /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v20

# Backup existing Round 1
cp -r 01_DIVERGENT_GENERATION 01_DIVERGENT_GENERATION_BACKUP_GENERIC

# Run with strategic lenses enabled
cd .agents_v5
./orchestrate_independent.sh

# Compare outputs
diff 01_DIVERGENT_GENERATION_BACKUP_GENERIC/Gemini_Approaches.md 01_DIVERGENT_GENERATION/Gemini_Approaches.md
```

**Expected Output:**
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
║  📐 Mode: LLM-Specific Strategic Lenses (FORCED DIVERSITY)   ║
╚══════════════════════════════════════════════════════════════╝
```

---

### Option 2: Test with Mode Disabled (Original Behavior)

```bash
# Edit PROMPTS_CONFIG.sh
SYSTEM_PROMPT_ROUND_1_STRATEGIC_LENS_MODE=0  # Disable

# Run
./orchestrate_independent.sh
```

**Expected Output:**
```
🔷 Running Gemini...
   Lens: Generic
🔶 Running ChatGPT...
   Lens: Generic
...

╔══════════════════════════════════════════════════════════════╗
║  ✅ Phase 0 Complete: Independent Generation                 ║
║  📐 Round: 1                                                  ║
║  📐 Mode: Generic Lens (OBJECTIVE VALIDATION)                ║
╚══════════════════════════════════════════════════════════════╝
```

---

### Option 3: Run Round 4 with Strategic Lenses (Recommended)

This won't overwrite existing work:

```bash
# Edit PROMPTS_CONFIG.sh - add Round 4 config
SYSTEM_PROMPT_ROUND_4_STRATEGIC_LENS_MODE=1  # Enable for Round 4

# Create Round4 directories
mkdir -p /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v20/01_DIVERGENT_GENERATION/Round4

# Set iteration round and run
export ITERATION_ROUND=4
./orchestrate_independent.sh
```

---

## What to Look For

### Strategic Diversity Indicators

**Gemini (Strategic & Regulatory):**
- Airspace development strategies
- PDR/regulation-driven opportunities  
- Grey Belt workarounds
- Policy timing plays

**Codex (Technical Precision):**
- Assembly opportunities
- Covenant removal strategies
- Boundary adjustment plays
- Technical PDR edge cases

**Grok (Speed & Arbitrage):**
- Fresh planning consents
- SHLAA emerging allocations
- Pre-adoption timing plays
- Information arbitrage

**Claude (Risk Mitigation & Behavioral):**
- Liquidation/distressed sales
- Long-hold tired landlords
- Precedent replication
- Off-market motivated sellers

---

## Success Criteria

**Lens Mode = 1 (Strategic Diversity):**
- ✅ Each LLM generates approaches aligned with their lens
- ✅ Minimal overlap between LLMs
- ✅ 6-8 unique strategic patterns across all LLMs
- ✅ Approaches are "pattern-focused" not just "filter-combinations"

**Lens Mode = 0 (Generic):**
- ⚠️ LLMs generate similar approaches
- ⚠️ High overlap in strategies
- ⚠️ 3-4 unique patterns (convergence)
- ⚠️ Approaches are "filter-combinations" more than "strategic patterns"

---

## Rollback if Needed

If the strategic lens forcing doesn't work well:

```bash
# Restore original PROMPTS_CONFIG.sh and orchestrate_independent.sh from templates
cp /home/ashsubband/landsignal/templates/.agents_v5/PROMPTS_CONFIG.sh .
cp /home/ashsubband/landsignal/templates/.agents_v5/orchestrate_independent.sh .
```

---

## Next Steps After Testing

1. **If successful** → Update master templates in `/templates/.agents_v5/`
2. **Document findings** → Add to `LEARNINGS_DATABASE.md`
3. **Update workflow docs** → Update `REPEATABLE_PROPERTY_WORKFLOW.md`
4. **Set default** → Decide default for `SYSTEM_PROMPT_ROUND_1_STRATEGIC_LENS_MODE` (recommend 1)

---

**Status:** Ready to test  
**Risk:** Low - only affects Round 1 generation, easy to rollback

