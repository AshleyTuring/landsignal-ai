# MASTER: Multi-LLM SearchLand Filter Creation System

**Version:** 3.2.0 (Collaborative Angle Exploration) 🎯  
**Last Updated:** 2025-11-19  
**Methodology:** Collaborative Exploration → Validity Check → **Iteration** → Parallel Testing → Learning Capture

**v3.2.0 MAJOR REDESIGN:**
- Replaced forced divergence with systematic angle exploration
- All agents collaborate on all strategic angles (Precedent, Regulation, Structural, Behavioral, Challenge)
- Natural collaboration replaces artificial personas
- Best ideas win per angle (no forced "Gemini = data-driven" constraints)

---

## Executive Summary

This system uses multiple LLMs working **collaboratively** to systematically explore strategic angles for SearchLand property filters. Unlike v3.1's forced divergence, we now explore 5 systematic angles together, allowing natural collaboration while ensuring comprehensive coverage.

**Key Innovation:** We systematically explore 5 strategic angles (Precedent, Regulation, Structural, Behavioral, Challenge) with all agents contributing to each, generating 4-10 organic approaches rather than forcing 6 artificial ones.

**Philosophy:** 
- **Diverge first** (creative, multiple approaches)
- **Validate second** (technical correctness only)
- **Test third** (let data decide)
- **Learn fourth** (capture for reuse)

---

## Critical Principles

### Principle #0: Precedent Analysis is Round 1 (MANDATORY) ⭐
**Round 1 of collaborative exploration MUST analyze and replicate successful planning precedent.**

**Why:**
- User provides planning applications as examples for a reason
- Most straightforward, lowest-risk strategy
- Proven approval conditions = highest success probability
- Creative strategies are valuable BUT precedent must come first

**How (v3.2 Collaborative):**
- ALL agents analyze planning application together
- Discuss: What made this approvable? (size, location, policy, transport)
- Agree on key success factors collaboratively
- Natural variations emerge if agents propose different implementations
- Output: 1-3 precedent approaches (organic based on consensus/variations)

**Evolution:**
- v3.1: Forced one agent to do precedent (artificial)
- v3.2: All agents discuss precedent first (natural, mandatory round)

### Principle #1: Systematic Angle Exploration (Not Forced Divergence)
**Explore strategic angles systematically with natural collaboration.**

**Why:**
- Different strategies work in different geographies (need multiple)
- Systematic rounds ensure comprehensive coverage (nothing missed)
- Natural collaboration allows best ideas to win (no artificial constraints)
- Empirical testing beats theoretical debates (test all valid approaches)

**How v3.2 Works:**
- 5 structured rounds (Precedent, Regulation, Structural, Behavioral, Challenge)
- All agents contribute to all rounds
- Best ideas emerge naturally per angle
- Can skip weak rounds (honest assessment)
- Result: 4-10 approaches (organic but comprehensive)

### Principle #2: Validity ≠ Quality
**Validation checks technical correctness, NOT strategic merit.**

**Validate:**
- ✅ Uses real filters from AvailableFiltersInSearchLand_ACTUAL.md
- ✅ Correct units (acres/sqft/metres)
- ✅ Valid syntax per LEARNINGS_DATABASE.md
- ✅ Logically coherent (not self-contradictory)

**Do NOT validate:**
- ❌ "Which approach is better?"
- ❌ "Which will get more results?"
- ❌ "Which I prefer?"

### Principle #3: Test Everything, Assume Nothing
**SearchLand results determine success, not LLM opinion.**

**Example:**
- Theory: "Applications = 0" finds expired planning
- Reality: 0 results in Slough, 5 results in Birmingham
- Learning: Too restrictive; try "< 3" instead

### Principle #4: Learning is Cumulative
**Capture implementation learnings, not project-specific results.**

**Capture in LEARNINGS_DATABASE.md:**
- ✅ "OR logic doesn't work in single filter line"
- ✅ "Title area ONLY available in acres"
- ✅ "PTAL limited to London/TfL area"

**Do NOT capture:**
- ❌ "Slough returned 0 results" (geography-specific)
- ❌ "Approach B was best" (project-specific)

---

## Full Workflow: Collaborative Exploration Process

### Stage 0: Requirements Gathering

**Input:** User requirements (profit target, capital, property type, planning application examples)

**Output:** `00_REQUIREMENTS/Requirements.md`

**Duration:** 15-30 minutes

