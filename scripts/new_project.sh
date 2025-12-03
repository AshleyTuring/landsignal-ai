#!/bin/bash

# SearchLand Filter Project Setup Script - v5.2
# Creates new project with multi-LLM independent generation + iterative convergence

set -e

echo "=========================================="
echo "  SearchLand Filter Project Setup v5.2"
echo "  Multi-LLM Independent Generation"
echo "=========================================="
echo ""

# Get project name
if [ -z "$1" ]; then
    echo "Project name: "
    read PROJECT_NAME
    if [ -z "$PROJECT_NAME" ]; then
        echo "❌ Project name required"
        exit 1
    fi
else
    PROJECT_NAME="$1"
fi

cd /home/ashsubband/landsignal

# Check if project already exists
if [ -d "projects/$PROJECT_NAME" ]; then
    echo "❌ Project 'projects/$PROJECT_NAME' already exists!"
    echo ""
    echo "Options:"
    echo "  1. Choose a different name"
    echo "  2. Delete existing: rm -rf projects/$PROJECT_NAME"
    exit 1
fi

# Create project structure
echo "Creating project structure..."
mkdir -p "projects/$PROJECT_NAME/00_REQUIREMENTS"
mkdir -p "projects/$PROJECT_NAME/01_DIVERGENT_GENERATION"
mkdir -p "projects/$PROJECT_NAME/02_VALIDITY_CHECK"
mkdir -p "projects/$PROJECT_NAME/03_PARALLEL_TESTING"
mkdir -p "projects/$PROJECT_NAME/04_REFINEMENT"
mkdir -p "projects/$PROJECT_NAME/05_SITE_VALIDATION"
mkdir -p "projects/$PROJECT_NAME/06_DEEP_RESEARCH"

# Copy orchestration scripts (v5.2)
echo "Copying v5.2 orchestration scripts..."
cp -r templates/.agents_v5 "projects/$PROJECT_NAME/.agents_v5"

# Copy templates
cp templates/Requirements.md "projects/$PROJECT_NAME/00_REQUIREMENTS/"

# Create IterationLog in divergent generation folder
cat > "projects/$PROJECT_NAME/01_DIVERGENT_GENERATION/IterationLog.md" << 'ENDOF'
# Divergent Approach Generation Log

**Project:** [PROJECT_NAME]
**Date:** [DATE]

---

## Generation Process

### Gemini Approaches
**Generated:** [DATE/TIME]
- **Approach A:** [Name] - `ApproachA_Gemini_[Name].md`
- **Approach B:** [Name] - `ApproachB_Gemini_[Name].md`

**Key Insights:**
- [What creative angles did Gemini explore?]

---

### Codex Approaches
**Generated:** [DATE/TIME]
- **Approach C:** [Name] - `ApproachC_Codex_[Name].md`
- **Approach D:** [Name] - `ApproachD_Codex_[Name].md`

**Key Insights:**
- [What technical angles did Codex explore?]

---

### Claude Approaches
**Generated:** [DATE/TIME]
- **Approach E:** [Name] - `ApproachE_Claude_[Name].md`
- **Approach F:** [Name] - `ApproachF_Claude_[Name].md` (if applicable)

**Key Insights:**
- [What strategic angles did Claude explore?]

---

## Diversity Analysis

**How different are the approaches?**
- [ ] Multiple strategies represented (e.g., stalled planning vs airspace vs motivated seller)
- [ ] Different capital deployment models
- [ ] Different risk profiles
- [ ] Different geographies/filters

**Overlap/Similarity:**
[Note any approaches that are too similar - may want to generate alternatives]

---

## Next Step

Proceed to Stage 2: Validity Check (`02_VALIDITY_CHECK/ValidationMatrix.md`)
ENDOF

# Note: ValidationMatrix and RejectedApproaches are legacy files from v5.0-v5.1
# v5.2+ uses automated multi-LLM validation in Round[X]/Critiques/
# Validation matrix is included in SYNTHESIS_OUTPUT.md

