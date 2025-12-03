# Prompt Consistency Fix - v11.0

## Critical Flaw Identified by User

The orchestration scripts were **artificially forcing divergence** by giving each LLM different prompts with specific angles/focuses. This violated the v3.2.0 design principle of "natural convergence/divergence."

## Problems Fixed

### 1. Independent Generation (orchestrate_independent.sh)

**Before (FORCED DIVERGENCE):**
- Gemini: "Focus on strategic, high-level patterns and regulatory opportunities"
- Codex: "Focus on detailed execution, technical precision, and niche opportunities"
- Grok: "Focus on speed/timing advantages and innovative arbitrage opportunities"
- Claude: "Focus on risk mitigation, precedent analysis, and behavioral signals"

**After (NATURAL DIVERGENCE):**
- ALL LLMs: "You are an expert property development analyst. Generate 1-3 unique property search strategies based on the requirements in the context above."

**Rationale:** Let each LLM's inherent capabilities drive divergence, not artificial prompt engineering.

---

### 2. Precedent Requirement

**Before (VAGUE):**
```
5. **Precedent Analysis:** At least ONE approach should be based on reference planning application(s)
```

**After (MANDATORY & SPECIFIC):**
```
5. **Precedent Analysis:** MANDATORY - Generate at least ONE filter approach for EACH planning application provided in requirements
```

**Rationale:** If a user provides planning applications as precedents, the system MUST generate filters to replicate those successes.

---

### 3. Cross-Validation (orchestrate_crossvalidation.sh)

**Before (FORCED DIFFERENT ANGLES):**
- Gemini: "Be specific about filter existence and syntax issues"
- Codex: "Focus on execution details, filter specifications, and capital calculations"
- Grok: "Check timing assumptions and arbitrage feasibility"
- Claude: "Verify precedent analysis accuracy and risk assessments"

**Before (TECHNICAL ONLY):**
- Header: "Review ALL approaches below for **TECHNICAL VALIDITY ONLY**"
- Checklist: 5 items (filter existence, units, syntax, logic, capital)

**After (UNIFORM & COMPREHENSIVE):**
- ALL LLMs: "Review all approaches for TECHNICAL AND BUSINESS CASE validity. Check: filter existence, syntax correctness, unit accuracy, capital feasibility, ROI calculations, and implementation viability. Preserve strategic diversity."
- Header: "Review ALL approaches below for **TECHNICAL AND BUSINESS CASE VALIDITY**"
- Checklist: 8 items (added ROI calculations, implementation viability, deal structure soundness)

**Rationale:** 
1. All LLMs should check the same criteria (natural disagreements will still occur)
2. Validation must include business case viability, not just technical correctness

---

### 4. Technical Iteration (orchestrate_technical_iteration.sh)

**Before (TECHNICAL ONLY):**
- Title: "Technical Iteration Task"
- Context: "identified technical issues"
- Focus: "Factual correctness, Evidence-based reasoning, Technical precision"

**After (TECHNICAL + BUSINESS CASE):**
- Title: "Technical & Business Case Iteration Task"
- Context: "identified technical and business case issues"
- Focus: "Factual correctness, Business case viability (capital, ROI, implementation feasibility), Evidence-based reasoning, Technical and financial precision"

**Rationale:** Iteration must cover both technical AND business case disagreements.

---

## Design Philosophy Change

### Old Approach (v4-v10):
- **Forced Divergence:** Different prompts for each LLM to encourage different perspectives
- **Technical Focus:** Validation focused only on technical correctness
- **Vague Precedents:** "At least one" approach based on precedents

### New Approach (v11.0):
- **Natural Divergence:** Same prompts for all LLMs; divergence emerges from their inherent capabilities
- **Comprehensive Validation:** Technical + Business Case + ROI + Implementation viability
- **Mandatory Precedents:** One filter per precedent provided (not optional)

---

## Impact

### Benefits:
1. **True Independence:** LLMs work from same starting point, diverge naturally
2. **Fair Comparison:** All LLMs evaluated on same criteria
3. **Comprehensive Validation:** Catches both technical errors AND unviable business cases
4. **Precedent Compliance:** System MUST use provided planning applications

### Risks Mitigated:
1. **Artificial Diversity:** No longer forcing LLMs into artificial personas
2. **Incomplete Validation:** Business case failures now caught early
3. **Ignored Precedents:** Precedent analysis now mandatory

---

## Files Updated

1. `templates/.agents_v5/orchestrate_independent.sh`
   - Lines 122, 132, 142, 184: Unified all prompts
   - Line 44: Made precedent analysis mandatory (1 per precedent)

2. `templates/.agents_v5/orchestrate_crossvalidation.sh`
   - Lines 109, 119, 129, 171: Unified all critique prompts
   - Lines 33-50: Updated validation header and checklist (8 items)

3. `templates/.agents_v5/orchestrate_technical_iteration.sh`
   - Lines 40-55: Updated iteration task to include business case
   - Lines 56-67: Updated output format header

---

## Testing Required

1. **Run v11.0 with same requirements as v9/v10**
2. **Verify all LLMs generate different approaches** (natural divergence)
3. **Verify critiques check business case viability** (not just technical)
4. **Verify precedent-based filters are generated** (mandatory)

---

**Date:** 2025-11-20  
**System Version:** v11.0  
**Fix Type:** Critical - Prompt Consistency & Comprehensive Validation
**Credit:** User identified all issues