**Process:**
1. Create new project folder structure (`./scripts/new_project.sh`)
2. Fill out Requirements template with ALL details:
   - Target profit & capital outlay
   - Property type preferences
   - Geographic constraints
   - Planning application examples (descriptions, reference numbers)
   - Risk tolerance
   - Timeline expectations

---

### Stage 1: Collaborative Exploration (Phase 0)

**Goal:** Generate 4-10 approaches through systematic angle exploration

**Input:** Requirements + AvailableFiltersInSearchLand_ACTUAL.md + FILTER_PATTERNS.md + PRESET_STRATEGY_GUIDE.md + LEARNINGS_DATABASE.md

**Output:** `01_DIVERGENT_GENERATION/CollaborativeExploration_Output.md`

**Duration:** 30-60 minutes

**Process:**

**1.1 - All Agents Explore 5 Strategic Angles Together:**

**Round 1: Precedent Analysis (MANDATORY)**
- All agents analyze planning application(s) together
- Discuss key success factors (height, transport, policy support, site characteristics)
- Agree on implementation (or propose variations if valuable)
- Output: 1-3 precedent approaches

**Round 2: Regulation/Policy Angle**
- Explore regulatory pressures (EPC ratings, licenses, compliance deadlines)
- All agents discuss which signals are compelling
- Output: 0-2 approaches (skip if weak)

**Round 3: Structural/Creative Angle**
- Explore deal structures (airspace, options, creative workarounds)
- All agents identify structural opportunities
- Output: 0-2 approaches

**Round 4: Behavioral/Motivation Angle**
- Explore seller psychology (distress, liquidation, stale ownership)
- All agents identify motivation signals
- Output: 0-2 approaches

**Round 5: Challenge Round**
- Force thinking beyond obvious (contrarian, time-based, unconventional)
- All agents propose wild cards
- Output: 0-2 approaches

**CLI Command:**
```bash
cd /path/to/project/.agents
./orchestrate_collaborative.sh
```

**1.2 - Review Collaborative Output:**

The output will be a single file:
- `CollaborativeExploration_Output.md`

This file contains:
- All approaches across 5 rounds
- Strategic angle for each approach
- Consensus vs. variation notes
- Total approach count (4-10 typical)

---

### Stage 2: Technical Validity Check (Phase 1)

**Goal:** Eliminate approaches with technical/implementation errors

**Input:** `CollaborativeExploration_Output.md` + LEARNINGS_DATABASE.md

**Output:** `02_VALIDITY_CHECK/Critique_[Agent].md` (3 files)

**Duration:** 30-45 minutes

**Process:**

**2.1 - All Agents Review All Collaborative Approaches:**

Each agent independently reviews for technical correctness:

```markdown
You are performing a TECHNICAL VALIDITY check.

Review ALL approaches from CollaborativeExploration_Output.md for TECHNICAL correctness ONLY.

CHECK FOR:
✅ All filters exist in AvailableFiltersInSearchLand_ACTUAL.md
✅ Correct units (acres/sqft/metres, not sqm)
✅ Valid syntax per LEARNINGS_DATABASE.md
✅ Logical coherence (not self-contradictory)
✅ Operators match filter types (enum, numeric, text, date)

DO NOT CHECK:
❌ Strategic quality
❌ Expected result counts
❌ Personal preference

OUTPUT FORMAT (Per Approach):
## Approach: [Name]
(Strategic Angle: [Precedent/Regulation/etc.])

**Technical Validation:** PASS / FAIL

**Issues Found:**
1. [Issue] - Severity: CRITICAL/MAJOR/MINOR
...

**Overall Assessment:** VALID / INVALID / CONDITIONAL
```

**CLI Command:**
```bash
cd /path/to/project/.agents
./orchestrate_critique.sh
```

**2.2 - Check for Technical Disagreements (Phase 1.5):**

If agents disagree on technical validity (2-1 split), iteration runs automatically:

```bash
./orchestrate_iteration.sh
```

This resolves factual disagreements before consensus.

**2.3 - Consolidate Validation Results (Phase 2):**

```bash
./orchestrate_consensus.sh
```

