# SearchLand Filter Creation System v5.0

**Independent Multi-LLM Generation for Property Development Filters** 🎯

---

## What Is This?

A multi-LLM system that creates, validates, and tests SearchLand.co.uk property filters through **independent generation** with 4 real LLM CLIs (Gemini, Codex, Grok, Claude), ensuring genuine diversity without echo chambers or forced collaboration.

**Key Innovation:** Each LLM works independently to generate unique approaches, then all cross-validate for technical correctness. Natural convergence and divergence emerge organically, tested empirically.

---

## Quick Start

### 1. Create New Project
```bash
./scripts/new_project.sh [ProjectName]
```

### 2. Fill Requirements
Edit `projects/[ProjectName]/00_REQUIREMENTS/Requirements.md` with:
- Target profit & capital outlay
- Property type & geographic preferences
- Reference planning applications (if applicable)

### 3. Run Multi-LLM System

**Option A: Iterative Convergence (Recommended)**
```bash
cd projects/[ProjectName]/.agents_v5
./RUN_ALL_ITERATIVE_v5.sh [max_rounds]
```
- Loops cross-validation → iteration until convergence or max rounds (default: 3)
- Ensures LLMs reach agreement on technical/business facts
- Runtime: 20-40 minutes (depends on convergence)

**Option B: Single-Pass (Quick Testing)**
```bash
cd projects/[ProjectName]/.agents_v5
./RUN_ALL_v5.sh
```
- One pass: Independent → Cross-Validation → (Optional) Single Iteration → Synthesis
- No loop-back for re-validation
- Runtime: 15-25 minutes

### 4. Test Generated Approaches
Copy prompts from `03_PARALLEL_TESTING/` into SearchLand.co.uk AI

### 5. Capture Learnings
Update `LEARNINGS_DATABASE.md` with universal implementation insights

---

## System Components

### Core Documentation
- **README.md** ← You are here (quick start)
- **FILTER_PATTERNS.md** ← 23 strategic patterns (v2.1, peer reviewed by 4 LLMs)
- **LEARNINGS_DATABASE.md** ← SearchLand AI implementation behaviors
- **PRESET_STRATEGY_GUIDE.md** ← 86 built-in presets analyzed
- **CHANGELOG.md** ← Version history

### Reference Data
- **SearchlandContext/AvailableFiltersInSearchLand_ACTUAL.md** ← Real filters (verified)
- **SearchlandContext/PresetFiltersBuiltIntoSearchLand.md** ← 86 expert presets

### Project Organization
```
projects/
├── [ActiveProject]/
│   ├── 00_REQUIREMENTS/
│   ├── 01_DIVERGENT_GENERATION/ (4+ LLMs generate independently)
│   ├── 02_VALIDITY_CHECK/ (4 LLMs cross-validate)
│   ├── 03_PARALLEL_TESTING/ (ready-to-test approaches)
│   ├── 04_REFINEMENT/ (optional)
│   ├── 05_SITE_VALIDATION/
│   ├── 06_DEEP_RESEARCH/
│   ├── .agents/ (v5 orchestration scripts)
│   └── SYSTEM_RUN_SUMMARY.md
└── archive/ (completed projects)
```

---

## Philosophy: Why Independent Generation?

### ❌ Old Approach (v2.x): Forced Consensus
```
Gemini → Codex critiques → Claude "fixes" → Everyone agrees
Problem: Early convergence kills creativity
```

### ⚠️ v3.x: Forced Collaboration or Forced Divergence
```
v3.0-3.1: Artificial personas (Gemini = data-driven, Codex = creative)
v3.2: Forced collaboration ("three experts working TOGETHER")
Problem: Groupthink or artificial constraints
```

### ⚠️ v4.0: Echo Chamber (CRITICAL FLAW)
```
All scripts used "claude" CLI with prompts like "You are Gemini"
Problem: Claude simulating all agents = no real diversity
```