# Create ComparativeAnalysis template
cat > "projects/$PROJECT_NAME/03_PARALLEL_TESTING/ComparativeAnalysis.md" << 'ENDOF'
# Comparative Analysis: All Tested Approaches

**Project:** [PROJECT_NAME]
**Date:** [DATE]
**Approaches Tested:** [List]

---

## Results Summary

| Approach | [LPA1] | [LPA2] | [LPA3] | UK-Wide Est. | Status |
|----------|--------|--------|--------|--------------|---------|
| [X]: [Name] | [count] | [count] | [count] | [estimate] | [TOO RESTRICTIVE/OPTIMAL/TOO BROAD] |
| [X]: [Name] | [count] | [count] | [count] | [estimate] | [Status] |
| [X]: [Name] | [count] | [count] | [count] | [estimate] | [Status] |

**Result Count Interpretation:**
- **0-10:** TOO RESTRICTIVE (may need refinement)
- **10-50:** OPTIMAL (targeted search)
- **50-200:** GOOD (broader search, more screening required)
- **200+:** TOO BROAD (needs narrowing)

---

## Winner: Approach [X] - [Name]

**Why This Approach Won:**
- Result count: [X] properties in target LPA (optimal range)
- Geographic consistency: [performs across multiple markets / London-specific / etc.]
- Capital alignment: [fits budget / requires creative structure]
- Profit pathway: [clear route to target profit]
- Quality of results: [properties match requirements well]

**Sample Properties from Winner:**
1. [Brief description of property 1]
2. [Brief description of property 2]
3. [Brief description of property 3]

**Next Steps:**
1. Export full results from SearchLand
2. Proceed to Stage 5: Site Validation
3. Screen properties against ValidationCriteria.md
4. Deep research on top 3-5 candidates

---

## Runner-Up: Approach [X] - [Name]

**Why Runner-Up:**
- [Slightly fewer results / different property profile / backup strategy / etc.]

**Use Case:**
[When would you use this instead of the winner?]

---

## Failed Approaches

### Approach [X]: [Name] - TOO RESTRICTIVE
- **Result count:** [0-5 across all LPAs]
- **Issue:** [Identify specific filter(s) causing excessive restriction]
- **Learning:** [What did we discover? Update LEARNINGS_DATABASE?]
- **Refinement Potential:** [Can this be fixed? How?]

### Approach [X]: [Name] - TOO BROAD
- **Result count:** [500+ across all LPAs]
- **Issue:** [Not targeted enough / missing key filters]
- **Refinement Potential:** [Add what constraints?]

---

## Geographic Insights

**Market Variations:**
- **[LPA1] characteristics:** [e.g., Higher prices, fewer derelict sites]
- **[LPA2] characteristics:** [e.g., More corporate ownership, stalled developments]
- **[LPA3] characteristics:** [e.g., Lower prices, more options at budget]

**Filter Performance by Geography:**
| Filter/Strategy | London | Midlands | North | Scotland |
|----------------|--------|----------|-------|----------|
| PTAL filters | Works | N/A | N/A | N/A |
| £200k price cap | 0 results | Few | Moderate | Better |
| Derelict status | Rare | Moderate | Common | Common |

---

## Capital Strategy Validation

**Approaches by Capital Model:**

### Direct Purchase (<£200k):
- **Approach [X]:** [result count] - [viable / too restrictive]
- **Finding:** [Is direct purchase realistic at this budget?]

### Option Agreements (£20k-£50k):
- **Approach [X]:** [result count] - [viable / too restrictive]
- **Finding:** [Suitable sites for option strategy?]

### Airspace/Rights (£50k-£150k):
- **Approach [X]:** [result count] - [viable / too restrictive]
- **Finding:** [Flat roof buildings available?]

### Creative Finance:
- **Approach [X]:** [result count] - [viable / too restrictive]
- **Finding:** [Vendor finance / JV opportunities?]

---

## Profit Pathway Validation

**Can target profit be achieved?**

**Approach [X] (Winner):**
- Typical acquisition: £[X]
- Planning/build costs: £[X]
- Target GDV: £[X]
- **Projected profit:** £[X]
- **Achieves goal:** [Yes / No / Marginal]