Creates `FINAL_ValidationMatrix.md`:
```markdown
# Validation Matrix

| Approach | Gemini | Codex | Claude | Status | Issues |
|----------|--------|-------|--------|--------|--------|
| A        | ✅     | ✅    | ✅     | VALID  | None   |
| B        | ✅     | ❌    | ✅     | INVALID| Uses PTAL outside London |
| C        | ✅     | ✅    | ✅     | VALID  | None   |
...

## Valid Approaches (Ready for Testing):
- Approach A: Stalled Planning
- Approach C: Motivated Seller
- Approach D: Airspace Development
- Approach E: Corporate Distress

## Rejected Approaches:
- Approach B: PTAL filter used for UK-wide search → See RejectedApproaches.md
- Approach F: Uses non-existent "Planning Status: Expired" filter → See RejectedApproaches.md
```

**2.3 - Document Rejected Approaches:**

`RejectedApproaches.md` captures WHY approaches failed for learning purposes:
```markdown
# Rejected Approaches & Learnings

## Approach B: High-PTAL Redevelopment
**LLM:** Gemini
**Fatal Issue:** Used PTAL filter for UK-wide search
**Learning:** PTAL only covers London/TfL area
**Action:** Update LEARNINGS_DATABASE.md if not already captured

## Approach F: Expired Planning Precedent
**LLM:** Claude
**Fatal Issue:** Used "Planning Status: is equal to Expired"
**Learning:** This filter doesn't exist; use proxy (last application date + no recent apps)
**Action:** Already documented in LEARNINGS_DATABASE.md
```

---

### Stage 3: Parallel Testing

**Goal:** Test ALL valid approaches in SearchLand, document results empirically

**Input:** Valid approaches from Stage 2

**Output:** `03_PARALLEL_TESTING/Approach[X]_Results.md` + `ComparativeAnalysis.md`

**Duration:** 1-3 hours (depends on number of approaches and test geographies)

**Process:**

**3.1 - Test Each Valid Approach:**

For each valid approach:
1. Open SearchLand AI
2. Select test geography (LPA or region)
3. Paste filter criteria exactly as specified
4. Document results in `Approach[X]_Results.md`:

```markdown
# Approach C: Motivated Seller - Test Results

## Filter Criteria Used
1. Ownership type: is equal to Company
2. Latest sold date: is before 2020-01-19
3. Sales listing price: is less than 200000
4. Distance to nearest Train Station (m): is less than 1000
5. Title area (acres): is greater than 0.2 AND less than 3
6. Building on title is derelict: is equal to Yes

## Test Results

### Slough (Target LPA)
- **Result count:** 0 properties
- **Observation:** Price cap <£200k too restrictive in this market
- **Screenshot:** [attach if available]

### Birmingham (Comparison)
- **Result count:** 3 properties
- **Observation:** Lower property values enable more matches
- **Sample properties:** [list 1-2 example titles]

### Manchester (Comparison)
- **Result count:** 1 property
- **Observation:** Limited derelict corporate stock at this price point

## Analysis
- **Strengths:** Highly targeted, strong motivation signals
- **Weaknesses:** Extremely restrictive (<5 results across 3 LPAs)
- **Recommendation:** Consider raising price cap to £300k OR dropping "derelict" requirement
```

**3.2 - Create Comparative Analysis:**

`ComparativeAnalysis.md`:
```markdown
# Comparative Analysis: All Approaches

## Results Summary

| Approach | Slough | Birmingham | Manchester | UK-Wide | Status |
|----------|--------|------------|------------|---------|---------|
| A: Stalled Planning | 0 | 8 | 2 | ~50 | TOO RESTRICTIVE |
| C: Motivated Seller | 0 | 3 | 1 | ~20 | TOO RESTRICTIVE |
| D: Airspace Dev | 12 | 45 | 23 | ~500 | OPTIMAL |
| E: Corporate Distress | 5 | 18 | 9 | ~200 | GOOD |

## Winner: Approach D (Airspace Development)
- **Result count:** 12 properties in target LPA (optimal range)
- **Geographic consistency:** Works across multiple markets
- **Capital alignment:** Fits £200k budget (airspace + conversion)
- **Profit pathway:** Clear £2M target via 4-6 storey addition

## Runner-Up: Approach E (Corporate Distress)
- **Result count:** 5 properties (lower but acceptable)
- **Different profile:** More distressed, potentially higher discount
- **Use case:** Backup strategy if Approach D properties don't progress

## Failed Approaches:
- **Approach A:** "Applications = 0" too restrictive (LEARNING: try "< 3")
- **Approach C:** £200k price cap + derelict = almost nothing (LEARNING: raise to £300k)

## Refinement Recommendations:
1. Proceed with Approach D as primary strategy
2. Refine Approach A: Change "Applications = 0" to "< 3", retest
3. Refine Approach C: Raise price to £300k, retest
4. Keep Approach E as backup
```

