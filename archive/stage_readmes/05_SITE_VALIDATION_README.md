# Stage 5: Site Validation (Multi-LLM Property Analysis)

**Purpose:** Multi-LLM analysis of each property + viability assessment + DOSSIER creation

**Prerequisites:** Stage 4 complete (properties visually screened, screenshots saved)

---

## Workflow: Steps 6-8

### Step 6: Multi-LLM Independent Analysis

**For each property from Stage 4 shortlist:**

1. **Create property data package:**
   - Address, postcode, title area, ownership type
   - Aerial screenshot (`04_REFINEMENT/Screenshots/Approach[X]_[Address].jpg`)
   - SearchLand data (use class, building details, planning history)

2. **Run through all 4 LLMs independently:**
   - Gemini: Strategic viability, market assessment
   - Codex: Technical feasibility, execution details
   - Grok: Timing advantages, arbitrage opportunities
   - Claude: Risk assessment, constraints analysis

3. **LLM Prompt Template:**
```
Analyze this property for [Approach X: Name] targeting £2M profit from £200k capital:

Property: [Address]
Title Area: [X acres]
Ownership: [Type]
Current Use: [Class]
Building Details: [...]
Planning History: [...]

Aerial view: [Describe key features from screenshot]

Assess:
1. Viability (PROCEED / PROCEED WITH CAUTION / DO NOT PURSUE)
2. Key strengths (3-5 points)
3. Key risks (3-5 points)
4. Motivation Scoring Index (MSI calculation)
5. Recommended next actions

Output structured assessment + create DOSSIER draft.
```

4. **Each LLM generates independent DOSSIER** (see `Dossier_Template.md`)

5. **Cross-critique phase:**
   - Each LLM reviews other 3 LLM assessments
   - Identify disagreements (e.g., Gemini says PROCEED, Codex says DO NOT PURSUE)
   - LLMs debate specific points (planning risk, GDV estimate, MSI score)
   - Aim for consensus or document persistent disagreements

6. **Document in Executive Summary:**
   - Per-property LLM verdicts
   - Consensus properties
   - Disagreement properties (with rationale)
   - Properties excluded (with reasons)

---

### Step 7: Mark Tenable vs Non-Tenable

**Create two lists:**

**TENABLE (viable for deep research):**
- ≥3 LLMs rated PROCEED or PROCEED WITH CAUTION
- MSI score ≥5 (motivation sufficient)
- No critical showstoppers (e.g., flood zone 3, listed building constraint)

**NON-TENABLE (rejected):**
- ≥2 LLMs rated DO NOT PURSUE
- MSI score <3 (insufficient motivation)
- Critical showstoppers identified

**Update Executive Summary:**
- Result counts updated (Initial → After visual → After LLM analysis)
- Clear rejection reasons documented
- Consensus level noted (4/4 agreement vs 3/4 split)

---

### Step 8: Organize DOSSIERS into Folders

**Create folder structure:**
```
05_SITE_VALIDATION/
├── TENABLE/
│   ├── Dossier_123HighStreetSlough.md
│   ├── Dossier_456MainRoadBirmingham.md
│   └── ...
└── NON_TENABLE/
    ├── Dossier_789ParkLaneManchester.md (with rejection reason)
    └── ...
```

**Why keep NON_TENABLE dossiers?**
- Learning for future projects
- Document why properties were rejected
- Avoid re-analyzing same properties in future
- Capture insights about what doesn't work

---

## DOSSIER Template

**Use:** `../templates/Dossier_Template.md`

**10 Required Sections:**

1. **Title Details** - Title number, tenure, area, owner, ownership type
2. **Constraints Check** - Flood, conservation, heritage, trees, ecology, covenants
3. **Planning Precedents** - 500m radius approvals, refusals, policy support
4. **Comparable GDV** - Residential & commercial comps within 500m
5. **Market & Financials** - Development scenario, revenue, costs, profit
6. **Risk Matrix** - Planning, constraints, market, motivation, build cost
7. **Motivation Scoring Index (MSI)** - Quantitative score (base 3 + adjustments)
8. **Visual Assessment** - Street view, satellite, site visit required?
9. **Analyst Verdict** - Summary, recommendation, confidence level
10. **Next Actions** - Checklist for deep research

**Stage 5 DOSSIER Status:** Draft (based on LLM analysis + SearchLand data)  
**Stage 6 DOSSIER Status:** Enriched (after manual research)

---

## Motivation Scoring Index (MSI)

**Scoring Model:**

| Factor | Score Adjustment |
|--------|-----------------|
| **Base Score** | 3 |
| Ownership >10 years | +2 |
| Ownership >5 years | +1 |
| Corporate ownership | +1 |
| EPC ≤D | +1 |
| Vacant/Inactive building | +2 |
| Liquidation/Administration | +3 |
| Lease expiry <18 months | +2 |
| No planning activity 5 years | +1 |
| Recent refusal | -2 |
| Active development | -3 |

**MSI Gates:**
- ≥7: High motivation (priority)
- 5-6: Moderate motivation (viable)
- 3-4: Low motivation (marginal)
- <3: Very low motivation (exclude)

**Document in DOSSIER Section 7.**

---

## Quality Gates

**Before proceeding to Stage 6:**

- [ ] All properties analyzed by 4 LLMs
- [ ] Cross-critique completed
- [ ] Consensus documented in Executive Summary
- [ ] TENABLE folder has dossiers for viable properties
- [ ] NON_TENABLE folder has dossiers with rejection reasons
- [ ] Executive Summary updated with Stage 5 results
- [ ] MSI calculated for all tenable properties

---

## Next Stage

**After completing Stage 5:**

Proceed to **Stage 6: Deep Research**

See: `06_DEEP_RESEARCH/README.md`

**Tenable properties from Stage 5 → Deep research plan (Stage 6)**

---

**Estimated Time:** 30-60 min per property × 4 LLMs (can be parallelized)


