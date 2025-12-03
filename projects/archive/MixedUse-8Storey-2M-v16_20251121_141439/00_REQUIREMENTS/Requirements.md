# Filter Requirements

**Project:** MixedUse-8Storey-2M-v16  
**Date:** 2025-11-21  
**Status:** Ready for v5.2 Independent Generation (Single-Pass Test)  
**System Version:** 5.2 (Independent Generation with Iterative Convergence)

---

## Global Context

**You are an expert UK property analyst.**

You will work **independently** to generate 1-3 unique filter strategies based on the requirements below.

### Available Resources (included below in this prompt):
- **Available Filters List** - Real filters available in SearchLand (see REFERENCE section below)
- **Preset Examples** - 86 expert presets for inspiration
- **Learnings Database** - Universal implementation behaviors (20+ motivation signals!)
- **Filter Patterns** - 23 strategic patterns (v2.1 - peer reviewed by 4 LLMs)
- **Preset Strategy Guide** - Comprehensive guide to all 86 presets

**IMPORTANT:** All reference materials are included in this prompt. Do NOT attempt to read external files.

### CRITICAL RULES:
1. **Output Format**: Use STRUCTURED LIST FORMAT ONLY (not prose)
   - Example: `1. Title area (acres): is greater than 0.198 AND less than 2.47`
   - NOT: "Look for properties between 8,000-100,000 sqft"
2. **Units**: Use acres/sqft/metres (as shown in ACTUAL filters)
3. **Filter Names**: Use EXACT names from AvailableFiltersInSearchLand_ACTUAL.md
4. **No Assumptions**: If a filter doesn't exist, propose proxy filters
5. **Independent Generation**: Work independently - do NOT see other LLM outputs
6. **Diversity**: Generate approaches using DIFFERENT patterns from FILTER_PATTERNS.md

---

## Requirement Type

- [x] **Type 1: Profit & Capital Outlay**
- [x] **Type 2: Similar Planning Applications**

---

## Type 1: Profit & Capital Outlay

**Target Profit:** £2,000,000

**Capital Outlay:** £200,000

**Additional Context:**
- Property type preferences: Mixed-use development opportunities, airspace development, stalled planning
- Geographic preferences: UK-wide, focusing on urban areas with good transport
- Risk tolerance: Medium - seeking motivated sellers, creative structures
- Time horizon: 12-24 months to planning/deal completion
- Other considerations: £200k requires option agreements, airspace rights, joint ventures (not direct purchase)

---

## Type 2: Similar Planning Applications

### Planning Application 1:

**Description:**
```
Demolition and construction of an 8-storey mixed-use development comprising 
flexible retail (class E) and residential (Class C3) use with associated communal 
terraces, cycle parking, accessible car parking and waste storage
```

**Location:** Urban UK location (Slough, Birmingham, Manchester, etc.)  
**Decision:** Approved  

**Key Success Factors to Analyze:**
- **Development Type:** 8-storey mixed-use (Class E ground + C3 residential above)
- **Scale:** Substantial height (25-35m), multi-unit residential
- **Use Class Mix:** Flexible retail/commercial ground floor + residential above
- **Amenity:** Communal terraces, cycle parking, accessible parking
- **Policy Support:** Area supporting tall buildings/densification

**Implicit Characteristics to Find (At Least ONE of your approaches should target this):**
- Title area: Likely 0.2-2 acres (large enough for 8-storey with parking/amenity)
- Height potential: Building height <15m OR permission for 25-35m additions
- Use classes: E or previous commercial + permission for residential
- Transport: Likely <800m train OR PTAL 4+ (supports density)
- Constraints: Zero flood zone 3, minimal conservation areas
- Planning policy: Tall building zone OR opportunity area OR HDT

**Implementation Options:**
1. **Direct precedent:** Find similar 8-storey mixed-use approvals (2020+)
2. **Site characteristics:** Match area, height, transport, policy
3. **Adjacency:** Properties near approved 8-storey schemes
4. **Proxy approach:** Similar height/mixed-use applications

---

## Additional Requirements

**Priority Level:**
- [x] High - Need precise matches
- [ ] Medium - Some flexibility acceptable
- [ ] Low - Exploratory search

**Expected Number of Results:**
- [x] Narrow (10-50 properties per approach)
- [ ] Moderate (50-200 properties)
- [ ] Wide (200+ properties)

**Special Considerations:**
- £200k capital = option agreements (£10k-£50k), airspace rights (£50k-£150k), or joint ventures
- Direct purchase at £200k unrealistic for 8-storey developments
- Motivation signals critical: long hold, derelict/inactive, corporate, expired/stalled planning
- Multiple diverse strategies preferred (4+ approaches from 4 LLMs)
- Target £2M profit = 10x ROI (substantial upside required)

