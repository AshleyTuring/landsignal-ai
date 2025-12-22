# Strategic Lens Feature - Master Template Update

**Date:** 2025-11-24  
**Version:** v5.3.0  
**Status:** ✅ Production Ready

---

## 🎯 What Changed

### **Problem Solved:**
- **LLM Convergence:** All LLMs were generating similar approaches, missing strategic diversity
- **Missing Strategies:** Airspace Maximizer and other niche patterns weren't appearing
- **Generic Prompts:** System prompts weren't guiding LLMs to think differently

### **Solution Implemented:**
**Per-Round, Per-LLM Strategic Lens Configuration**

---

## 📋 Files Updated

### **1. PROMPTS_CONFIG.sh** (299 → 561 lines)

**Added:**
- ✅ Per-round, per-LLM strategic lens mode configuration
- ✅ 4 LLM-specific strategic lens prompts with concrete pattern examples
- ✅ Helper functions: `get_system_prompt_for_round()`, `get_llm_lens_name()`
- ✅ Round 1-5 configuration (default: Round 1=strategic, 2-3=generic)

**Enhanced System Prompts:**

```bash
# Gemini: Strategic & Regulatory
- Pattern 6A: Airspace Development (flat roof + height headroom)
- Pattern 8A: HMO License Expiry
- Pattern 4B: Option Agreements

# Codex: Technical Precision  
- Pattern 23A: Unbroken Freehold Titles
- Pattern 22A: HMO Conversion
- Pattern 20A: Brand Covenant Expiry
- Pattern 5A: Low-Rise in Tall Building Zones

# Grok: Speed & Arbitrage
- Pattern 13A: Fresh Planning Consents (24-48h)
- Pattern 13B: New SHLAA Allocations
- Pattern 8A/8B: Deadline-Driven Actions

# Claude: Risk Mitigation & Behavioral
- Pattern 3A: Similar Planning Approvals
- Pattern 2D: Liquidation/Administration
- Pattern 2A: Long Hold + Derelict
- Pattern 14A: Legacy Holdings (Never Sold)
```

---

### **2. orchestrate_independent.sh** (211 → 242 lines)

**Added:**
- ✅ `ITERATION_ROUND` variable support (defaults to 1)
- ✅ Dynamic system prompt selection via `get_system_prompt_for_round()`
- ✅ Gemini CLI fix: Embed system prompt in main prompt (no `--system-prompt` support)
- ✅ Grok CLI fix: Embed system prompt in main prompt (no `--system-prompt` support)
- ✅ Lens name display in output
- ✅ Round number display in summary

**Updated Functions:**
```bash
generate_gemini()  # Now uses strategic lens + embedded prompt
generate_codex()   # Now uses strategic lens
generate_grok()    # Now uses strategic lens + embedded prompt
generate_claude()  # Now uses strategic lens (already had --system-prompt)
```

---

## 🧪 Testing Results

### **Test Project:** MixedUse-8Storey-2M-v20

**Round 4 (Initial Strategic Lens Test):**
- Diversity Score: 8.6/10 (+120% vs baseline 3.9/10)
- New patterns: HMO License Expiry, Edge-of-Settlement Land Promotion, Low EPC

**Round 5 (Enhanced with Concrete Examples):**
- Diversity Score: 9.2/10 (+136% vs baseline)
- **BREAKTHROUGH:** Airspace Maximizer restored ✅
- Additional patterns: Unbroken Freehold, Brand Covenant Expiry

### **Key Metrics:**

| Metric | Baseline | Round 4 | Round 5 | Improvement |
|--------|----------|---------|---------|-------------|
| Unique Filter Types | 18 | 27 | 29 | +61% |
| Strategic Patterns | 5 | 9 | 11 | +120% |
| Regulatory Arbitrage | 1 | 4 | 5 | +400% |
| Policy-Driven | 0 | 2 | 2 | +∞% |

---

## 🎯 How to Use

### **Default Configuration (Recommended):**

