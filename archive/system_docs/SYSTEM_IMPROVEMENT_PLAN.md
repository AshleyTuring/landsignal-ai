# 🎯 SYSTEM IMPROVEMENT PLAN v3.2 → v3.3 (Pre-v5 Run)

**Date:** 2025-11-19  
**Goal:** Improve system BEFORE running MixedUse project v5  
**Status:** Step 1 Ready to Execute

---

## 📋 EXECUTION ORDER (As You Requested)

```
iv) FILTER_PATTERNS.md Review         ← READY TO RUN NOW
    ↓
iii) Update 04_REFINEMENT Process     ← Will create after review
    ↓
ii) Create Executive Summary & Dossier Templates + Add "Based On"
    ↓
i) Archive v4 and Run v5 with all improvements
```

---

## ✅ STEP 1: FILTER_PATTERNS.md PEER REVIEW (READY NOW)

### **What I've Created:**

**Location:** `.system_improvement/` directory

**Files:**
1. `FILTER_PATTERNS_REVIEW_PROMPT.md` - Detailed review instructions for Gemini & Codex
2. `run_filter_patterns_review.sh` - Orchestrates parallel reviews
3. `synthesize_filter_patterns_improvements.sh` - Claude synthesizes feedback
4. `README.md` - Complete workflow documentation

### **What They'll Review:**

**5-Part Review:**
1. **Critique existing 13 patterns** - Clear? Complete? Useful?
2. **Suggest 3-5 new patterns** - What did Claude miss?
3. **Optimize structure** - Tags? Decision trees? Round guides?
4. **Rank patterns by usefulness** - Priority ordering
5. **Integration improvements** - Better workflow integration

### **Run It Now:**

```bash
cd /home/ashsubband/landsignal/.system_improvement
./run_filter_patterns_review.sh
```

**Duration:** 5-10 minutes (Gemini & Codex run in parallel) + 3-5 min iteration (if disagreements)

**Output:**
- `Review_Gemini.md` - Gemini's full review
- `Review_Codex.md` - Codex's full review
- `DISAGREEMENT_ANALYSIS.md` - Automatic disagreement detection
- `Iteration_Gemini.md` - Updated positions (if iteration ran)
- `Iteration_Codex.md` - Updated positions (if iteration ran)

**Then Run:**

```bash
./synthesize_filter_patterns_improvements.sh
```

**Duration:** 5-10 minutes (Claude integrates feedback)

**Output:**
- `SYNTHESIS_OUTPUT.md` - Improved FILTER_PATTERNS.md v2.0 + decision log

**Then:** Manually extract and apply (2 min) - instructions in `.system_improvement/README.md`

---

## ⏳ STEP 2: UPDATE 04_REFINEMENT PROCESS (After Step 1)

### **Your 3-Stage Refinement Workflow:**

**Stage 1: Validate SearchLand AI Setup**
- User provides screenshots of 10 approaches as configured by SearchLand AI
- Assistant validates filters match intended approach
- Fix any parsing issues (wrong units, misinterpreted operators, etc.)

**Stage 2: Initial Testing & Result Capture**
- User runs each approach across geographies (Slough, Birmingham, Manchester, London)
- Assistant captures result counts per approach per geography
- Updates Executive Summary with actual results

**Stage 3: Refinement to Shortlist**
- Diagnose issues (0 results = over-constrained, 500+ = too broad)
- Suggest refinements (relax filters, tighten criteria, fix units)
- Iterate until optimal result range (10-50 properties per approach)
- Final shortlist ready for 05_SITE_VALIDATION

### **Will Create:**

1. `templates/04_REFINEMENT_Template.md` - Step-by-step workflow
2. `templates/04_REFINEMENT_Checklist.md` - Quality gates
3. Update `MASTER_SetupFilters.md` - Document Stage 4 properly

---

## ⏳ STEP 3: CREATE EXECUTIVE SUMMARY & DOSSIER TEMPLATES (After Step 2)

### **Executive Summary Template (Per-Approach Tracking)**

