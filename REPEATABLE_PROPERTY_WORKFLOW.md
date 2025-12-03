# Repeatable Property Development Workflow v5.2

**A Systematic 10-Step Process for Property Search, Validation, and Research**

---

## Overview

This workflow transforms SearchLand AI outputs into a professional shortlist of investment-ready properties. Each step builds on the previous, creating comprehensive documentation and learnings for future projects.

**Total Time:** 5-15 hours per approach (depending on result count)  
**Total Cost:** £0-£4,000 per property (basic to full research)  
**Deliverables:** Consolidated Executive Summary + Enriched Dossiers + Investment Shortlist

---

## Prerequisites

✅ **Phase 0-2 Complete:** Multi-LLM generation has produced ready-to-test approaches  
✅ **Project Structure:** Standard v5.2 project layout exists  
✅ **SearchLand Access:** Active account for testing approaches  
✅ **LLM CLIs:** Gemini, Codex, Grok, Claude available for property analysis

---

## Phase 0-2: Multi-LLM Generation Process

**If you need to generate approaches from scratch, run Phase 0-2 first:**

### Phase 0: Independent Generation (4 LLMs Parallel)

**Script:** `orchestrate_independent.sh`  
**Runtime:** ~5-10 minutes  
**Purpose:** Generate diverse property search strategies

**Process:**
1. **All LLMs receive identical prompts and context** (natural divergence, not forced personas)
   - Same generation prompt: "Generate 1-3 unique property search strategies..."
   - Same reference materials and requirements
   - Each LLM brings its inherent analytical style and capabilities

2. **Shared Context Provided:**
   - Project requirements (`00_REQUIREMENTS/Requirements.md`)
   - FILTER_PATTERNS.md (23 strategic patterns)
   - LEARNINGS_DATABASE.md (implementation knowledge)
   - AvailableFiltersInSearchLand_ACTUAL.md (verified filters)
   - PresetFiltersBuiltIntoSearchLand.md (86 expert examples)

3. **Each LLM Generates 1-3 Approaches:**
   - Unique perspectives on the same requirements
   - Mandatory precedent-based strategy (at least one per planning application)
   - Technical validity checks against actual filters

**Outputs:**
- `01_DIVERGENT_GENERATION/Gemini_Approaches.md`
- `01_DIVERGENT_GENERATION/Codex_Approaches.md`
- `01_DIVERGENT_GENERATION/Grok_Approaches.md`
- `01_DIVERGENT_GENERATION/Claude_Approaches.md`

**To Run:**
```bash
cd projects/[YourProject]/.agents
./orchestrate_independent.sh
```

---

### Phase 1: Cross-Validation (4 LLMs Parallel)

**Script:** `orchestrate_crossvalidation.sh`  
**Runtime:** ~5-10 minutes  
**Purpose:** Technical and business case validation

**Process:**
1. **All LLMs review ALL approaches** independently
2. **Validation Criteria:**
   - Filter existence (must be in AvailableFiltersInSearchLand_ACTUAL.md)
   - Unit correctness (acres/sqft/metres, not sqm)
   - Syntax validity (SearchLand AI parsing)
   - Capital feasibility (£200k budget)
   - ROI calculations (£2M profit target)
   - Implementation viability
   - Deal structure soundness

3. **Automatic Disagreement Detection:**
   - Compares all 4 LLM assessments
   - Identifies factual disagreements
   - Triggers Phase 1.5 if needed

**Outputs:**
- `02_VALIDITY_CHECK/Gemini_Critique.md`
- `02_VALIDITY_CHECK/Codex_Critique.md`
- `02_VALIDITY_CHECK/Grok_Critique.md`
- `02_VALIDITY_CHECK/Claude_Critique.md`
- `02_VALIDITY_CHECK/DISAGREEMENT_ANALYSIS.md`

**To Run:**
```bash
cd projects/[YourProject]/.agents
./orchestrate_crossvalidation.sh
```

---

### Phase 1.5: Technical Iteration (Conditional)

**Script:** `orchestrate_technical_iteration.sh`  
**Runtime:** ~3-5 minutes (if triggered)  
**Purpose:** Resolve factual disagreements

**Process:**
1. **Triggers automatically** if disagreements detected in Phase 1
2. **All LLMs reconsider positions** based on disagreement analysis
3. **Evidence-based iteration:**
   - Reassess filter existence, units, syntax
   - Re-evaluate capital and ROI calculations
   - Clarify misunderstandings

4. **Does NOT iterate on strategic preferences** (only technical facts)

**Outputs:**
- `02_VALIDITY_CHECK/Iteration_Gemini.md`
- `02_VALIDITY_CHECK/Iteration_Codex.md`
- `02_VALIDITY_CHECK/Iteration_Grok.md`
- `02_VALIDITY_CHECK/Iteration_Claude.md`

**To Run (automatic):**
- Triggered automatically by Phase 1 if disagreements exist

---

### Phase 2: Synthesis & Extraction (Claude)

**Script:** `orchestrate_synthesis.sh`  
**Runtime:** ~3-5 minutes  
**Purpose:** Create validation matrix and extract ready-to-test approaches

**Process:**
1. **Claude synthesizes all inputs:**
   - All 4 original approaches
   - All 4 critique files
   - Any iteration results

2. **Creates Validation Matrix:**
   - Groups similar approaches naturally
   - Marks each as VALID/CONDITIONAL/INVALID
   - Preserves strategic diversity

3. **Extracts Ready-to-Test Files:**
   - Clean, executable SearchLand AI prompts
   - Technical fixes applied for CONDITIONAL approaches
   - Professional format for client delivery

**Outputs:**
- `02_VALIDITY_CHECK/SYNTHESIS_OUTPUT.md`
- `02_VALIDITY_CHECK/FINAL_ValidationMatrix.md`
- `03_PARALLEL_TESTING/ApproachA_ReadyToTest.md` (for each VALID/CONDITIONAL)
- `ExecutiveSummary.md` (auto-created consolidated summary in project root)
- `04_REFINEMENT/SYSTEM_RUN_SUMMARY.md`