---

### Stage 4: Learning Capture

**Goal:** Extract universal learnings and update knowledge base

**Input:** Test results, rejected approaches, refinement insights

**Output:** Updates to `LEARNINGS_DATABASE.md`, `FILTER_PATTERNS.md`

**Duration:** 30-60 minutes

**Process:**

**4.1 - Review for Universal Learnings:**

Ask each LLM:
```markdown
Based on the test results and rejected approaches, identify any UNIVERSAL learnings about SearchLand AI implementation.

INCLUDE:
- Filter behaviors discovered (e.g., "Applications = 0 always restrictive")
- Syntax issues encountered
- Unit conversion insights
- Geographic filter limitations (e.g., PTAL)

EXCLUDE:
- Project-specific results (e.g., "Slough had 12 properties")
- Strategic preferences (e.g., "Approach D was best")
```

**4.2 - Update LEARNINGS_DATABASE.md:**

Add new entries under appropriate sections:
```markdown
### "Applications in the last 5 years: is equal to 0"
```
⚠️ Discovered 2025-11-19 (Project: MixedUse-8Storey-2M-v3)
- Extremely restrictive across ALL tested geographies
- Returned 0-5 results in Slough, Birmingham, Manchester
- Recommendation: Use "< 3" for moderate restriction, "< 5" for broader search
- Reference: Project MixedUse-8Storey-2M-v3, Approach A
```

**4.3 - Update FILTER_PATTERNS.md (if new patterns emerged):**

If a particularly successful approach isn't already documented:
```markdown
### Pattern D: Airspace Development with Flat Roof Targeting
```
Strategy: Target low-rise buildings with flat roofs in high-transport areas for vertical extension
Indicators:
- A building in the title has flat roof: Yes
- Max building height on title (m): <15m
- Distance to nearest Train Station: <500-1000m
- Title area: 0.2-1 acre

Proven Performance:
- MixedUse-8Storey-2M-v3: 12 results in Slough, 45 in Birmingham
- Capital: £50k-£150k for airspace rights
- Profit potential: £1M-£3M depending on floors added

Strengths: Existing structure, utilities, access; lower planning risk
Weaknesses: Structural assessment required; freeholder negotiation
```

---

### Stage 5: Refinement (Optional)

**Goal:** Improve underperforming approaches based on learnings

**Input:** Failed/restrictive approaches + learnings from Stage 4

**Output:** `04_REFINEMENT/RefinedApproach[X]_v2.md`

**Duration:** 30-45 minutes per approach

**Process:**

**5.1 - Identify Refinement Candidates:**

Approaches that were:
- Too restrictive (0-5 results)
- Had promise but one fatal flaw
- Used overly conservative assumptions

**5.2 - Apply Learnings and Refine:**

Example:
```markdown
# Approach A Refined: Stalled Planning (v2)

## Original Issues:
- "Applications in last 5 years = 0" → 0 results
- Too restrictive when combined with price cap

## Refinements Applied:
1. Changed: "Applications in last 5 years: is less than 3" (from "= 0")
2. Removed: "Building on title is inactive" (overly restrictive combo)
3. Kept: Other filters unchanged

## Filter Criteria (v2):
1. Proposal: contains "mixed-use" AND "storey"
2. Last application submitted: is before 2023-01-19
3. Applications in the last 5 years: is less than 3  ← CHANGED
4. Title area (acres): is greater than 0.2 AND less than 2
5. Sales listing currently on the market: is equal to Yes
6. Sales listing price: is less than 500000
```

**5.3 - Retest Refined Approaches:**

Follow Stage 3 process for refined versions.

---

### Stage 6: Site Validation & Deep Research

**Goal:** Screen results, shortlist properties, deep dive on best candidates

**Input:** Winning approach results (property list from SearchLand)

**Output:** 
- `05_SITE_VALIDATION/ShortlistedSites.md`
- `06_DEEP_RESEARCH/[PropertyID]/` (for selected properties)

**Duration:** Varies by property count and depth

**Process:**

**6.1 - Export Results:**

From SearchLand:
1. Use winning approach filter
2. Export results to CSV
3. Save as `05_SITE_VALIDATION/RawResults.csv`

**6.2 - Define Validation Criteria:**