---

## Refinement Recommendations

### High Priority (Do Now):
1. **Refine Approach [X]:** [Specific changes] → Retest
2. **Test Approach [X] variant:** [What variation to try?]

### Medium Priority (Consider):
1. **Geographic focus:** [Should we focus on specific regions?]
2. **Capital model shift:** [Should we pivot strategy?]

### Low Priority (Future):
1. [Ideas for future exploration]

---

## Learnings for LEARNINGS_DATABASE.md

**New Universal Insights:**
- [Filter behavior 1]
- [Syntax issue 1]
- [Geographic limitation 1]

**Patterns Confirmed:**
- [Existing pattern 1 validated again]

---

## Decision

**Primary Strategy:** Approach [X] - [Name]
**Backup Strategy:** Approach [X] - [Name]
**Proceed to:** Stage 5 - Site Validation

---

**Date:** [DATE]
**Status:** Testing Complete → Proceed to Validation
ENDOF

# Create site validation template
cat > "projects/$PROJECT_NAME/05_SITE_VALIDATION/ValidationCriteria.md" << 'ENDOF'
# Site Validation Criteria

**Project:** [PROJECT_NAME]
**Purpose:** Screen SearchLand results for red flags before deep research

---

## Automatic Rejections (Red Flags)

### Environmental/Planning Constraints:
❌ Flood Zone 3 coverage >50%
❌ Green Belt coverage >50% (unless allocated site)
❌ Ancient Woodland on site
❌ SSSI (Site of Special Scientific Interest) on site
❌ Active Listed Building constraints on development plot
❌ Scheduled Monument on site

### Physical Constraints:
❌ No vehicle access (and cannot be created)
❌ Overhead high-voltage power lines directly across buildable area
❌ Railway line through middle of site
❌ Contaminated land (without viable remediation)

### Legal/Tenure Constraints:
❌ Active leases with >20 years remaining (blocks redevelopment)
❌ Multiple freeholders with no agreement mechanism
❌ Ransom strips blocking access
❌ Section 106 obligations that kill viability

---

## Investigation Required (Amber Flags)

### Planning:
⚠️ TPO (Tree Preservation Orders) affecting >10% of site
⚠️ Conservation Area (need design sensitivity)
⚠️ Article 4 Directions (limits PDR)
⚠️ Previous planning refusals (understand reasons)
⚠️ Local opposition history

### Environmental:
⚠️ Flood Zone 2 (manageable with mitigation)
⚠️ Contaminated land history (needs assessment)
⚠️ Protected species likely (surveys required)
⚠️ Air quality issues

### Access/Infrastructure:
⚠️ Poor road access (narrow lanes, weight restrictions)
⚠️ Substation capacity issues (red/amber rated)
⚠️ Drainage/sewage capacity constraints
⚠️ Proximity to noise sources (railway, motorway, airport)

### Tenure:
⚠️ Leasehold with onerous conditions
⚠️ Multiple titles need assembly
⚠️ Rights of way across site
⚠️ Restrictive covenants

---

## Positive Signals (Green Flags)

### Planning:
✅ Existing planning permission (even if expired)
✅ SHLAA allocation (housing land availability)
✅ Site allocated in local plan
✅ Recent similar approvals in immediate area
✅ Supportive planning policy (tall building zones, densification)
✅ Pre-application advice positive

### Ownership/Motivation:
✅ Corporate ownership (easier negotiation than individual)
✅ Derelict/inactive building (motivated seller signal)
✅ Long hold period (non-core asset)
✅ Listed for sale (active motivation)
✅ Bank/receiver ownership (distressed sale)

### Site Characteristics:
✅ Flat roof (airspace potential)
✅ Good transport links (PTAL 4-6b or <500m train station)
✅ Low current density (redevelopment upside)
✅ Ample plot size (not over-constrained)
✅ Existing utilities on site

### Market:
✅ Strong comparable sales nearby
✅ High rental demand (residential or commercial)
✅ Regeneration area (rising values)
✅ Low supply of similar product