---

## Target Geographies

**Primary:**
- Slough (previous test location)

**Secondary (for testing):**
- Birmingham (lower prices, more options at £200k)
- Manchester (mid-range market)
- London (high PTAL, airspace opportunities, competitive)

**Rationale:** Different approaches may work better in different markets - test empirically

---

## Strategic Guidance (Use Your Unique Lens)

### Your Role in v5.2 System:
You are ONE of FOUR expert analysts (Gemini, Codex, Grok, Claude) working **independently**.

**All analysts receive identical prompts** - your unique analytical style emerges naturally.

**Note:** You don't need to know which LLM you are - just bring YOUR unique analytical perspective to the requirements.

### Pattern Suggestions (Choose 1-3 patterns for your approaches):

**Precedent-Based:**

**Capital-Efficient:**

**Motivation-Driven:**

**Regulation-Driven:**

**Time/Information Arbitrage:**

**Niche Opportunities:**


---

## Output Format (Critical)

### For Each Approach:

```markdown
## Approach [Letter]: [Name]

**Strategic Pattern:** [Which pattern from FILTER_PATTERNS.md]  
**Capital Required:** [Breakdown]  
**Expected Results:** [Estimated property count]

**SearchLand AI Prompt (Copy-Paste Ready):**
```
1. [Filter name]: [operator] [value]
2. [Filter name]: [operator] [value]
3. [Filter name]: [operator] [value]
...
```

**Rationale:**
[Why this approach works - cite patterns/presets/learnings]

**Strengths:**
- [List 3-5]

**Limitations:**
- [List 3-5]

**Implementation Strategy:**
[Step-by-step: how to execute, negotiate, structure deal]

**Capital Breakdown:**
- [Item]: [Cost]
- [Item]: [Cost]
- **Total:** [Amount within £200k]
```

---

## Key Learnings Applied (Refer to LEARNINGS_DATABASE.md for more)

**Filter Behavior:**
- "Applications in last 5 years = 0" too restrictive (try "< 3")
- £200k direct purchase extremely limited (need creative structures)
- PTAL filters London-only (use "Distance to Train Station" elsewhere)
- Units: acres (not sqm), sqft (not sqm), metres

**Motivation Signals (20+ in LEARNINGS_DATABASE):**
- Company status: Liquidation/Administration = forced sale
- No latest sold date = inherited/legacy holding
- HMO License Expiry Date = regulatory forced sale
- EPC rating E-G = cannot rent (compliance sale)
- Less than 1 application in 5 years = no development intent

**Proven Strategies (23 patterns in FILTER_PATTERNS.md v2.1):**
- Pattern 13 (Time Arbitrage) = HIGHEST ROI per Grok
- Pattern 8 (Regulation) = HIGHEST CERTAINTY per Gemini/Codex
- Pattern 4 (Low Capital) = Enhanced in v2.1 with executable examples
- Pattern 22 (HMO Conversion) = NEW in v2.1 (Gemini + Grok consensus)
- Pattern 23 (Unbroken Freehold) = NEW in v2.1 (Gemini + Codex consensus)

---

## System Version History

**v5.2 (current):** Independent generation with iterative convergence  
- ✅ Real Gemini, Codex, Grok, Claude (not simulated)
- ✅ Independent generation (no forced collaboration, identical prompts)
- ✅ Natural convergence/divergence emerges organically
- ✅ Iterative convergence loop (cross-validation → iteration until agreement)
- ✅ Single-pass mode available for quick testing
- ✅ 23 patterns in FILTER_PATTERNS.md (v2.1 peer reviewed)

**v5.0 (2025-11-19):** Real LLM CLIs introduced  
**v4.0 (archived):** Echo chamber (Claude simulated all agents) - deprecated  
**v3.0-3.2 (archived):** Divergent generation experiments  
**v2.0 (archived):** Convergent refinement  
**v1.0 (archived):** Initial single approach (0 results)

---

**Next Step:** Run v5.2 single-pass system

```bash
cd /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v16/.agents_v5
./RUN_ALL_v5.sh
```

This will execute (SINGLE-PASS MODE):
- Phase 0: Independent Generation (4 LLMs in parallel)
- Phase 1: Cross-Validation (4 LLMs review all approaches)
- Phase 1.5: Technical Iteration (if disagreements - ONE PASS ONLY)
- Phase 2: Synthesis & Extraction (Claude synthesizes)

**Note:** For iterative convergence (loops until agreement), use `./RUN_ALL_ITERATIVE_v5.sh`

Expected output: 4+ approaches ready for parallel testing (minimum 1 per LLM)