**To Run:**
```bash
cd projects/[YourProject]/.agents
./orchestrate_synthesis.sh
```

---

### Master Orchestration Script

**Script:** `RUN_ALL_v5.sh`  
**Purpose:** Run complete Phase 0-2 workflow automatically

**Process:**
1. Phase 0: Independent Generation
2. Phase 1: Cross-Validation
3. Phase 1.5: Technical Iteration (if needed)
4. Phase 2: Synthesis & Extraction

**To Run Everything:**
```bash
cd projects/[YourProject]/.agents
./RUN_ALL_v5.sh
```

**Runtime:** 15-25 minutes total

---

### Shared Configuration

**File:** `PROMPTS_CONFIG.sh`  
**Purpose:** Centralized prompt definitions for all phases

**Contains:**
- **Short Prompts** (used with `-p` flag):
  - `$SYSTEM_PROMPT` - Claude CLI system prompt override
  - `$PROMPT_GENERATION` - Phase 0 generation prompt
  - `$PROMPT_CRITIQUE` - Phase 1 validation prompt
  - `$PROMPT_DISAGREEMENT` - Phase 1 disagreement analysis
  - `$PROMPT_ITERATION` - Phase 1.5 reconsideration prompt
  - `$PROMPT_SYNTHESIS` - Phase 2 synthesis prompt

- **Long Context Prompts** (instruction blocks for context files):
  - `$CONTEXT_GENERATION` - Full generation instructions
  - `$CONTEXT_CRITIQUE` - Full validation instructions
  - `$CONTEXT_DISAGREEMENT` - Full disagreement analysis instructions
  - `$CONTEXT_ITERATION` - Full iteration instructions
  - `$CONTEXT_SYNTHESIS` - Full synthesis instructions

**Benefits:**
- All prompts centralized and version-controlled
- Easy maintenance and updates
- Consistent across all orchestration scripts
- Clear separation of short vs long prompts

---

### Terminal Execution Guide

**Location:** All commands run from `projects/[YourProject]/.agents/`

#### Running Complete Workflow

```bash
# Run everything (Phase 0 → Phase 2)
cd projects/MixedUse-8Storey-2M-v20/.agents
./RUN_ALL_v5.sh
```

#### Running Individual Phases

```bash
# Phase 0 only (Generation)
./orchestrate_independent.sh

# Phase 1 only (Critique)
./orchestrate_crossvalidation.sh

# Phase 1.5 only (Iteration - if disagreements exist)
./orchestrate_technical_iteration.sh

# Phase 2 only (Synthesis)
./orchestrate_synthesis.sh
```

#### Restarting After Database Updates

**Common scenario:** You've updated `LEARNINGS_DATABASE.md` or `AvailableFiltersInSearchLand_ACTUAL.md` and want to re-run critique with fresh knowledge.

```bash
cd projects/MixedUse-8Storey-2M-v20/.agents

# Option 1: Re-run critique only (keeps existing generations)
./orchestrate_crossvalidation.sh

# Option 2: Re-run critique + iteration + synthesis
./orchestrate_crossvalidation.sh && \
./orchestrate_technical_iteration.sh && \
./orchestrate_synthesis.sh

# Option 3: Full restart (regenerate everything)
./RUN_ALL_v5.sh
```

**Best Practice:** After significant filter documentation updates (like v5.2.3), use Option 2 to re-validate existing approaches with new knowledge.

#### Manual Execution (When CLI Fails)

If LLM CLI tools hit rate limits or aren't available:

```bash
# 1. Read the context files manually
cat ../00_REQUIREMENTS/*.md
cat ../../FILTER_PATTERNS.md
cat ../../LEARNINGS_DATABASE.md

# 2. Copy the prompt from PROMPTS_CONFIG.sh
source PROMPTS_CONFIG.sh
echo "$PROMPT_CRITIQUE"

# 3. Run in web interface (Claude, Gemini, etc.)
# 4. Save output manually to appropriate file:
#    02_VALIDITY_CHECK/Gemini_Critique.md
#    02_VALIDITY_CHECK/Codex_Critique.md
#    etc.

# 5. Continue with next phase
./orchestrate_synthesis.sh
```

#### Checking Progress

```bash
# View latest generation outputs
ls -lh ../01_DIVERGENT_GENERATION/

# View critique results
ls -lh ../02_VALIDITY_CHECK/

# Check for disagreements
cat ../02_VALIDITY_CHECK/DISAGREEMENT_ANALYSIS.md

# View ready-to-test approaches
ls -lh ../03_PARALLEL_TESTING/

# Check synthesis output
cat ../02_VALIDITY_CHECK/SYNTHESIS_OUTPUT.md
```

#### Background Execution

For long-running processes (when testing multiple projects):

```bash
# Run in background with logging
nohup ./RUN_ALL_v5.sh > run_all.log 2>&1 &

# Check progress
tail -f run_all.log

# Check if still running
ps aux | grep RUN_ALL_v5.sh
```

#### Common Terminal Issues

**Issue:** `permission denied`
```bash
# Fix: Make scripts executable
chmod +x *.sh
```

**Issue:** `command not found` (LLM CLI)
```bash
# Check which CLIs are available
which gemini codex grok claude

# Edit orchestration scripts to skip unavailable CLIs
# Or use manual execution mode
```

**Issue:** `No such file or directory`
```bash
# Ensure you're in the right directory
pwd  # Should end in .agents/

# Check project structure
ls ../*
```

**Issue:** Rate limits on Claude CLI
```bash
# Claude CLI often hits limits - use manual execution
# Or switch to Gemini-only for testing:
# Edit orchestrate_crossvalidation.sh and comment out Claude calls
```

---

### Phase 0-2 Success Indicators

✅ **Generation Complete:**
- 4 approach files created (1 per LLM)
- Each contains 1-3 unique strategies
- All approaches reference actual planning applications

✅ **Validation Complete:**
- 4 critique files created
- Disagreement analysis completed
- Factual consensus achieved

