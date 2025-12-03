# MixedUse-8Storey-2M-v5

**Project:** Mixed-Use 8-Storey Development Filter Generation  
**System Version:** 5.0 (Independent Generation with 4 Real LLM CLIs)  
**Date Created:** 2025-11-20  
**Status:** Ready to run

---

## Project Summary

**Goal:** Generate property search filters to find development opportunities matching:
- £2,000,000 target profit
- £200,000 capital outlay
- Similar to approved 8-storey mixed-use planning application

**Approach:** 4 LLMs (Gemini, Codex, Grok, Claude) work independently to generate diverse strategies, then cross-validate and synthesize.

---

## Quick Start

```bash
cd /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v5/.agents
./RUN_ALL_v5.sh
```

**Estimated Runtime:** 15-25 minutes

---

## System Architecture

### Phase 0: Independent Generation
- 4 LLMs generate approaches in parallel
- Each LLM works independently (no collaboration)
- Expected: 4+ unique approaches (1+ per LLM)

### Phase 1: Cross-Validation
- 4 LLMs review ALL approaches for technical validity
- Check filter existence, units, syntax, logic
- Preserve strategic diversity (no forced convergence)

### Phase 1.5: Technical Iteration
- Only runs if technical disagreements detected
- LLMs reconsider factual disputes
- Strategic differences preserved

### Phase 2: Synthesis & Extraction
- Claude synthesizes all inputs
- Groups similar approaches (natural convergence)
- Preserves distinct approaches (diversity)
- Extracts ready-to-test prompts

---

## Requirements

### Target Metrics
- **Profit:** £2,000,000
- **Capital:** £200,000
- **Time Horizon:** 12-24 months
- **ROI:** 10x (£200k → £2M)

### Reference Planning Application
```
Demolition and construction of an 8-storey mixed-use development comprising 
flexible retail (class E) and residential (Class C3) use with associated communal 
terraces, cycle parking, accessible car parking and waste storage
```
**Decision:** Approved

### Key Factors
- 8-storey height (25-35m)
- Mixed-use (commercial ground + residential)
- Good transport (PTAL 4+ or <800m train)
- £200k capital = option agreements, airspace rights, JVs

---

## What's New in v5.0

### Critical Fixes from v4
1. **Real LLM CLIs** (not Claude simulating others)
   - Gemini: `gemini` CLI
   - Codex: `codex` CLI
   - Grok: `opencode run -m opencode/grok-code`
   - Claude: `claude` CLI

2. **Independent Generation** (not forced collaboration)
   - Each LLM works solo
   - Natural patterns emerge
   - Scales to N LLMs

3. **Grok Integration** (4th LLM)
   - Speed/timing lens
   - Innovative arbitrage angles
   - Proven in Stage 2 peer review

4. **Enhanced Patterns**
   - FILTER_PATTERNS.md v2.1 (23 patterns)
   - Peer reviewed by 4 LLMs
   - HMO conversion, unbroken freehold titles added

---

## Directory Structure

```
MixedUse-8Storey-2M-v5/
├── 00_REQUIREMENTS/
│   └── Requirements.md
├── 01_DIVERGENT_GENERATION/      ← Phase 0 output
│   ├── Gemini_Approaches.md
│   ├── Codex_Approaches.md
│   ├── Grok_Approaches.md
│   └── Claude_Approaches.md
├── 02_VALIDITY_CHECK/            ← Phase 1 & 1.5 output
│   ├── *_Critique.md (x4)
│   ├── DISAGREEMENT_ANALYSIS.md
│   ├── Iteration_*.md (if needed)
│   └── FINAL_ValidationMatrix.md
├── 03_PARALLEL_TESTING/          ← Phase 2 output
│   ├── ApproachA_ReadyToTest.md
│   ├── ApproachB_ReadyToTest.md
│   └── ...
├── 04_REFINEMENT/
├── 05_SITE_VALIDATION/
├── 06_DEEP_RESEARCH/
├── .agents/
│   ├── orchestrate_independent.sh
│   ├── orchestrate_crossvalidation.sh
│   ├── orchestrate_technical_iteration.sh
│   ├── orchestrate_synthesis.sh
│   ├── RUN_ALL_v5.sh
│   └── README_v5.md
└── README.md (this file)
```

---

## Expected Outputs

### Minimum Success Criteria
- ≥4 approaches generated (1+ per LLM)
- ≥2 approaches marked VALID or CONDITIONAL
- ≥1 approach based on 8-storey precedent
- Technical disagreements resolved (if any)

### Quality Indicators
- Diversity: Different FILTER_PATTERNS used
- Technical validity: Filters exist in ACTUAL list
- Capital feasibility: Within £200k budget
- Strategic variety: Speed vs. certainty, high-risk vs. low-risk

---

## Next Steps After Generation

1. **Review outputs:**
   - `SYSTEM_RUN_SUMMARY.md`
   - `02_VALIDITY_CHECK/FINAL_ValidationMatrix.md`

2. **Test approaches:**
   - Copy prompts from `03_PARALLEL_TESTING/Approach*_ReadyToTest.md`
   - Paste into SearchLand.co.uk AI
   - Document result counts

3. **Refinement (04_REFINEMENT):**
   - If 0 results: Adjust filters
   - If results: Validate site list
   - Remove red flags

4. **Site Validation (05_SITE_VALIDATION):**
   - Title checks
   - Constraint checks
   - Planning history research

5. **Deep Research (06_DEEP_RESEARCH):**
   - Per-site dossiers
   - GDV analysis
   - Risk matrix
   - Motivation scoring

---

## Version History

### v5.0 (2025-11-20) - Current
- ✅ Real LLM CLIs (Gemini, Codex, Grok, Claude)
- ✅ Independent generation model
- ✅ 4-LLM scalability proven
- ✅ FILTER_PATTERNS v2.1 (23 patterns, peer reviewed)

### v4.0 (2025-11-19) - Deprecated
- ❌ Echo chamber (Claude simulated all agents)
- ❌ Forced collaboration
- ⚠️ Do not use

### v3.0-3.2 (2025-11-19) - Archived
- Divergent generation experiments
- Forced personas (flawed)

### v2.0 (2025-11-19) - Archived
- Convergent refinement
- 0 results initially

### v1.0 (2025-11-19) - Archived
- Single approach
- 0 results (capital mismatch)

---

## Contact/Reference

**System Documentation:** `/templates/.agents_v5/README_v5.md`  
**Master Setup:** `/MASTER_SetupFilters.md`  
**Pattern Library:** `/FILTER_PATTERNS.md` (v2.1)  
**Learnings Database:** `/LEARNINGS_DATABASE.md`  
**Preset Guide:** `/PRESET_STRATEGY_GUIDE.md`

---

**Status:** Ready to execute  
**Command:** `cd .agents && ./RUN_ALL_v5.sh`