---

## Scoring System

For each property, assign:
- **Red flags:** -10 points each (consider rejection)
- **Amber flags:** -2 points each (needs investigation)
- **Green flags:** +3 points each (positive signal)

**Score Interpretation:**
- **>10 points:** HIGH PRIORITY (few concerns, strong signals)
- **0-10 points:** MEDIUM PRIORITY (balanced, investigate ambers)
- **-5 to 0 points:** LOW PRIORITY (concerns outweigh positives)
- **<-5 points:** REJECT (too many red flags)

---

## Screening Process

### Step 1: Quick Reject (5 min per property)
Scan SearchLand data for automatic rejection criteria
→ Reject immediately if any red flags present (unless exceptional circumstances)

### Step 2: Flag Amber Issues (10 min per property)
Identify all investigation-required items
→ Assign priority based on number/severity of ambers

### Step 3: Score Positives (5 min per property)
Count green flag signals
→ Calculate total score

### Step 4: Rank (5 min total)
Sort properties by score
→ Top 5-10 proceed to deep research

---

## Output Format

Create `ScreeningResults.md`:

| Property | Title No. | Score | Red | Amber | Green | Priority | Notes |
|----------|-----------|-------|-----|-------|-------|----------|-------|
| [Address] | TN123 | +12 | 0 | 2 | 6 | HIGH | Corporate owner, existing planning |
| [Address] | TN456 | +5 | 0 | 4 | 5 | MEDIUM | TPOs, access issues |
| [Address] | TN789 | -3 | 1 | 3 | 2 | LOW | Flood Zone 2, poor access |
| [Address] | TN012 | -15 | 2 | 5 | 1 | REJECT | Green Belt + Listed Building |

---

**Next Step:** Deep research top 5 properties (Stage 6)
ENDOF

# Create PROJECT_SUMMARY template
cat > "projects/$PROJECT_NAME/PROJECT_SUMMARY.md" << 'ENDOF'
# Project Summary: [PROJECT_NAME]

**Created:** [DATE]
**Status:** [In Progress / Testing / Complete]
**System Version:** 3.0

---

## Requirements Summary

**Target Profit:** £[X]
**Capital Outlay:** £[X]
**Property Type:** [Type]
**Geography:** [Primary + Secondary]

**Key Constraints:**
- [Constraint 1]
- [Constraint 2]

---

## Divergent Approaches Generated

| Approach | LLM | Strategy | Status |
|----------|-----|----------|--------|
| A | Gemini | [Name] | [Valid/Invalid/Tested/Winner/etc.] |
| B | Gemini | [Name] | [Status] |
| C | Codex | [Name] | [Status] |
| D | Codex | [Name] | [Status] |
| E | Claude | [Name] | [Status] |
| F | Claude | [Name] | [Status] |

---

## Validation Results

**Valid Approaches:** [X/6]
**Rejected:** [X/6]

**Common Issues:**
- [Issue pattern 1]

---

## Testing Results

**Approaches Tested:** [X]
**Winner:** Approach [X] - [Name]
**Runner-Up:** Approach [X] - [Name]

**Result Counts (Target LPA):**
- Winner: [X] properties
- Runner-up: [X] properties

---

## Site Validation

**Properties Screened:** [X]
**Shortlisted:** [X]
**Rejected:** [X]

**Top 3 Candidates:**
1. [Address] - [Title No.] - Score: [X]
2. [Address] - [Title No.] - Score: [X]
3. [Address] - [Title No.] - Score: [X]

---

## Deep Research Status

| Property | Title No. | Status | Recommendation |
|----------|-----------|--------|----------------|
| [Address] | TN123 | [Complete/In Progress] | [GO / NO-GO / MORE INFO] |
| [Address] | TN456 | [Status] | [Recommendation] |

---

## Key Learnings

**For LEARNINGS_DATABASE.md:**
- [Universal learning 1]
- [Universal learning 2]

**Project-Specific Insights:**
- [Insight 1]
- [Insight 2]

---

## Final Recommendation