✅ **Synthesis Complete:**
- Validation matrix created
- Ready-to-test approaches extracted
- Technical fixes applied where needed

✅ **Ready for Stage 4:**
- `03_PARALLEL_TESTING/` contains executable approaches
- Each approach has verified SearchLand AI prompt
- Professional documentation ready for refinement

---

### Common Phase 0-2 Issues

**LLM CLI Not Available:**
- Check CLI installation and authentication
- Use manual generation flags in scripts
- Claude CLI often hits rate limits - use manual mode

**Disagreements Not Resolved:**
- Check if iteration actually ran (bug fixed in v5.1.1)
- Review disagreement analysis for factual vs strategic issues
- Strategic differences are preserved (not resolved)

**No Valid Approaches:**
- Requirements may be too restrictive
- LLMs may lack SearchLand knowledge
- Check LEARNINGS_DATABASE.md for known issues
- Iterate on requirements and re-run

**SearchLand AI Parsing Errors:**
- Common in Phase 0-2: filters may not exist or units wrong
- Validation catches these issues
- Fixed in synthesis phase before testing

---

## Executive Summary: Creation & Updates

### When Created: End of Phase 2 (Automated)

**File:** `ExecutiveSummary.md` (in project root)  
**Template:** Consolidated summary covering all approaches  
**Purpose:** Project-level overview and next steps guidance  
**Automation:** Created automatically by `orchestrate_synthesis.sh`

**Pre-populated:**
- **Project Overview:** Target profit, capital requirements, approach count
- **Approaches Summary Table:** All generated approaches with status
- **Phase 0-2 Results:** Generation, validation, and synthesis outcomes
- **Next Steps:** Detailed Stage 4-6 workflow guidance
- **Quality Assurance:** Technical and business case validation confirmation

### Complete Executive Summary Lifecycle

**Phase 2:** Auto-generated with project overview and approaches table
**Step 1:** Add validation section for current approach (screenshot reference)
**Step 2:** Complete validation section (issues documented, learning capture noted)
**Step 3:** Add Stage 4 results section (geography counts, visual exclusions, properties listed)
**Step 4:** Add lessons learned section (prompt updates, database contributions)
**Stage 5:** Add multi-LLM analysis results (tenable/non-tenable counts, consensus summary)
**Stage 6:** Add deep research results + final recommendations (research findings, investment recommendations)

**Final Executive Summary Contains:**
1. **Project-Level Overview** - All approaches, targets, and system validation
2. **Individual Approach Results** - Stage 4-6 results for each approach
3. **Consolidated Analysis** - Cross-approach comparisons and rankings
4. **Investment Recommendations** - Prioritized approaches and owner outreach strategy
5. **Complete Research Evidence** - All screenshots, analysis, and professional consultations
6. **Professional Documentation** - Client-ready executive summary format  

---

## Executive Summary Sections Reference

| Section | When Added | What Gets Added |
|---------|------------|-----------------|
| **Project Overview** | Phase 2 (Auto) | Project targets, approaches table, system status |
| **Phase 0-2 Results** | Phase 2 (Auto) | Generation, validation, synthesis outcomes |
| **Next Steps Guidance** | Phase 2 (Auto) | Detailed Stage 4-6 workflow instructions |
| **Stage 4: Validation** | Steps 1-2 | SearchLand AI parsing for each approach |
| **Stage 4: Results** | Step 3 | Geography counts, visual exclusions, properties identified |
| **Stage 4: Lessons Learned** | Step 4 | What worked, database contributions, prompt tweaks |
| **Stage 5: Multi-LLM Analysis** | Stage 5 | Tenable/non-tenable counts, per-LLM verdicts, consensus |
| **Stage 6: Deep Research** | Stage 6 | Research progress, final exclusions, ROI projections |
| **Final Recommendations** | Stage 6 | Approach rankings, investment strategy, owner outreach plan |

---

## Step 0: Executive Summary Created (Automated)

**Status:** ✅ **COMPLETED** - Executive Summary auto-generated by Phase 2 synthesis script.

**What was created:**
- `ExecutiveSummary.md` consolidated summary in project root
- Pre-populated with project overview, approaches table, Phase 0-2 results, and next steps
- Ready for refinement testing in Steps 1-5

---

## Step 1: Execute SearchLand AI Test

### Input
- Ready-to-test approach from `03_PARALLEL_TESTING/Approach[X]_ReadyToTest.md`

### Process
1. **Open SearchLand.co.uk** and navigate to "Create Custom Search" or "AI Search"

2. **Copy the SearchLand AI Prompt** from the ready-to-test file:
   ```
   1. Title area (acres): is greater than 0.25 AND less than 2
   2. Ownership type: is equal to Company
   3. Company status: is one of Liquidation, In Administration
   4. Building on title is inactive: is equal to Yes
   5. Max building height on title (m): is less than 12
   ```

3. **Paste the prompt** into SearchLand's AI input field

4. **Take Screenshot** BEFORE clicking "Search":
   - Save as: `04_REFINEMENT/Screenshots/Approach[X]_SearchLandOutput.jpg`
   - This shows what filters SearchLand AI actually created
   - Example: ApproachA_SearchLandOutput.jpg

### Executive Summary Update
**Add to the consolidated `ExecutiveSummary.md`:**

```markdown
## Stage 4: SearchLand AI Validation - Approach [X]

### SearchLand AI Parsing

**Date:** [Current Date]
**Screenshot:** 04_REFINEMENT/Screenshots/Approach[X]_SearchLandOutput.jpg

**Validation Results:**
[Initial assessment - will be completed in Step 2]
```

---

## Step 2: Validate Filter Parsing

### Input
- Screenshot from Step 1 showing SearchLand AI output
- Original prompt from ready-to-test file

### Process
1. **Compare Intended vs Actual Filters:**
   - Open screenshot: `04_REFINEMENT/Screenshots/Approach[X]_SearchLandOutput.jpg`
   - Compare with original prompt line-by-line
   - Check: Filter existence, units, operators, syntax