**Your Required Fields:**
```markdown
## Approach X: [Name]

### Key Criteria
[Numbered filter list]

### Expected Results
[Original estimate vs actual across geographies]

### Justification
[Strategic rationale]

### Strengths
[What makes this approach strong]

### Limitations
[Known weaknesses/constraints]

### Recommended Tweaks
[Refinement suggestions from testing]

### Implementation Strategy
[How to execute - option agreement, airspace purchase, direct, etc.]

### Capital Breakdown
[How £200k is deployed]

### Based On
[Preset #X, Pattern #Y - CRITICAL for learning]

### Results Summary
| Geography | Result Count | Quality Notes |
|-----------|--------------|---------------|
| Slough | X | [Notes] |
| Birmingham | Y | [Notes] |
| Manchester | Z | [Notes] |
| London | W | [Notes] |

### Properties Identified
[List of addresses from initial results]

### Properties Removed in Refinement
[Addresses + reasons for removal]

### Final Shortlist
[Addresses advancing to Site Validation]
```

### **Dossier Template (Per-Site Deep Research)**

**Your Required Fields:**
```markdown
# PROPERTY DOSSIER: [Address]

**From Approach:** [Approach #X: Name]
**Date:** [YYYY-MM-DD]
**Analyst:** [Name]
**Status:** [Draft / Under Review / Approved / Rejected]

---

## 1. TITLE DETAILS

**Title Number:** [Get from Land Registry]
**Tenure:** Freehold / Leasehold
**Title Area:** [X acres / Y sqft]
**Current Use:** [Use Class]
**Owner:** [Name - from title or SearchLand]
**Ownership Type:** Company / Private / Charity / etc.
**Acquired:** [Date if available]

---

## 2. CONSTRAINTS CHECK

### Flood Risk
- **Zone 1/2/3:** [X%]
- **Surface Water:** [Low/Medium/High]
- **Assessment:** [Pass/Fail]

### Conservation & Heritage
- **Conservation Area:** [Yes/No - X%]
- **Listed Building:** [Yes/No - Grade]
- **Article 4 Direction:** [Yes/No - restrictions]
- **Assessment:** [Pass/Fail/Requires Mitigation]

### Trees & Ecology
- **TPOs:** [Count if visible]
- **Ancient Woodland:** [Distance]
- **SSSI/SINC:** [Distance]
- **Assessment:** [Pass/Fail]

### Other Constraints
- **Green Belt:** [Yes/No - X%]
- **Section 104/106:** [Check if applicable]
- **Restrictive Covenants:** [Check title]
- **Assessment:** [Pass/Fail]

**Overall Constraint Risk:** LOW / MEDIUM / HIGH

---

## 3. PLANNING PRECEDENTS (500m Radius)

**Method:** Planning portal search, manual review

### Recent Approvals (Similar Scale)
1. **[Application Ref]** - [Address]
   - Proposal: [Description]
   - Decision: Approved [Date]
   - Relevance: [Why similar]

[Repeat for 3-5 key precedents]

### Recent Refusals (Warning Signs)
1. **[Application Ref]** - [Address]
   - Proposal: [Description]
   - Reason for Refusal: [Key reasons]
   - Relevance: [What to avoid]

### Policy Support Assessment
- **Local Plan Policy:** [Relevant policies]
- **Height Policy:** [Tall building zones, HDT, etc.]
- **Density Policy:** [Acceptable densities]
- **Assessment:** STRONG / MODERATE / WEAK

**Planning Risk:** LOW / MEDIUM / HIGH

---

## 4. COMPARABLE GDV RESEARCH

**Method:** Rightmove/Zoopla recent sales within 500m

### Residential Comparables
| Address | Beds | Type | Sale Price | £/sqft | Date |
|---------|------|------|------------|--------|------|
| [Address] | 2 | Flat | £350k | £450 | 2024-01 |
| [Address] | 1 | Flat | £275k | £425 | 2024-03 |
| [Average] | - | - | - | £X/sqft | - |

### Commercial Comparables (if applicable)
| Address | Type | Rent/Sale | £/sqft | Date |
|---------|------|-----------|--------|------|
| [Address] | Retail | £25k/yr | £30 | 2024-02 |
| [Average] | - | - | £X/sqft | - |

**GDV Estimate:** £X.XM (based on £Y/sqft × Z sqft)

---

## 5. MARKET & FINANCIALS

### Development Scenario: [8-Storey Mixed-Use]

**Assumed Build:**
- Ground Floor: [X sqft Class E retail]
- Floors 1-7: [Y units × Z sqft = Total sqft]
- Total GIA: [X sqft]

**Revenue:**
- Residential GDV: £X.XM ([Y units × £Z avg])
- Commercial Capital Value: £X.XM (or hold for income)
- **Total GDV:** £X.XM

**Costs:**
- Site Acquisition: £X (via option/airspace/direct)
- Build Cost: £X ([Y sqft × £Z/sqft])
- Professional Fees: £X (12% of build)
- Finance: £X (2 years × 7% × total cost)
- Sales/Marketing: £X (3% of GDV)
- Contingency: £X (5% of build)
- **Total Cost:** £X.XM

**Profit:**
- **Gross Profit:** £X.XM (GDV - Cost)
- **Profit on Cost:** X% (Profit / Cost)
- **Meets £2M Target?** YES / NO / BORDERLINE

**Capital Deployment:**
- Initial Outlay: £X (option, airspace, deposit)
- Financed: £X (bank debt)
- **Within £200k?** YES / NO

---

## 6. RISK MATRIX & MITIGATIONS

| Risk Category | Level | Mitigations |
|---------------|-------|-------------|
| Planning Risk | [L/M/H] | [Precedent study, pre-app, etc.] |
| Constraint Risk | [L/M/H] | [Survey, specialist advice] |
| Market Risk | [L/M/H] | [Comparable evidence, contingency] |
| Owner Motivation | [L/M/H] | [Motivation scoring - see MSI below] |
| Build Cost Risk | [L/M/H] | [Quantity surveyor, fixed-price contract] |
| Timeline Risk | [L/M/H] | [Realistic program, buffer] |

**Overall Risk:** LOW / MEDIUM / HIGH

---

## 7. MOTIVATION SCORING INDEX (MSI)

**Scoring Model:**
- Base Score: 3
- Ownership >10 years: +2
- Ownership >5 years: +1
- Corporate ownership: +1
- EPC ≤D: +1
- Vacant/Inactive: +2
- Liquidation/Administration: +3
- Lease expiry <18mo: +2
- No planning activity 5y: +1
- Recent refusal: -2
- Active development: -3

**This Site:**
- Base: 3
- [Factor]: +X
- [Factor]: +X
- [Factor]: -X
- **Total MSI:** [Score]

**Gate:** MSI ≥5 before owner contact

**Assessment:** PROCEED / RECONSIDER / DO NOT PURSUE

---

## 8. VISUAL ASSESSMENT

### Street View Observations
[Key observations from Google Street View - condition, access, neighboring properties]

### Satellite Observations
[Key observations from satellite - plot shape, roof type, parking, constraints]

### Site Visit Required?
YES / NO / ALREADY COMPLETED

---

## 9. ANALYST VERDICT

### Summary
[2-3 paragraphs synthesizing all above]

### Recommendation
**PROCEED** / **PROCEED WITH CAUTION** / **DO NOT PURSUE**

### Confidence Level
HIGH / MEDIUM / LOW

### Critical Next Actions
1. [Action 1 - e.g., "Request title documents"]
2. [Action 2 - e.g., "Pre-app meeting with LPA"]
3. [Action 3 - e.g., "Owner outreach via letter"]

---

## 10. NEXT ACTIONS CHECKLIST

- [ ] Obtain title documents (Land Registry)
- [ ] Full constraint search (local authority)
- [ ] Planning precedent deep dive (5-10 applications)
- [ ] GDV validation (estate agent consultation)
- [ ] QS build cost estimate
- [ ] Pre-app meeting (if proceeding)
- [ ] Owner research (Companies House if company)
- [ ] Initial owner contact (if MSI ≥5)
- [ ] Site visit (if high confidence)
- [ ] Financial model detailed (Excel)

---

## APPENDICES

### A. Title Plan
[Image or reference]

### B. Constraint Map
[Image showing overlays]

### C. Planning Precedent Screenshots
[Key approvals/refusals]

### D. Comparable Evidence
[Rightmove/Zoopla screenshots]

---

**Document Version:** 1.0  
**Last Updated:** [Date]  
**Next Review:** [Date + 14 days]
```

