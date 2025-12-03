# New Filters Added: v1.0 → v2.1
## FILTER_PATTERNS.md Evolution

**Summary:** 10 new patterns added across 2 peer review stages  
**Stage 1:** Patterns 14-21 (Gemini + Codex review)  
**Stage 2:** Patterns 22-23 (Gemini + Codex + Grok review)

---

## STAGE 1: 8 New Patterns (Gemini + Codex)

### Pattern 14: Legacy Holdings
**Added by:** Gemini (Stage 1)  
**Rationale:** Targets properties held for decades without sale, likely inherited by non-professional owners who are unaware of development potential. Strong motivation for estate planning/equity release.

**SearchLand Filter Criteria:**
```
1. No latest sold date: Yes
2. Ownership type: Private owner
3. Less than 1 application in last 5 years: Yes
4. EPC rating: E, F, or G (optional motivation signal)
5. Title area (acres): >0.5 (optional - larger plots for infill)
```

**Strategic Value:** Low-volume, high-potential leads with below-market pricing potential

---

### Pattern 15: Portfolio Divestment
**Added by:** Gemini (Stage 1)  
**Rationale:** Targets corporate portfolio rationalization where companies divest non-core assets. Professional sellers, bulk deal potential.

**SearchLand Filter Criteria:**
```
1. Ownership type: Company
2. Owner owns multiple properties: Yes (portfolio indicator)
3. Use class: Mixed/diverse (non-core assets)
4. Sales listing currently on the market: Optional
```

**Strategic Value:** Professional negotiation, bulk deals, portfolio discounts

---

### Pattern 16: Brownfield Demolition
**Added by:** Gemini (Stage 1)  
**Rationale:** Former industrial sites with existing structures requiring demolition. Discounted due to demolition costs but high redevelopment potential.

**SearchLand Filter Criteria:**
```
1. Previous use class: Industrial (B1, B2, B8)
2. Building on title status: Derelict OR Inactive
3. Title area: Adequate for redevelopment
4. NOT: Contaminated land (manual check)
5. Check for demolition grants/funding
```

**Strategic Value:** Site remediation expertise, brownfield redevelopment incentives

---

### Pattern 17: Micro-Infill Service Yards
**Added by:** Codex (Stage 1)  
**Rationale:** Small service yards (mechanics, storage) in residential areas suitable for mews/residential conversion. Low capital, volume strategy.

**SearchLand Filter Criteria:**
```
1. Use class: B1, B2, B8, Sui Generis (service/industrial)
2. Title area (sqm): 100-500 (small plots)
3. Surrounded by residential: Manual check (Google Maps)
4. Building on title: Active OR Inactive
5. Check PDR rights for conversion
```

**Strategic Value:** £50k-£200k capital, mews development, volume strategy

---

### Pattern 18: Nutrient Neutrality
**Added by:** Codex (Stage 1)  
**Rationale:** Sites with nutrient neutrality credits/solutions for development in protected catchments (e.g., Solent, Norfolk Broads). Niche geography but unlocks stalled sites.

**SearchLand Filter Criteria:**
```
1. Within nutrient neutrality catchment areas: Manual check
2. Has nutrient neutrality solution: Manual research
3. Planning status: Refused OR Stalled (nutrient issues)
4. Check Natural England guidance
```

**Strategic Value:** Environmental expertise, niche geography, unlocks stalled developments

---

### Pattern 19: Digital Infrastructure
**Added by:** Codex (Stage 1)  
**Rationale:** Telecoms, data centers exploiting permitted development rights. Institutional scale, infrastructure mandates.

**SearchLand Filter Criteria:**
```
1. Use class: Telecommunications (Sui Generis)
2. Title area: Large parcels for data center campus
3. Distance to substation: <200m (power requirements)
4. Check fiber optic infrastructure
5. Planning for data center use
```

**Strategic Value:** £2M-£20M+ institutional scale, infrastructure demand

---

### Pattern 20: Brand Covenant Reposition
**Added by:** Codex (Stage 1)  
**Rationale:** Restrictive covenants expiring/removable on former branded sites (QSR, retail). Covenant swap arbitrage between brands.

**SearchLand Filter Criteria:**
```
1. Previous use: QSR, Retail (branded)
2. Restrictive covenants: Manual title check
3. Covenant expiry: Manual legal research
4. Site characteristics: Drive-thru, parking, high-traffic
5. Approach rival brands for covenant swap
```

**Strategic Value:** £500k-£5M, QSR economics, covenant arbitrage

---

### Pattern 21: Community Asset
**Added by:** Codex (Stage 1)  
**Rationale:** Assets of Community Value (ACV) with expiry windows. Community group interest, JV structures, social value.

**SearchLand Filter Criteria:**
```
1. Listed as Asset of Community Value: Manual check (LPA register)
2. ACV listing expiry: 5-year window approaching
3. Use class: D1, D2 (community uses)
4. Community group interest: Engage early
5. Check Section 106 requirements
```

**Strategic Value:** £500k-£3M, JV structures, social value, senior living

---

## STAGE 2: 2 New Patterns (Gemini + Codex + Grok)

### Pattern 22: HMO Conversion Strategies
**Added by:** Gemini + Grok (Stage 2 - independent consensus)  
**Rationale:** Both reviewers independently identified HMO conversion as a missing pattern. Strong rental yields (5-8% vs. 3-4% BTL), established tenant demand near universities/hospitals.