2. **Document Issues** in `04_REFINEMENT/VALIDATION_LOG.md`:
   ```markdown
   ## Approach X Validation - [Date]

   | Filter # | Intended | Actual | Status | Issue |
   |----------|----------|--------|--------|-------|
   | 1 | Title area (acres): is greater than 0.25 | Title area (acres): is greater than 0.25 | ✅ OK | None |
   | 2 | Ownership type: is equal to Company | Ownership type: is equal to Company | ✅ OK | None |
   | 3 | Company status: is one of Liquidation | Company status: is one of Liquidation | ✅ OK | None |
   | 4 | Building on title is inactive: is equal to Yes | [Missing] | ❌ ERROR | Filter not created |
   | 5 | Max building height (m): is less than 12 | Max building height (m): is less than 12 | ✅ OK | None |

   **Issues Found:**
   - Building on title is inactive filter not created by SearchLand AI
   - Possible cause: AI doesn't recognize "inactive" keyword
   ```

3. **If Issues Found:** Iterate Steps 1-2 with updated prompt:
   ```bash
   # Update prompt syntax and try again
   # Example: "Building on title is inactive: Yes" instead of "is equal to Yes"
   ```

### Executive Summary Update
**Complete the Approach [X] validation section in `ExecutiveSummary.md`:**

```markdown
## Stage 4: SearchLand AI Validation - Approach [X]

### SearchLand AI Parsing

**Date:** [Current Date]
**Screenshot:** 04_REFINEMENT/Screenshots/Approach[X]_SearchLandOutput.jpg

**Validation Results:**

| Filter # | Intended | Actual | Status | Issue |
|----------|----------|--------|--------|-------|
| 1 | [Filter 1] | [What AI created] | ✅/❌ | [Issue or OK] |
| 2 | [Filter 2] | [What AI created] | ✅/❌ | [Issue or OK] |
...

**Issues Found:**
- [Specific parsing issues identified]
- [LEARNINGS_DATABASE.md updated: YES/NO]
- [Prompt updated: YES/NO]
```

---

## Step 3: Run Search & Capture Results

### Input
- Validated prompt from Steps 1-2 for the current approach

### Process
1. **Execute Search** in SearchLand (click "Search" button)

2. **Document Result Count** by geography in a local log:
   ```markdown
   ## Approach X Results - [Date]

   **Slough:** 12 properties
   **Birmingham:** 8 properties
   **Manchester:** 5 properties
   **London:** 0 properties

   **TOTAL:** 25 properties
   ```

3. **For Each Property in Results:**
   - Click property in SearchLand results
   - View aerial/satellite image
   - Take screenshot showing:
     - Property boundaries
     - Surrounding context
     - Obvious constraints (rivers, roads, green space)

4. **Save Property Screenshots** with consistent naming:
   ```
   04_REFINEMENT/Screenshots/
   ├── ApproachX_PropertyAddress1.jpg
   ├── ApproachX_PropertyAddress2.jpg
   └── ApproachX_PropertyAddress3.jpg

   Examples:
   ├── ApproachA_123HighStreetSlough.jpg
   ├── ApproachA_456MainRoadBirmingham.jpg
   └── ApproachA_789ParkLaneManchester.jpg
   ```

5. **Immediate Visual Exclusion** (remove obviously non-relevant sites):
   - Too small: Visual check vs expected size
   - Wrong type: Residential when seeking commercial
   - Obvious constraints: Flood zone, listed building visible
   - Document exclusions with reasons

### Executive Summary Update
**Update the consolidated `ExecutiveSummary.md`:**

1. **Update Approaches Table** - Change status from "Ready for Testing" to actual result count:
   ```
   | A | Corporate Distressed Assets | 25 properties found | Expected Results |
   ```

2. **Add Stage 4 Results Section** for this approach:
   ```markdown
   ## Stage 4: Refinement Results - Approach A

   ### Initial Results
   | Geography | Result Count | Quality Notes |
   |-----------|--------------|---------------|
   | Slough | 12 | Good mix of commercial properties |
   | Birmingham | 8 | Mostly city centre locations |
   | Manchester | 5 | Some industrial areas |
   | London | 0 | Over-constrained for this approach |
   | **TOTAL** | **25** | Good diversity, some exclusions needed |

   ### After Visual Exclusion
   | Geography | Remaining | Excluded | Notes |
   |-----------|-----------|----------|-------|
   | Slough | 10 | 2 | 2 too small (< 0.25 acres) |
   | Birmingham | 7 | 1 | 1 wrong building type |
   | Manchester | 4 | 1 | 1 flood zone visible |
   | London | 0 | 0 | No results to begin with |
   | **TOTAL** | **21** | **4** | 16% exclusion rate |

   ### Properties Identified (After Exclusion)
   1. 123 High Street, Slough - Former retail unit, good size
   2. 456 Main Road, Birmingham - Office building, central location
   ...

   ### Properties Excluded (Visual Check)
   1. 789 Small Lane, Slough - Too small (appears < 0.2 acres)
   2. 101 Residential St, Birmingham - Wrong use class (residential)
   ...

   ### Screenshot References
   - `04_REFINEMENT/Screenshots/ApproachA_SearchLandOutput.jpg`
   - `04_REFINEMENT/Screenshots/ApproachA_123HighStreetSlough.jpg`
   - `04_REFINEMENT/Screenshots/ApproachA_456MainRoadBirmingham.jpg`
   ...
   ```

3. **Update Project Status** in the Executive Summary header

---

## Step 4: Structured Learning Capture

### Input
- Validation log from Step 2
- Any prompt iterations from Steps 1-3

### Process


## 📁 Folder Structure for Screenshots

```
projects/MixedUse-8Storey-2M-v20/
└── 04_REFINEMENT/
    ├── Screenshots/
    │   ├── ApproachA_SearchLandOutput.jpg          ← SearchLand AI interpretation
    │   ├── ApproachA_Property_123HighStSlough.jpg  ← Individual properties
    │   ├── ApproachA_Property_456MainRdBirmingham.jpg
    │   ├── ApproachB_SearchLandOutput.jpg
    │   ├── ApproachB_Property_789ParkLn.jpg
    │   └── ...
    └── VALIDATION_LOG.md                           ← Validation tracking
```