### ✅ New Approach (v5.0+): Independent Generation + Iterative Convergence
```
Phase 0: 4 LLMs work independently in parallel
  ├─ Gemini: Natural analytical style emerges
  ├─ Codex: Natural analytical style emerges
  ├─ Grok: Natural analytical style emerges
  └─ Claude: Natural analytical style emerges
  (All receive identical prompts - diversity is organic)
↓
Phase 1: All 4 LLMs cross-validate ALL approaches (technical only)
  ├─ Check: Filter existence, syntax, capital feasibility
  └─ Identify: Technical/business case disagreements
↓
Phase 1.5: Iteration if disagreements exist
  ├─ Each LLM reconsiders with full context
  └─ Loop back to Phase 1 for re-validation
↓
[Repeat Phase 1 → 1.5 until convergence or max rounds]
↓
Phase 2: Claude synthesizes, groups similar, preserves distinct
↓
Test ALL valid approaches empirically
↓
Data decides winners (not LLM opinion)
```

**v5.2.1 Addition:** System now loops until LLMs converge on facts (or max rounds)

**Result:** Genuine diversity, iterative refinement, scalable to N LLMs

---

## Key Principles

### 1. Independent Generation (Not Collaboration)
- Each LLM works independently (no forced personas or collaboration)
- Natural convergence/divergence emerges organically
- Scalable to 4+ LLMs without code changes

### 2. Real LLM CLIs (Not Simulation)
- **v4 Problem:** Claude simulated all agents → echo chamber
- **v5 Solution:** Real CLIs (gemini, codex, opencode/grok, claude)
- Genuinely different perspectives from each LLM

### 3. Validity ≠ Quality
- Validation checks: real filters, correct units, valid syntax
- Does NOT check: strategic merit, expected results
- Let SearchLand data determine quality

### 4. Test Everything, Assume Nothing
- Theory often wrong (e.g., "Applications = 0" = 0 results)
- Empirical testing beats LLM confidence
- Geography matters (London ≠ Birmingham)

### 5. Learning Is Cumulative
- Capture universal implementation behaviors in `LEARNINGS_DATABASE.md`
- Build reusable patterns in `FILTER_PATTERNS.md`
- Each project makes the next one better

---

## Workflow Summary

### Phase 0: Independent Generation (5-10 min, parallel)
4 LLMs generate 1-3 approaches each independently:
- No collaboration, no forced personas
- Each brings unique analytical lens
- Expected output: 4+ diverse approaches

### Phase 1: Cross-Validation (5-10 min, parallel)
4 LLMs review ALL approaches for technical validity only:
- Filter existence, units, syntax
- Does NOT critique strategy or priority
- Expected output: VALID/CONDITIONAL/INVALID per approach

### Phase 1.5: Technical Iteration (3-5 min, conditional)
Only runs if technical disagreements detected:
- Example: 2 LLMs say filter exists, 2 say it doesn't
- Does NOT iterate on strategic preferences
- Expected output: Factual consensus

### Phase 2: Synthesis & Extraction (3-5 min)
Claude synthesizes all inputs:
- Groups naturally similar approaches
- Preserves distinct approaches
- Extracts ready-to-test prompts
- Expected output: Validation matrix + test files

### Stage 3: Parallel Testing
**Output:** Ready-to-test approaches with SearchLand AI prompts
- Phase 2 extracts clean, executable approaches
- Each approach in separate file with copy-paste ready prompt

### Stage 4: Refinement & Validation (User's 10-Step Workflow)

**Step 0:** Create Executive Summary for each approach
- Track: Key criteria, expected results, justification, strengths, limitations
- Field: "Based On" (links to preset learnings for future reference)

**Step 1:** Copy SearchLand AI prompt from ready-to-test file

**Step 2:** Paste screenshot of what SearchLand AI actually created
- Visual validation (see what filters were actually applied)
- Save as: `04_REFINEMENT/Screenshots/ApproachX_SearchLandOutput.jpg`

**Step 3:** Run validation script to check accuracy
- Compare intended filters vs actual filters created by AI
- Identify parsing errors, unit mismatches, missing filters
- Script: `04_REFINEMENT/validate_searchland_output.sh` (TBD)

**Step 4:** Update prompts based on issues
- Fix filter syntax, unit conversions, operator issues
- **Update LEARNINGS_DATABASE.md** with new implementation insights
- Document what works vs what doesn't (universal learnings)
- Structured learning capture process