Create `ValidationCriteria.md`:
```markdown
# Site Validation Criteria - Red Flags

## Automatic Rejections:
❌ Flood Zone 3 coverage >50%
❌ Green Belt coverage >30%
❌ Ancient Woodland on site
❌ Active Listed Building constraints
❌ No vehicle access
❌ Overhead power lines directly across site
❌ Active leases with >20 years remaining

## Investigation Required:
⚠️ TPO (Tree Preservation Orders) >10% coverage
⚠️ Conservation Area
⚠️ Article 4 Directions
⚠️ Contaminated land history
⚠️ Railway/motorway noise proximity

## Positive Signals:
✅ Existing planning application (even if expired)
✅ SHLAA allocation (housing land availability)
✅ Site allocation in local plan
✅ Recent similar approvals in area
✅ Corporate ownership (easier negotiation)
✅ Derelict/inactive (motivated seller signal)
```

**6.3 - LLM-Assisted Screening:**

Prompt:
```markdown
Review the attached RawResults.csv against ValidationCriteria.md.

For each property:
1. Check for automatic rejection criteria
2. Flag investigation requirements
3. Note positive signals
4. Assign priority: HIGH / MEDIUM / LOW / REJECT

Output as structured list.
```

**6.4 - Deep Research (Top 3-5 Properties):**

For each high-priority property, create:
```
06_DEEP_RESEARCH/[PropertyID]/
├── Overview.md (title, location, current use, ownership)
├── PlanningHistory.md (all apps, outcomes, policy context)
├── Section106_CIL.md (obligations, community infrastructure levy)
├── Constraints.md (detailed constraint analysis)
├── CapitalBreakdown.md (acquisition, planning, construction costs)
├── ProfitProjection.md (GDV, costs, profit calculation)
└── FinalRecommendation.md (GO / NO-GO / MORE INFO NEEDED)
```

**6.5 - Shortlist Summary:**

`ShortlistedSites.md`:
```markdown
# Shortlisted Properties

## Priority 1: [Address]
- **Title:** [Title number]
- **Approach:** D (Airspace Development)
- **Capital Required:** £120k (airspace rights + legals)
- **Profit Projection:** £1.8M (4-storey addition, 8 units)
- **Key Risks:** Structural capacity unknown, requires survey
- **Next Steps:** Instruct structural engineer, open negotiation with freeholder

## Priority 2: [Address]
...
```

---

## Project Structure

```
projects/[ProjectName]/
├── 00_REQUIREMENTS/
│   └── Requirements.md
│
├── 01_DIVERGENT_GENERATION/
│   ├── ApproachA_Gemini_[Name].md
│   ├── ApproachB_Gemini_[Name].md
│   ├── ApproachC_Codex_[Name].md
│   ├── ApproachD_Codex_[Name].md
│   ├── ApproachE_Claude_[Name].md
│   ├── ApproachF_Claude_[Name].md
│   └── IterationLog.md
│
├── 02_VALIDITY_CHECK/
│   ├── ValidationMatrix.md
│   └── RejectedApproaches.md
│
├── 03_PARALLEL_TESTING/
│   ├── ApproachA_Results.md
│   ├── ApproachC_Results.md
│   ├── ApproachD_Results.md
│   ├── ApproachE_Results.md
│   └── ComparativeAnalysis.md
│
├── 04_REFINEMENT/ (optional)
│   ├── ApproachA_v2.md
│   └── ApproachA_v2_Results.md
│
├── 05_SITE_VALIDATION/
│   ├── RawResults.csv
│   ├── ValidationCriteria.md
│   ├── ScreeningResults.md
│   └── ShortlistedSites.md
│
├── 06_DEEP_RESEARCH/
│   ├── Property_TN123456/
│   │   ├── Overview.md
│   │   ├── PlanningHistory.md
│   │   ├── Section106_CIL.md
│   │   ├── Constraints.md
│   │   ├── CapitalBreakdown.md
│   │   ├── ProfitProjection.md
│   │   └── FinalRecommendation.md
│   └── Property_TN789012/
│       └── ... (same structure)
│
└── PROJECT_SUMMARY.md
```

---

## CLI Commands Reference

### Stage 1: Divergent Generation

**Gemini (Generate 2 approaches):**
```bash
cat projects/[PROJECT]/00_REQUIREMENTS/Requirements.md \
    SearchlandContext/AvailableFiltersInSearchLand_ACTUAL.md \
    FILTER_PATTERNS.md | \
gemini -p "[Divergent generation prompt - see Stage 1]" \
> projects/[PROJECT]/01_DIVERGENT_GENERATION/temp_gemini.md

# Manually split into ApproachA_Gemini_[Name].md and ApproachB_Gemini_[Name].md
```