---

## 📸 Screenshot Naming Convention

### Step 1: SearchLand AI Output (BEFORE clicking "Search")

**When to take:** Right after SearchLand AI creates the filters, BEFORE you click the search button

**Naming:**
```
Approach[LETTER]_SearchLandOutput.jpg
```

**Examples:**
- `ApproachA_SearchLandOutput.jpg`
- `ApproachB_SearchLandOutput.jpg`
- `ApproachC_SearchLandOutput.jpg`

**What to capture:**
- The entire filter panel showing what SearchLand AI created
- All 10 filters visible (may need to scroll and take 2 screenshots if needed)

---

### Step 2: Individual Property Screenshots (AFTER search results)

**When to take:** After clicking "Search", for each property result

**Naming:**
```
Approach[LETTER]_Property_[ShortAddress].jpg
```

**Examples:**
- `ApproachA_Property_123HighStSlough.jpg`
- `ApproachA_Property_45CommercialRdLondon.jpg`
- `ApproachB_Property_DerelictWarehouseBirmingham.jpg`

**Address Format Tips:**
- Remove spaces: `123 High Street` → `123HighSt`
- Shorten: `Commercial Road` → `CommercialRd`
- Add city if needed: `...Slough`, `...London`, `...Birmingham`
- Keep it under 50 characters

**What to capture:**
- Aerial/satellite view of the property
- Property boundaries clearly visible
- Surrounding context (roads, buildings, green space)

---

## 🗂️ Create the Folder Now

### 📸 Screenshot Folder Structure & Naming

```
projects/MixedUse-8Storey-2M-v20/04_REFINEMENT/Screenshots/
├── ApproachA_SearchLandOutput.jpg          ← SearchLand AI filters (BEFORE search)
├── ApproachA_Property_123HighStSlough.jpg  ← Individual property results
├── ApproachA_Property_45CommercialRd.jpg
├── ApproachB_SearchLandOutput.jpg
├── ApproachB_Property_789ParkLn.jpg
└── ...
```

---

### 📋 Exact Naming Convention

**1. SearchLand AI Output (take BEFORE clicking Search):**
```
Approach[LETTER]_SearchLandOutput.jpg
```
Examples:
- `ApproachA_SearchLandOutput.jpg`
- `ApproachB_SearchLandOutput.jpg`

**2. Individual Properties (after search results):**
```
Approach[LETTER]_Property_[ShortAddress].jpg
```
Examples:
- `ApproachA_Property_123HighStSlough.jpg`
- `ApproachB_Property_DerelictWarehouseBirmingham.jpg`

**Address Shortening:**
- Remove spaces: `123 High Street` → `123HighSt`
- Abbreviate: `Street`→`St`, `Road`→`Rd`
- Add city: `...Slough`, `...London`
- Keep under 50 characters

---

### ✅ What I Created For You

1. **Folder:** `04_REFINEMENT/Screenshots/` ✅
2. **Validation Log:** `04_REFINEMENT/VALIDATION_LOG.md` ✅ (template ready to fill)
3. **Quick Start Guide:** `04_REFINEMENT/STAGE4_QUICK_START.md` ✅ (step-by-step)

---

### 🚀 Your Next Steps

1. **Open:** `04_REFINEMENT/STAGE4_QUICK_START.md` (complete guide)
2. **Copy prompt from:** `03_PARALLEL_TESTING/ApproachA_ReadyToTest.md` (or B)
3. **Paste into SearchLand**
4. **Screenshot #1:** Save as `ApproachA_SearchLandOutput.jpg` (BEFORE search)
5. **Click Search**
6. **Screenshot each property:** Save as `ApproachA_Property_[Address].jpg`
7. **Fill in:** `04_REFINEMENT/VALIDATION_LOG.md`



1. **Update LEARNINGS_DATABASE.md** with any new discoveries:
   ```markdown
   ### SearchLand AI Filter Parsing Issue

   **Discovered:** 2025-11-20 (Approach: X, Project: MixedUse-8Storey-2M-v5)

   **Issue:**
   SearchLand AI skips "Building on title is inactive" filter when phrased as:
   "Building on title is inactive: is equal to Yes"

   **Workaround:**
   Use shortened syntax:
   "Building on title is inactive: Yes"

   **Performance:**
   ✅ Tested in Approach X - filter created correctly with shortened syntax

   **Impact:** All future projects should use shortened syntax for inactive filters
   ```

2. **Categorize Learning:**
   - **Filter Syntax:** How to phrase filters for AI parsing
   - **Unit Conventions:** Acres vs sqm, sqft vs sqm, metres vs feet
   - **Filter Existence:** What filters work vs don't exist
   - **SearchLand AI Quirks:** Known parsing behaviors

3. **Update Approach Prompt** if needed:
   - Apply learnings to current approach
   - Re-test if significant improvement possible

### Executive Summary Update
**Add to the consolidated `ExecutiveSummary.md`:**

```markdown
## Stage 4: Lessons Learned - Approach [X]

### What worked well:
- [Positive observations from testing]

### What didn't work:
- [Issues encountered and why]

### Improvements for future approaches:
- [Suggestions based on experience]

### Contribution to LEARNINGS_DATABASE.md:
- [Universal insight 1 - documented in database]
- [Universal insight 2 - documented in database]
- [Filter syntax learnings, unit conventions, etc.]

### Recommended Tweaks for This Approach:
- [Updated prompt syntax, filter corrections, geography adjustments]
```

---

## Step 5: Multi-LLM Property Analysis

### Input
- Property screenshots from Step 3
- SearchLand data (title info, use class, planning history)