**Step 5:** Document results & property screenshots
- Result counts per geography (Slough, Birmingham, Manchester, London)
- List of property addresses
- Aerial view screenshot for each property
- Save as: `04_REFINEMENT/Screenshots/ApproachX_PropertyAddress.jpg`
- **Visual exclusion:** Remove obviously non-relevant sites immediately
- Update Executive Summary with refined property list

### Stage 5: Site Validation (Multi-LLM Analysis)

**Step 6:** Each LLM analyzes each property independently
- All 4 LLMs (Gemini, Codex, Grok, Claude) review property data
- Each generates independent viability assessment
- LLMs then cross-critique each other's assessments
- Results documented in Executive Summary
- **Create DOSSIER file** for each property (see template below)

**Step 7:** Mark tenable vs non-tenable properties
- Executive Summary updated with viability status
- Properties marked with clear rejection reasons
- Result counts updated (original → after visual → after LLM analysis)

**Step 8:** Organize DOSSIERS into folders
- `05_SITE_VALIDATION/TENABLE/` - Viable properties with full dossiers
- `05_SITE_VALIDATION/NON_TENABLE/` - Rejected properties (with rejection reasons in dossier)
- **All properties have DOSSIERS** regardless of final status (learning for future)

**DOSSIER Sections:**
1. Title Details (title number, tenure, area, owner, ownership type)
2. Constraints Check (flood, conservation, heritage, trees, ecology, covenants)
3. Planning Precedents 500m radius (approvals, refusals, policy support)
4. Comparable GDV Research (residential & commercial comps within 500m)
5. Market & Financials (development scenario, revenue, costs, profit projection)
6. Risk Matrix & Mitigations (planning, constraints, market, motivation, build cost)
7. Motivation Scoring Index (MSI) - Quantitative score (base 3 + adjustments)
8. Visual Assessment (street view, satellite, site visit required?)
9. Analyst Verdict (summary, recommendation: PROCEED/CAUTION/DO NOT PURSUE, confidence)
10. Next Actions Checklist (title docs, constraint search, precedent dive, etc.)

### Stage 6: Deep Research (Research Planning & Manual Enrichment)

**Step 9:** Create deep research plan for tenable properties
- Per-property research checklist
- Research tasks prioritized by importance
- Update DOSSIERS as new information discovered
- Further filtering based on deep research findings
- Executive Summary updated with final refined tenable list

**Step 10:** Manual enrichment process
- **Title documents:** Land Registry search (title number, ownership, restrictions)
- **Planning portal research:** 5-10 precedent applications (approvals, refusals, policy)
- **Comparable GDV research:** Rightmove/Zoopla sales data (residential & commercial)
- **Constraint checks:** Environment Agency (flood), local authority (conservation, TPOs, Article 4)
- **Market & financials:** Estate agent consultation, quantity surveyor cost estimate
- **Risk assessment:** Planning consultant pre-app advice, legal review of constraints
- **Final DOSSIER:** Enriched with all manual research findings
- **Final Executive Summary:** Updated with tenable/non-tenable final counts

**Output:** Ready-to-approach shortlist with comprehensive research backing

**Full templates:** See `templates/ExecutiveSummary_Template.md` and `templates/Dossier_Template.md`

---

## Example: MixedUse-8Storey-2M-v5

**Requirements:**
- Target profit: £2M
- Capital outlay: £200k
- Property: 8-storey mixed-use development potential

**Phase 0 Output (Independent Generation):**
- Gemini: 2 approaches (Urban Densification, Airspace + Regulation)
- Codex: 2 approaches (Micro-infill, Nutrient Neutrality)
- Grok: 2 approaches (Time Arbitrage, Fresh Consents)
- Claude: 2 approaches (Precedent Analysis, Corporate Distress)

**Phase 1: Cross-Validation:**
- 6 approaches marked VALID
- 2 approaches marked CONDITIONAL (minor unit fixes)
- 0 approaches marked INVALID

**Phase 2: Synthesis:**
- Natural grouping: 2 precedent-based approaches combined
- 7 distinct approaches extracted for testing
- Expected: 4-10 candidates per geography

---

## Critical Rules

### ✅ DO:
- Generate multiple independent approaches (4+)
- Use ONLY filters from `AvailableFiltersInSearchLand_ACTUAL.md`
- Output in structured format (numbered lists, exact filter names)
- Test empirically in SearchLand
- Capture universal learnings (not geography-specific results)