**Codex:**
```bash
cat projects/[PROJECT]/00_REQUIREMENTS/Requirements.md \
    SearchlandContext/AvailableFiltersInSearchLand_ACTUAL.md \
    FILTER_PATTERNS.md > /tmp/codex_divergent.txt

echo "[Divergent generation prompt]" >> /tmp/codex_divergent.txt

codex exec --skip-git-repo-check "$(cat /tmp/codex_divergent.txt)" \
> projects/[PROJECT]/01_DIVERGENT_GENERATION/temp_codex.md

# Manually split into ApproachC and ApproachD
```

**Claude:**
```bash
# Claude is the current assistant, so direct processing
# Create ApproachE_Claude_[Name].md and ApproachF_Claude_[Name].md
```

### Stage 2: Validity Check

**ALL LLMs review ALL approaches:**
```bash
cat projects/[PROJECT]/01_DIVERGENT_GENERATION/Approach*.md \
    SearchlandContext/AvailableFiltersInSearchLand_ACTUAL.md \
    LEARNINGS_DATABASE.md | \
gemini -p "[Validity check prompt - see Stage 2]" \
> projects/[PROJECT]/02_VALIDITY_CHECK/validation_gemini.md

# Repeat for codex and claude
# Manually consolidate into ValidationMatrix.md
```

### Stage 3-6: Manual Process

- Stage 3: Manual testing in SearchLand UI
- Stage 4: Manual updates to knowledge files
- Stage 5: Repeat Stage 1-3 for refined approaches
- Stage 6: Deep research (combination of manual + LLM assistance)

---

## Quick Reference Card

### ✅ DO:
- Generate 4-6 diverse approaches (divergent)
- Validate for technical correctness only
- Test all valid approaches empirically
- Capture universal implementation learnings
- Update knowledge base after each project

### ❌ DON'T:
- Force early consensus
- Critique strategic quality during validation
- Assume theoretical best = empirical best
- Capture geography-specific results as universal learnings
- Skip testing "because an LLM said it won't work"

### 🎯 Success Criteria:
- ≥4 valid approaches generated
- ≥2 approaches tested in SearchLand
- ≥1 approach yields 10-50 results (optimal range)
- Learnings captured in LEARNINGS_DATABASE.md
- Shortlist created for deep research

---

## Troubleshooting

### Problem: All approaches return 0 results
**Cause:** Over-constraining filters or unrealistic requirements
**Solution:** 
1. Test individual filters separately to identify culprit
2. Relax most restrictive constraint (e.g., price cap, date ranges)
3. Consider if requirements are achievable in target geography

### Problem: All approaches return 1000+ results
**Cause:** Under-constraining filters
**Solution:**
1. Add motivation signals (long hold, derelict, inactive)
2. Tighten geographic constraints (distance to transport)
3. Add use class or size filters

### Problem: Validation rejects all approaches
**Cause:** LLMs unfamiliar with actual SearchLand capabilities
**Solution:**
1. Emphasize AvailableFiltersInSearchLand_ACTUAL.md in prompts
2. Reference LEARNINGS_DATABASE.md explicitly
3. Consider if new approach needs research into available filters

### Problem: Can't decide between 2 good approaches
**Solution:** 
- **Use both!** Different strategies for different geographies
- Run both as separate filters in SearchLand
- Compare resulting properties for overlap

---

## Version History

### v3.0 (2025-11-19) - Divergent Hypothesis Testing
- **MAJOR CHANGE:** Divergent generation replaces consensus-seeking
- Added 6-stage workflow (was 4 stages in v2.2)
- Separated validity check from strategic critique
- Added parallel testing phase
- Created LEARNINGS_DATABASE.md and FILTER_PATTERNS.md
- Added Site Validation and Deep Research stages
- Completely restructured project folders

### v2.2 (2025-01-19) - Output Format Correction
- Added structured output format requirement
- Integrated AvailableFiltersInSearchLand_ACTUAL.md
- Added implementation iteration phase

### v2.0 (2025-01-19) - First Production Release
- Minimum 2 iterations enforced
- Convergence criteria defined
- Project-based organization

### v1.0 (2025-01-18) - Initial Release
- Basic multi-LLM workflow
- Single-iteration convergence (flawed)

---

**Last Updated:** 2025-11-19  
**Status:** v3.0 Production Ready  
**Next:** Run first project with new divergent workflow