### Process
1. **Prepare Property Data Package** for each property:
   ```markdown
   ## Property Analysis Package: [Address]

   **Basic Data:**
   - Address: [Full address]
   - Title Area: [X acres]
   - Current Use: [Use class]
   - Ownership: [Type]
   - Planning History: [Recent applications]

   **Visual Data:**
   - Aerial Screenshot: 04_REFINEMENT/Screenshots/Approach[X]_[Address].jpg

   **Strategic Context:**
   - From Approach: [X - Name]
   - Target: £2M profit from £200k capital
   - Required: 8-storey mixed-use potential
   ```

2. **Run Each LLM Analysis** (parallel where possible):
   ```bash
   # Create individual analysis prompts for each LLM
   # Each gets the same data package + specific lens
   ```

3. **LLM Analysis Prompt Template:**
   ```
   Analyze this property for the specified approach:

   [Property Data Package Above]

   Assess from your analytical perspective:
   1. Viability (PROCEED / PROCEED WITH CAUTION / DO NOT PURSUE)
   2. Key strengths (3-5 points)
   3. Key risks (3-5 points)
   4. Motivation Scoring Index (MSI) calculation
   5. Recommended next actions

   Output structured assessment + start DOSSIER draft.
   ```

4. **Cross-Critique Process:**
   - Each LLM reviews other LLMs' assessments
   - Debate specific disagreements (e.g., MSI score differences)
   - Reach consensus or document persistent differences

### Output
- Individual LLM assessments for each property
- Consensus viability rating
- Draft DOSSIER started for each property

---

## Step 6: Create Property DOSSIERS

### Input
- LLM analyses from Step 5
- Property data packages

### Process
1. **Create DOSSIER** for each property using template:
   - Use `templates/Dossier_Template.md`
   - Populate with SearchLand data + LLM analysis
   - Save as: `05_SITE_VALIDATION/Dossier_[Address].md`

2. **Calculate MSI** for each property:
   ```markdown
   ## 7. MOTIVATION SCORING INDEX (MSI)

   | Factor | Points | Evidence | Score |
   |--------|--------|----------|-------|
   | Base Score | 3 | | 3 |
   | Ownership >10 years | +2 | Title shows 2010 purchase | +2 |
   | Corporate ownership | +1 | Company owned | +1 |
   | EPC ≤D | +1 | SearchLand shows F rating | +1 |
   | Vacant/Inactive | +2 | SearchLand shows inactive | +2 |
   | **TOTAL MSI** | | | **9** |

   **Assessment:** ≥7 High motivation (priority)
   ```

3. **Complete DOSSIER Sections** (Stage 5 level):
   - Title Details (SearchLand data)
   - Basic constraints (visual assessment)
   - Planning history (SearchLand data)
   - Market estimates (LLM analysis)
   - Risk assessment (LLM analysis)
   - Visual assessment (screenshots)
   - Analyst verdict (consensus)

### Output
- Complete draft DOSSIER for each property
- MSI calculated and documented
- Viability assessment per property

---

## Step 7: Classify Tenable vs Non-Tenable

### Input
- DOSSIERS from Step 6
- MSI scores and LLM consensus

### Process
1. **Apply Classification Criteria:**
   - **TENABLE:** ≥3 LLMs PROCEED + MSI ≥5 + No showstoppers
   - **NON_TENABLE:** ≥2 LLMs DO NOT PURSUE + MSI <3 + Critical issues

2. **Document Classification** in Executive Summary:
   ```markdown
   ## Stage 5: After Multi-LLM Analysis

   ### Tenable Properties (8 properties)
   1. 123 High Street, Slough - MSI: 8, Consensus: PROCEED
   2. 456 Main Road, Birmingham - MSI: 7, Consensus: PROCEED WITH CAUTION

   ### Non-Tenable Properties (14 properties)
   1. 789 Park Lane, Manchester - MSI: 2, Flood zone 3
   2. 101 River Road, London - MSI: 4, Listed building adjacent
   ```

3. **Update Counts:**
   - Initial: 25 properties
   - After visual exclusion: 22 properties
   - After LLM analysis: 8 tenable, 14 non-tenable

### Executive Summary Update
**Add to the consolidated `ExecutiveSummary.md`:**

```markdown
## Stage 5: Multi-LLM Site Validation Results

### Properties Analysis Summary
| Geography | Tenable | Non-Tenable | Notes |
|-----------|---------|-------------|-------|
| Slough | [Count] | [Count] | [Consensus level] |
| Birmingham | [Count] | [Count] | [Consensus level] |
| Manchester | [Count] | [Count] | [Consensus level] |
| London | [Count] | [Count] | [Consensus level] |
| **TOTAL** | **[Tenable]** | **[Non-Tenable]** | [Overall assessment] |

### Properties Excluded in Stage 5 (Multi-LLM Analysis)
1. **[Address]** - Reason: [LLM consensus - DO NOT PURSUE because...]
2. **[Address]** - Reason: [Specific technical/financial issues]
...

### Multi-LLM Analysis Summary
**Date:** [Current Date]

**Gemini Assessment:**
- Properties rated PROCEED: [Count]
- Properties rated PROCEED WITH CAUTION: [Count]
- Properties rated DO NOT PURSUE: [Count]
- Key observations: [Strategic insights]

**Codex Assessment:**
- Properties rated PROCEED: [Count]
- Key technical concerns: [Filter/unit/syntax issues]

**Grok Assessment:**
- Properties rated PROCEED: [Count]
- Timing/arbitrage insights: [Speed to market advantages]

**Claude Assessment:**
- Properties rated PROCEED: [Count]
- Risk assessment highlights: [Planning/financial risks]

**Cross-Critique Summary:**
- Consensus properties: [Count with 3-4 LLM agreement]
- Disagreements resolved: [Count]
- Properties excluded due to LLM analysis: [Count]
```

---

## Step 8: Organize DOSSIER Folders

### Input
- Classified DOSSIERS from Step 7

### Process
1. **Create Folder Structure:**
   ```
   05_SITE_VALIDATION/
   ├── TENABLE/
   │   ├── Dossier_123HighStreetSlough.md
   │   ├── Dossier_456MainRoadBirmingham.md
   │   └── ...
   └── NON_TENABLE/
       ├── Dossier_789ParkLaneManchester.md
       ├── Dossier_101RiverRoadLondon.md
       └── ...
   ```