### ❌ DON'T:
- Force collaboration or consensus during generation
- Critique strategic quality during validation (only technical)
- Assume sqm/sqmt units exist (only acres/sqft/metres)
- Use non-existent filters (e.g., "Planning Status: Expired")
- Skip testing because "LLM said it won't work"

### ⚠️ ALWAYS CHECK:
- Units: acres (NOT sqm), sqft (NOT sqm), metres
- Filter names: exact match to ACTUAL list
- Syntax: per `LEARNINGS_DATABASE.md`
- Geography: PTAL = London only, etc.

---

## Knowledge Base

### FILTER_PATTERNS.md (v2.1)
**23 strategic patterns** (peer reviewed by 4 LLMs):
1-13: Original patterns (Stalled Planning, Motivated Seller, Development, Low Capital, Density, Airspace, PDR, Regulation, Green Belt, Renewables, Commercial, Time Arbitrage)
14-21: Stage 1 additions (Legacy, Portfolio, Brownfield, Micro-Infill, Nutrient, Digital, Brand, Community)
22-23: Stage 2 additions (HMO Conversion, Unbroken Freehold)

**Pattern 13 (Time Arbitrage):** Ranked #1 by Grok - "force multiplier"
**Pattern 4 (Low Capital):** Enhanced in v2.1 with executable examples

### LEARNINGS_DATABASE.md
**Universal implementation behaviors:**
- How SearchLand AI parses filters (16+ rules)
- Unit conventions (acres/sqft/metres)
- 20+ motivation signals (liquidation, HMO expiry, lease end, EPC rating)
- Filter quirks and workarounds

### PRESET_STRATEGY_GUIDE.md
**Comprehensive analysis of 86 built-in presets:**
- 12 strategy categories
- Threshold insights (£200k sweet spots, 0.5 acre minimums)
- Clever filter combinations
- Cross-references to patterns

---

## File Organization

### Root Directory (Keep Clean!)
```
landsignal/
├── README.md               ← Quick start (this file)
├── FILTER_PATTERNS.md      ← 23 patterns (v2.1, peer reviewed)
├── LEARNINGS_DATABASE.md   ← Implementation knowledge
├── PRESET_STRATEGY_GUIDE.md ← 86 presets analyzed
├── CHANGELOG.md            ← Version history
├── PROJECTS_INDEX.md       ← Completed projects reference
│
├── SearchlandContext/      ← Reference data
│   ├── AvailableFiltersInSearchLand_ACTUAL.md ⚠️ USE THIS
│   └── PresetFiltersBuiltIntoSearchLand.md (86 presets)
│
├── templates/              ← Project templates
│   ├── .agents_v5/        ← v5 orchestration scripts
│   └── Requirements.md
│
├── projects/               ← Your work
│   ├── [ActiveProjects]/
│   └── archive/
│
├── scripts/                ← Automation
│   └── new_project.sh
│
├── .system_improvement/    ← Peer review system
│   ├── run_filter_patterns_review.sh
│   └── stage1_archive/, stage2_archive/
│
└── archive/                ← Historical docs
    ├── docs/
    ├── filter_patterns_versions/
    └── system_docs/
```

---

## Common Pitfalls

### 1. Using sqm/sqmt Units
**Problem:** SearchLand only has acres (area) and sqft (buildings)  
**Solution:** Convert using: 1 acre = 4,047 sqm, 1 sqft = 0.0929 sqm

### 2. Non-Existent Filters
**Problem:** Using "Planning Status: Expired" or "Price Reduced"  
**Solution:** Check `AvailableFiltersInSearchLand_ACTUAL.md`, use proxies

### 3. Over-Constraining
**Problem:** Too many restrictive filters = 0 results  
**Solution:** Test incrementally, use multiple approaches vs one perfect filter

### 4. Geographic Assumptions
**Problem:** Using PTAL for UK-wide searches (PTAL = London only)  
**Solution:** Check filter geography limitations in `LEARNINGS_DATABASE.md`

### 5. Forced Collaboration (v4 mistake)
**Problem:** Making LLMs "work together" creates groupthink  
**Solution:** v5 uses independent generation, natural patterns emerge

---

## Success Metrics