**SearchLand Filter Criteria (Pattern 22A - University/Hospital Proximity):**
```
1. Existing Use Class: C3 (residential dwelling)
2. Title area (sqm): is greater than 100 AND less than 300
3. Distance to nearest university: less than 1000m
   OR Distance to nearest hospital: less than 1000m
4. Sales listing price: is less than £400,000
5. NOT: Article 4 direction HMO areas (manual check required)
6. Freehold tenure
```

**SearchLand Filter Criteria (Pattern 22B - Transport Hub):**
```
1. Existing Use Class: C3 (residential)
2. Title area (sqm): is greater than 120 AND less than 250
3. Distance to nearest Train Station: less than 500m
4. PTAL: 4, 5, 6a, or 6b (London - OR use train station proxy)
5. Sales listing price: is less than £500,000
6. Freehold tenure
```

**Strategic Value:** 
- Rental yields: 5-8% vs. 3-4% standard BTL
- Capital: £205k-£620k (acquisition + conversion)
- Planning: Often permitted development if <7 occupants
- Exit: Hold for yield OR sell to HMO operator

**Critical Checks:**
- Confirm no Article 4 direction for HMOs
- Check local HMO licensing requirements
- Verify fire safety/building regs compliance

---

### Pattern 23: Unbroken Freehold Titles
**Added by:** Gemini + Codex (Stage 2 - assembly risk concern)  
**Rationale:** Both reviewers highlighted title assembly risk as a major concern. Single-title large parcels eliminate ransom strips, access disputes, and holdout risks.

**SearchLand Filter Criteria (Pattern 23A - Single-Title Large Parcels):**
```
1. Freehold tenure: Yes
2. Title area (acres): is greater than 2 AND less than 20
3. Less than 10% area developed (development potential)
4. Ownership type: Private owner OR Company (single negotiation)
5. NOT: Multiple ownerships on site (manual title check)
6. NOT: Ransom strips (manual diligence)
```

**SearchLand Filter Criteria (Pattern 23B - No Lease Complications):**
```
1. Freehold tenure: Yes
2. NOT: Leasehold interests on site
3. NOT: Ground rent obligations
4. Title area (acres): is greater than 0.5
5. Ownership type: Private owner (direct negotiation)
```

**Strategic Value:**
- **Assembly Risk Elimination:** No ransom strips, access disputes, holdouts
- **Planning Simplification:** Single title = simpler red line boundary
- **Negotiation Efficiency:** One owner, one deal, one legal process
- **Exit Certainty:** Clean title = housebuilders pay premium

**Critical Due Diligence:**
1. Title check: Verify single title number (Land Registry)
2. Access: Confirm no ransom strips
3. Easements: Check restrictive covenants
4. Boundaries: Verify no disputes
5. Planning history: Check previous applications

**Capital:** £500k-£10M+ (or £50k-£200k for option agreements)

---

## SUMMARY STATISTICS

| Metric | v1.0 | v2.1 | Change |
|--------|------|------|--------|
| **Total Patterns** | 13 | 23 | +10 (+77%) |
| **Stage 1 Additions** | - | 8 | Patterns 14-21 |
| **Stage 2 Additions** | - | 2 | Patterns 22-23 |
| **Reviewers** | 0 | 3 | Gemini, Codex, Grok |
| **Document Lines** | 1,493 | 2,263 | +770 (+52%) |

---

## KEY THEMES IN NEW PATTERNS

### Motivation Signals (Patterns 14, 15, 21)
- Legacy holdings (never sold)
- Portfolio divestment (corporate rationalization)
- Community assets (ACV expiry windows)

### Niche Opportunities (Patterns 17, 18, 19, 20)
- Micro-infill service yards (small plots)
- Nutrient neutrality (environmental solutions)
- Digital infrastructure (data centers)
- Brand covenants (QSR arbitrage)

### Risk Mitigation (Patterns 16, 23)
- Brownfield demolition (site remediation)
- Unbroken freehold (assembly risk elimination)

### Operational (Pattern 22)
- HMO conversion (higher yields, established demand)

---

## REVIEWER CONTRIBUTIONS

### Gemini (3 patterns)
- Pattern 14: Legacy Holdings
- Pattern 15: Portfolio Divestment
- Pattern 16: Brownfield Demolition

### Codex (5 patterns)
- Pattern 17: Micro-Infill Service Yards
- Pattern 18: Nutrient Neutrality
- Pattern 19: Digital Infrastructure
- Pattern 20: Brand Covenant Reposition
- Pattern 21: Community Asset

### Gemini + Grok (consensus - 1 pattern)
- Pattern 22: HMO Conversion Strategies

### Gemini + Codex (consensus - 1 pattern)
- Pattern 23: Unbroken Freehold Titles

---

## IMPACT ON SYSTEM

### Pattern Coverage Expansion
- **Before:** 13 patterns covering main strategies
- **After:** 23 patterns covering main + niche + operational strategies
- **Gap Filled:** HMO conversions, assembly risk, micro-infill, environmental

### Execution Quality (Stage 2 Enhancement)
- **Pattern 4 Enhanced:** Added concrete filter examples (was "vague" per Codex)
- **Pattern 13 Elevated:** Repositioned as "HIGHEST ROI" strategy

### Multi-LLM Validation
- **v1.0:** Claude created (no peer review)
- **v2.0:** Validated by Gemini + Codex (Stage 1)
- **v2.1:** Validated by Gemini + Codex + Grok (Stage 2)
- **Total:** 4 LLMs contributed (Claude created, 3 reviewed)

---

**Generated:** 2025-11-20  
**Purpose:** Document new filters added from v1.0 to v2.1 for future reference