2. **Move DOSSIERS** to appropriate folders:
   ```bash
   # Example commands
   mv 05_SITE_VALIDATION/Dossier_123HighStreetSlough.md 05_SITE_VALIDATION/TENABLE/
   mv 05_SITE_VALIDATION/Dossier_789ParkLaneManchester.md 05_SITE_VALIDATION/NON_TENABLE/
   ```

3. **Update Executive Summary** with folder references:
   - Link to TENABLE dossiers for shortlisted properties
   - Note NON_TENABLE dossiers contain rejection analysis for learning

### Output
- Organized DOSSIER folders
- Clear separation of tenable vs non-tenable properties

---

## Step 9: Create Deep Research Plan

### Input
- TENABLE DOSSIERS from Step 8

### Process
1. **Create Research Plan** for each tenable property:
   - Follow the detailed research checklist in Step 9 above
   - Save as: `06_DEEP_RESEARCH/ResearchPlan_[Address].md`

2. **Prioritize Research Tasks:**
   ```markdown
   ## Research Priority Matrix

   ### HIGH Priority (Must Do)
   - [ ] Title documents (£3-£7, 30 min)
   - [ ] Planning portal search (free, 2 hours)
   - [ ] GDV comparables (free, 1 hour)

   ### MEDIUM Priority (Should Do)
   - [ ] QS build cost estimate (£500, 1 week)
   - [ ] Full constraint search (£200-£500, 1 week)

   ### LOW Priority (Nice to Have)
   - [ ] Planning consultant pre-app (£500-£2k)
   - [ ] Structural survey (£500-£1k)
   ```

3. **Estimate Total Cost/Time:**
   - Basic research: £3-£7, 5-8 hours
   - Full professional: £1.2k-£4k, 10-15 hours

4. **Sequence Research:**
   - Start with HIGH priority tasks for all properties
   - Only commission expensive services for top 3-5 properties

### Output
- Research plans for each tenable property
- Prioritized task lists with time/cost estimates
- Realistic sequencing based on budget constraints

---

## Step 10: Execute Manual Enrichment

### Input
- Research plans from Step 9
- TENABLE DOSSIERS to enrich

### Process
1. **Execute Research Checklist** (in priority order):
   ```markdown
   ## Research Execution Log

   ### Title Documents ✅ COMPLETED
   - **Date:** 2025-11-21
   - **Method:** Land Registry online order
   - **Cost:** £3.50
   - **Time:** 30 minutes
   - **Findings:** [Document key discoveries]

   ### Planning Portal Research ✅ COMPLETED
   - **Date:** 2025-11-21
   - **Method:** Local authority planning portal
   - **Cost:** Free
   - **Time:** 2 hours
   - **Findings:** [5 approvals, 2 refusals, key precedents]

   ### GDV Comparables ✅ COMPLETED
   - **Date:** 2025-11-22
   - **Method:** Rightmove/Zoopla search
   - **Cost:** Free
   - **Time:** 1 hour
   - **Findings:** [10 sales, £/sqft range, market trends]
   ```

2. **Update DOSSIER** as research completed:
   - Enrich sections with real data
   - Replace LLM estimates with verified information
   - Add evidence (title docs, planning screenshots, GDV comps)

3. **Re-evaluate Viability** based on research:
   - Some properties may become non-tenable (showstoppers discovered)
   - Others confirmed viable with realistic numbers
   - Update MSI if new information affects motivation

4. **Update Executive Summary:**
   - Research progress status
   - Properties excluded after deep research
   - Final shortlist with research-backed confidence

### Executive Summary Update
**Add final sections to the consolidated `ExecutiveSummary.md`:**

```markdown
## Stage 6: Deep Research Results

### Final Shortlist Summary
| Geography | Properties Advancing to Owner Approach |
|-----------|---------------------------------------|
| Slough | [Count] |
| Birmingham | [Count] |
| Manchester | [Count] |
| London | [Count] |
| **TOTAL** | **[Final Count]** |

### Properties Excluded in Stage 6 (Deep Research)
1. **[Address]** - Reason: [Title issue / Planning refusal precedent / Unfeasible GDV]
2. **[Address]** - Reason: [Specific research findings]
...

### Deep Research Progress
**Properties Researched:**

| Address | Title Docs | Planning Research | GDV Comps | Constraints | Status |
|---------|------------|-------------------|-----------|-------------|--------|
| [Address] | ✅/⏳/❌ | ✅/⏳/❌ | ✅/⏳/❌ | ✅/⏳/❌ | [Complete] |
...

**Research Findings Summary:**
- Properties confirmed viable: [Count]
- Properties excluded after deep research: [Count]
- Total research cost: £[X]
- Average research time per property: [Y] hours

## Final Project Recommendations

### Overall Assessment
**Total Properties Processed Across All Approaches:**
- Initial: [X]
- After visual exclusion: [Y]
- After LLM analysis: [Z]
- After deep research: [W]
- **Final shortlist for owner approach:** [W]

### Approach Performance Ranking
1. **[Approach A]** - [W] properties advancing ([X]% of processed)
   - Strengths: [Key advantages]
   - Recommended for: [Target scenarios]

2. **[Approach B]** - [Y] properties advancing ([Z]% of processed)
   - Strengths: [Key advantages]
   - Recommended for: [Target scenarios]

### Final Shortlist Properties
**Properties Advancing to Owner Approach:**

1. **[Address], [Postcode]**
   - Motivation Score (MSI): [X]
   - LLM Consensus: [PROCEED / PROCEED WITH CAUTION]
   - Key Strengths: [...]
   - Key Risks: [...]
   - Dossier: `05_SITE_VALIDATION/TENABLE/Dossier_[PropertyAddress].md`
   - Research Plan: `06_DEEP_RESEARCH/ResearchPlan_[PropertyAddress].md`

2. **[Address], [Postcode]**
   - Motivation Score (MSI): [Y]
   - LLM Consensus: [PROCEED / PROCEED WITH CAUTION]
   - Key Strengths: [...]
   - Key Risks: [...]
   - Dossier: `05_SITE_VALIDATION/TENABLE/Dossier_[PropertyAddress].md`
   - Research Plan: `06_DEEP_RESEARCH/ResearchPlan_[PropertyAddress].md`
...

### ROI Projections (Consolidated)
- **Best case:** £[X]M total profit across all approaches
- **Likely case:** £[Y]M total profit
- **Worst case:** £[Z]M total profit
- **Average ROI:** [A]% on invested capital

### Investment Strategy Recommendations
**Top Priority Approaches:**
1. [Approach A] - [Rationale for top ranking]
2. [Approach B] - [Rationale for ranking]

**Capital Allocation Strategy:**
[Recommended approach sequence, capital allocation, timeline]

**Next Steps:**
1. Contact owners of [W] shortlisted properties
2. Begin due diligence on top 3-5 opportunities
3. Secure options on most promising sites
4. Continue monitoring secondary opportunities

---
**Project Complete - Ready for Owner Outreach**
```