```bash
# Round 1: Independent Generation
SYSTEM_PROMPT_ROUND_1_GEMINI_STRATEGIC_LENS_MODE=1   # Diversity
SYSTEM_PROMPT_ROUND_1_CODEX_STRATEGIC_LENS_MODE=1
SYSTEM_PROMPT_ROUND_1_GROK_STRATEGIC_LENS_MODE=1
SYSTEM_PROMPT_ROUND_1_CLAUDE_STRATEGIC_LENS_MODE=1

# Round 2: Cross-Validation Critique  
SYSTEM_PROMPT_ROUND_2_GEMINI_STRATEGIC_LENS_MODE=0   # Objectivity
SYSTEM_PROMPT_ROUND_2_CODEX_STRATEGIC_LENS_MODE=0
# ... etc

# Round 3: Technical Iteration
SYSTEM_PROMPT_ROUND_3_GEMINI_STRATEGIC_LENS_MODE=0   # Objectivity
# ... etc
```

**Rationale:**
- **Round 1:** Want diversity → Use strategic lenses (each LLM thinks differently)
- **Rounds 2-3:** Want objectivity → Use generic prompt (fair technical validation)

---

### **Running with Strategic Lenses:**

**Standard workflow (uses default Round 1 config):**
```bash
cd /path/to/project/.agents_v5
./orchestrate_independent.sh
```

**Test different rounds:**
```bash
export ITERATION_ROUND=2  # Use Round 2 config (generic prompts)
./orchestrate_independent.sh
```

**Custom configuration:**
```bash
# Edit PROMPTS_CONFIG.sh to change per-round, per-LLM settings
# Example: Enable strategic lens for Round 2 critique (not recommended)
SYSTEM_PROMPT_ROUND_2_GEMINI_STRATEGIC_LENS_MODE=1
```

---

## 🔧 Configuration Guide

### **Strategic Lens Mode Values:**

```bash
0 = Generic system prompt (objectivity)
1 = LLM-specific strategic lens (diversity)
```

### **When to Use Strategic Lenses:**

✅ **USE Strategic Lenses (mode=1):**
- Independent generation (Round 1)
- When you want diverse strategic approaches
- First pass at a new project

❌ **DON'T USE Strategic Lenses (mode=0):**
- Critique/validation rounds (Rounds 2-3)
- When you want objective technical review
- When comparing approaches fairly

---

## 📊 Impact Analysis

### **Before Strategic Lenses (Baseline):**
- ⚠️ All 5 approaches used transport proximity filters
- ⚠️ All 5 used similar title area ranges
- ⚠️ 4 of 5 used inactive/derelict filters
- ⚠️ 3 of 5 approaches from Claude (convergence)
- ⚠️ ZERO policy-driven approaches
- ⚠️ No airspace-specific strategies

### **After Strategic Lenses (Round 5):**
- ✅ Each LLM generated distinct perspectives
- ✅ 11 unique strategic patterns (vs 5)
- ✅ 5 regulatory arbitrage angles (vs 1)
- ✅ 2 policy-driven approaches (vs 0)
- ✅ Novel filters: flat roof, HMO expiry, SHLAA gaps, lease expiry
- ✅ Airspace Maximizer restored

---

## 🚀 Migration Guide

### **For Existing Projects:**

**Option 1: Fresh Start (Recommended)**
```bash
# Use updated templates for new projects
# Strategic lenses will be active by default
```

**Option 2: Update Existing Project**
```bash
# Copy updated files to existing project
cp /path/to/templates/.agents_v5/PROMPTS_CONFIG.sh /path/to/project/.agents_v5/
cp /path/to/templates/.agents_v5/orchestrate_independent.sh /path/to/project/.agents_v5/

# Re-run generation
cd /path/to/project/.agents_v5
./orchestrate_independent.sh
```

**Option 3: Gradual Adoption**
```bash
# Test on one LLM first
SYSTEM_PROMPT_ROUND_1_GEMINI_STRATEGIC_LENS_MODE=1  # Enable Gemini only
SYSTEM_PROMPT_ROUND_1_CODEX_STRATEGIC_LENS_MODE=0
SYSTEM_PROMPT_ROUND_1_GROK_STRATEGIC_LENS_MODE=0
SYSTEM_PROMPT_ROUND_1_CLAUDE_STRATEGIC_LENS_MODE=0
```