### Good Project Outcome:
- ✅ 4+ valid approaches generated (1+ per LLM)
- ✅ Genuine diversity (different patterns from FILTER_PATTERNS.md)
- ✅ 2+ approaches tested in SearchLand
- ✅ 1+ approach yields 10-50 results (optimal range)
- ✅ Learnings captured in `LEARNINGS_DATABASE.md`
- ✅ Technical disagreements resolved (if any)

### Poor Project Outcome:
- ❌ Only 1 approach generated (not diverse)
- ❌ All approaches use same pattern (echo chamber)
- ❌ All approaches return 0 results (over-constrained)
- ❌ No approaches tested (theoretical only)
- ❌ No learnings captured (wasted effort)

---

## Version History

### v5.0 (2025-11-20) - CURRENT 🎯
- **MAJOR:** Real LLM CLIs (not Claude simulating others)
- **MAJOR:** Independent generation model (no forced collaboration)
- **MAJOR:** Grok integration (4th LLM - speed/timing lens)
- **MAJOR:** FILTER_PATTERNS v2.1 (23 patterns, peer reviewed by 4 LLMs)
- Scalable architecture (proven with 4 LLMs, works with N)
- Technical iteration for disagreements only
- Comprehensive v5 orchestration scripts

### v4.0 (2025-11-19) - DEPRECATED ⚠️
- ❌ Echo chamber: All scripts used "claude" CLI
- ❌ Forced collaboration: "three experts working TOGETHER"
- ❌ Not scalable beyond 3 LLMs
- **Status:** Do not use

### v3.2.0 (2025-11-19) - Archived
- Collaborative angle exploration (5 systematic rounds)
- All agents explore angles together
- Natural collaboration vs forced personas

### v3.1.2 (2025-11-19) - Archived
- Mandatory precedent-based strategy
- Pattern #13: Time/Information Arbitrage
- Technical disagreement iteration

### v3.0 (2025-11-19) - Archived
- Divergent hypothesis testing methodology
- LEARNINGS_DATABASE.md and FILTER_PATTERNS.md created
- 6-stage workflow

### v2.2 (2025-01-19) - Archived
- Structured output format
- Implementation iteration phase

---

## Getting Help

### Read First:
1. This README (system overview)
2. `templates/.agents_v5/README_v5.md` (detailed v5 workflow)
3. `FILTER_PATTERNS.md` (23 strategic patterns)
4. `LEARNINGS_DATABASE.md` (known issues/solutions)

### Common Questions:

**Q: How many approaches should I generate?**  
A: 4+ is ideal (1+ per LLM). v5 generates this automatically.

**Q: What if all approaches fail validation?**  
A: LLMs may be unfamiliar with SearchLand's specific filters. Check iteration results in Phase 1.5 - technical disagreements are resolved automatically.

**Q: What if all approaches return 0 results?**  
A: Requirements may be unrealistic, or filters too restrictive. Test filters individually. Consider relaxing most restrictive constraint.

**Q: Which LLM is "best"?**  
A: All contribute differently:
- Gemini: Strategic patterns, regulatory
- Codex: Technical precision, niche
- Grok: Speed/timing, arbitrage ⭐ NEW
- Claude: Risk mitigation, synthesis
Use all 4 for maximum diversity.

**Q: Can I skip the multi-LLM phase and just use one approach?**  
A: You can, but you'll miss better alternatives. v5 makes it easy - just run `RUN_ALL_v5.sh`.

**Q: What's the difference between v4 and v5?**  
A: v4 was an echo chamber (Claude simulated all agents). v5 uses real LLM CLIs for genuine diversity.

---

## Next Steps

1. **Review:** `FILTER_PATTERNS.md` v2.1 (23 patterns)
2. **Create:** New project with `./scripts/new_project.sh`
3. **Run:** `cd project/.agents && ./RUN_ALL_v5.sh`
4. **Test:** Approaches in SearchLand.co.uk
5. **Capture:** Learnings in `LEARNINGS_DATABASE.md`

---

**Last Updated:** 2025-11-20  
**System Version:** 5.2  
**Status:** Production Ready  
**Methodology:** Independent Multi-LLM Generation (4 Real CLIs) + Comprehensive Stages 4-6 Workflow  
**Filter Patterns:** v2.1 (23 patterns, validated by 4 LLMs)