---

## Quality Gates (After Each Step)

### Step 1-4: Refinement Complete
- [ ] SearchLand AI output validated
- [ ] Filter parsing issues resolved or documented
- [ ] Results captured across geographies
- [ ] Property screenshots saved (correct naming)
- [ ] Visual exclusions completed
- [ ] LEARNINGS_DATABASE.md updated

### Step 5-8: Site Validation Complete
- [ ] All properties analyzed by 4 LLMs
- [ ] Cross-critique completed
- [ ] DOSSIERS created and populated
- [ ] MSI calculated for all properties
- [ ] Tenable/non-tenable classification complete
- [ ] DOSSIERS organized in folders

### Step 9-10: Deep Research Complete
- [ ] Research plans created for all tenable properties
- [ ] Priority matrix established
- [ ] Research executed (at least basic level)
- [ ] DOSSIERS enriched with real data
- [ ] Final shortlist determined
- [ ] Executive Summary updated with final recommendations

---

## Time & Cost Management

### Per Approach Estimates
- **Step 1-4:** 2-4 hours (refinement & validation)
- **Step 5-8:** 2-6 hours (multi-LLM analysis + dossier creation)
- **Step 9-10:** 5-15 hours per property (research execution)

### Budget Guidelines
- **Basic Research:** £3-£7 per property (title docs only)
- **Essential Research:** £500-£1,000 per property (QS estimate + basic constraints)
- **Full Due Diligence:** £1,200-£4,000 per property (professional consultations)

### Scaling Strategy
1. **Phase 1:** Basic research for all tenable properties
2. **Phase 2:** Essential research for top 50% of properties
3. **Phase 3:** Full due diligence for final shortlist (3-5 properties)

---

## Success Metrics

### Approach-Level Success
- ✅ ≥1 tenable property identified
- ✅ LEARNINGS_DATABASE.md updated with insights
- ✅ Executive Summary complete and professional
- ✅ Process repeatable for future approaches

### Property-Level Success
- ✅ DOSSIER enriched with verified data
- ✅ Viability confirmed through research
- ✅ Investment case financially sound
- ✅ Owner approach strategy defined

### System-Level Success
- ✅ Workflow scales to multiple approaches
- ✅ Documentation supports client delivery
- ✅ Learnings captured for system improvement
- ✅ Professional due diligence standards met

---

## Troubleshooting

### Common Issues

**SearchLand AI Misinterprets Prompt:**
- Solution: Update syntax in LEARNINGS_DATABASE.md, re-test

**0 Results After Validation:**
- Solution: Check geography (PTAL London-only), relax constraints, try different areas

**High Result Count:**
- Solution: Add more restrictive filters, focus on specific postcodes

**LLM Disagreements on Viability:**
- Solution: Cross-critique process, document rationale, use majority consensus

**Research Reveals Showstoppers:**
- Solution: Move to NON_TENABLE folder, document learnings, update Executive Summary

---

## Next Steps After Completion

### Owner Approach (Beyond System Scope)
1. **Review Final Shortlist** - Select 1-3 properties for initial approach
2. **Prepare Approach Strategy** - Letter/email/phone based on DOSSIER insights
3. **Initial Contact** - Express interest, request meetings
4. **Due Diligence** - Continue research if interest shown
5. **Negotiation** - Terms, price, conditions

### System Improvement
1. **Update LEARNINGS_DATABASE.md** - Capture new insights from research
2. **Refine Templates** - Improve based on usage experience
3. **Archive Project** - Move to `projects/archive/` when complete
4. **Start New Project** - Apply learnings to next opportunity

---

## Files Created During Process

```
04_REFINEMENT/
├── ExecutiveSummary.md                     ← Phase 2 (consolidated)
├── Screenshots/
│   ├── ApproachX_SearchLandOutput.jpg      ← Step 1
│   ├── ApproachX_PropertyAddress1.jpg      ← Step 3
│   └── ApproachX_PropertyAddress2.jpg      ← Step 3
└── VALIDATION_LOG.md                       ← Step 2

05_SITE_VALIDATION/
├── TENABLE/                                ← Step 8
│   ├── Dossier_PropertyAddress1.md         ← Step 6
│   └── Dossier_PropertyAddress2.md         ← Step 6
└── NON_TENABLE/                            ← Step 8
    ├── Dossier_PropertyAddress3.md         ← Step 6
    └── Dossier_PropertyAddress4.md         ← Step 8

06_DEEP_RESEARCH/
├── ResearchPlan_PropertyAddress1.md        ← Step 9
├── ResearchPlan_PropertyAddress2.md        ← Step 9
├── EnrichedDossier_PropertyAddress1.md     ← Step 10
└── EnrichedDossier_PropertyAddress2.md     ← Step 10
```

---

**This workflow transforms theoretical approaches into investment-ready opportunities with professional documentation and rigorous due diligence.**

**Ready to execute:** Start with Step 1 for your first approach.

---

**Version:** 5.2  
**Last Updated:** 2025-11-20  
**Status:** Production Workflow