---

## 🎓 Understanding Strategic Lenses

### **What are Strategic Lenses?**

Instead of all LLMs using the same generic prompt:
```
"You are an expert property development analyst..."
```

Each LLM gets a specialized role:
```
Gemini: "You are Gemini, the STRATEGIC & REGULATORY specialist.
         Focus on airspace development, HMO licenses, regulatory arbitrage..."

Codex:  "You are Codex, the TECHNICAL PRECISION specialist.
         Focus on assemblies, covenants, unbroken freeholds..."

Grok:   "You are Grok, the SPEED & ARBITRAGE specialist.
         Focus on fresh consents, timing advantages, SHLAA gaps..."

Claude: "You are Claude, the RISK MITIGATION specialist.
         Focus on liquidation, precedents, motivated sellers..."
```

**Result:** Each LLM naturally explores different strategic territory.

---

## 📖 Examples

### **Example 1: Gemini with Strategic Lens**

**Input:** Requirements for £2M profit, £200k capital

**Output (Round 5):**
```
Approach A: Precedent-Informed Airspace Intensification
- Pattern 6A: Airspace Development
- Filter: "A building in the title has flat roof: Yes"
- Filter: "Number of leaseholds on the freehold: is less than 2"
- Capital: £175k for airspace rights
```

**Without Strategic Lens (Baseline):**
- Would have generated generic precedent approach (like Claude)
- No flat roof filter
- No airspace-specific strategy

---

### **Example 2: Codex with Strategic Lens**

**Output (Round 5):**
```
Approach B: Unbroken Freehold HMO Conversion
- Pattern 23A: Unbroken Freehold + Pattern 22A: HMO Conversion
- Filter: "Number of leaseholds on the freehold: is less than 1"
- No assembly risk, single negotiation
```

**Without Strategic Lens (Baseline):**
- Would have generated similar approaches to Gemini/Claude
- No focus on title simplicity
- No HMO conversion angle

---

## 🔍 Troubleshooting

### **Issue: LLMs still converging**

**Check:**
1. Is `SYSTEM_PROMPT_ROUND_1_*_STRATEGIC_LENS_MODE=1` set for all LLMs?
2. Are concrete pattern examples in system prompts?
3. Is `ITERATION_ROUND` defaulting to 1 in orchestrate_independent.sh?

**Solution:**
```bash
# Verify configuration
grep "SYSTEM_PROMPT_ROUND_1" PROMPTS_CONFIG.sh

# Should show all =1 for Round 1
```

---

### **Issue: Gemini/Grok not using system prompts**

**Problem:** These CLIs don't support `--system-prompt` flag

**Solution:** Already fixed in updated `orchestrate_independent.sh`
- System prompt is embedded in main prompt argument
- Works for both Gemini and Grok

---

### **Issue: Want different configuration per project**

**Solution:** Strategic lens config is per-project
```bash
# Edit your project's PROMPTS_CONFIG.sh
cd /path/to/your/project/.agents_v5
nano PROMPTS_CONFIG.sh

# Customize per-round, per-LLM settings
```

---

## 📚 Related Documentation

- **STRATEGIC_LENS_SUMMARY.md** - Comprehensive overview
- **STRATEGIC_LENS_QUICK_REF.md** - Quick reference card
- **STRATEGIC_LENS_TEST.md** - Test procedures
- **STRATEGIC_DIVERSITY_COMPARISON.md** - Before/after analysis (v20)

---

## 🎯 Next Steps

1. ✅ **Master templates updated** - New projects inherit strategic lenses
2. ⏳ **Test on new project** - Validate on different use case
3. ⏳ **Monitor diversity metrics** - Track strategic pattern counts
4. ⏳ **Refine patterns** - Add more LLM-specific examples based on learnings

---

**Version:** v5.3.0  
**Status:** Production Ready  
**Tested:** MixedUse-8Storey-2M-v20 (Rounds 4-5)  
**Impact:** +136% strategic diversity improvement