### **Will Create:**

1. `templates/ExecutiveSummary_Template.md` - Per-approach tracking
2. `templates/Dossier_Template.md` - Per-site deep research
3. `templates/ApproachValidation_Template.md` - For Stage 1 (validate SearchLand setup)

---

## ⏳ STEP 4: ARCHIVE & RUN V5 (After Step 3)

**Commands:**

```bash
# Archive v4
cd /home/ashsubband/landsignal/projects
mv MixedUse-8Storey-2M-v4 archive/MixedUse-8Storey-2M-v4-preTemplates

# Run v5 with all improvements
cd /home/ashsubband/landsignal
./scripts/new_project.sh MixedUse-8Storey-2M-v5

# Copy improved orchestration scripts
cp -r archive/MixedUse-8Storey-2M-v4-preTemplates/.agents MixedUse-8Storey-2M-v5/

# Update paths in scripts
cd MixedUse-8Storey-2M-v5/.agents
sed -i 's|v4|v5|g' *.sh

# Fill requirements (same as v4)
# [Copy requirements from v4]

# Run collaborative exploration
cd MixedUse-8Storey-2M-v5/.agents
./RUN_ALL.sh
```

**Expected Output:**
- 10 approaches generated with improved FILTER_PATTERNS.md v2.0
- Better "Based On" documentation (preset references clear)
- Validation matrix ready
- **THEN:** Use new templates to document testing process