**Proceed with:** [Property address / Approach X / None - refine requirements]

**Rationale:**
[Brief explanation]

**Next Steps:**
1. [Action 1]
2. [Action 2]
3. [Action 3]

---

## Timeline

- **Requirements:** [Date]
- **Divergent Generation:** [Date]
- **Validation:** [Date]
- **Testing:** [Date]
- **Site Screening:** [Date]
- **Deep Research:** [Date - Date]
- **Final Decision:** [Date]

**Total Duration:** [X weeks]

---

**Status:** [In Progress / Complete]
**Last Updated:** [DATE]
ENDOF

# Create PROJECT_INFO metadata
cat > "projects/$PROJECT_NAME/PROJECT_INFO.md" << ENDOF
# Project: $PROJECT_NAME

**Created:** $(date +%Y-%m-%d)
**System Version:** 3.0 (Divergent Hypothesis Testing)
**Status:** Requirements Gathering

---

## Quick Summary

[One sentence description - to be filled]

---

## Requirements Overview

**Target Profit:** £[to be filled]
**Capital Outlay:** £[to be filled]
**Property Type:** [to be filled]

---

## Progress Tracker

- [ ] Stage 0: Requirements defined
- [ ] Stage 1: Divergent approaches generated (4-6 approaches)
- [ ] Stage 2: Technical validation complete
- [ ] Stage 3: Parallel testing complete
- [ ] Stage 4: Learnings captured
- [ ] Stage 5: Site validation complete
- [ ] Stage 6: Deep research complete

---

## Key Dates

- **Created:** $(date +%Y-%m-%d)
- **Requirements Complete:** [TBD]
- **Testing Complete:** [TBD]
- **Final Decision:** [TBD]

---

## Reference

- **Requirements:** \`00_REQUIREMENTS/Requirements.md\`
- **Approaches:** \`01_DIVERGENT_GENERATION/\`
- **Results:** \`03_PARALLEL_TESTING/ComparativeAnalysis.md\`
- **Summary:** \`PROJECT_SUMMARY.md\`
ENDOF

echo "✅ Project created: projects/$PROJECT_NAME/"
echo ""
echo "📁 Structure created:"
echo "   00_REQUIREMENTS/        (Edit Requirements.md FIRST)"
echo "   01_DIVERGENT_GENERATION/ (4 LLMs generate independently)"
echo "   02_VALIDITY_CHECK/      (Cross-validation + iteration)"
echo "   03_PARALLEL_TESTING/    (Ready-to-test approaches)"
echo "   04_REFINEMENT/          (Stage 4: Refinement & validation)"
echo "   05_SITE_VALIDATION/     (Stage 5: Multi-LLM property screening)"
echo "   06_DEEP_RESEARCH/       (Stage 6: Deep dive on top candidates)"
echo "   .agents_v5/             (v5.2 orchestration scripts)"
echo ""
echo "🔄 Next steps:"
echo "1. cd projects/$PROJECT_NAME"
echo "2. Edit 00_REQUIREMENTS/Requirements.md with full details"
echo "3. Run multi-LLM system:"
echo "   cd .agents_v5"
echo "   ./RUN_ALL_ITERATIVE_v5.sh  (recommended - loops until convergence)"
echo "   OR"
echo "   ./RUN_ALL_v5.sh            (single-pass - faster for testing)"
echo ""
echo "⚡ System Features (v5.2):"
echo "   - 4 real LLM CLIs: Gemini, Codex, Grok, Claude"
echo "   - Independent generation (identical prompts, natural divergence)"
echo "   - Cross-validation + iterative convergence"
echo "   - Automatic Executive Summary creation"
echo "   - Complete Stage 4-6 workflow"
echo ""
echo "📖 Documentation:"
echo "   - README.md (system overview)"
echo "   - REPEATABLE_PROPERTY_WORKFLOW.md (10-step process)"
echo "   - .agents_v5/README_ITERATION.md (when to use each script)"
echo "   - CHANGELOG.md (version history)"
echo ""
echo "🎯 System Version: 5.2 (Independent Generation + Iterative Convergence)"