---

## 🎯 SUCCESS METRICS

**After All 4 Steps:**

✅ **FILTER_PATTERNS.md v2.0:**
- Gemini & Codex feedback integrated
- New patterns added (if gaps existed)
- Structure optimized for all agents
- Decision rationale documented

✅ **04_REFINEMENT Process:**
- 3-stage workflow clearly defined
- Templates for each stage
- Quality gates established

✅ **Executive Summary Template:**
- All 11+ fields you requested
- "Based On" preset/pattern references
- Result tracking per geography
- Refinement documentation

✅ **Dossier Template:**
- All 14+ fields you requested
- Motivation Scoring Index
- Visual assessment guidance
- Next actions checklist

✅ **v5 Run:**
- Generated with improved system
- Ready for testing with proper templates
- Client-deliverable documents from start
- Learnings captured systematically

---

## 📊 CURRENT STATUS

**Step 1: FILTER_PATTERNS.md Review** ← **YOU ARE HERE**
- ✅ Review prompt created
- ✅ Orchestration scripts ready
- ✅ Workflow documented
- ⏳ **READY TO RUN** (awaiting your execution)

**Next Steps:**
1. Run `.system_improvement/run_filter_patterns_review.sh`
2. Wait for Gemini & Codex reviews (5-10 min)
3. Run `.system_improvement/synthesize_filter_patterns_improvements.sh`
4. Apply improvements (manual extraction)
5. Move to Step 2 (04_REFINEMENT)

---

## ⚡ QUICK START

**To begin improvement process NOW:**

```bash
cd /home/ashsubband/landsignal/.system_improvement
./run_filter_patterns_review.sh
```

**This will kick off the entire improvement workflow!**

---

**Questions? See:** `.system_improvement/README.md` for detailed workflow documentation

**Status:** Step 1 ready to execute ✅  
**Your approval needed to:** Run peer review scripts

