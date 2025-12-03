OpenAI Codex v0.58.0 (research preview)
--------
workdir: /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/.agents
model: gpt-5.1-codex
provider: openai
approval: never
sandbox: read-only
reasoning effort: medium
reasoning summaries: auto
session id: 019aa1da-be0c-7261-928b-44e438473cf6
--------
user
Read the file at /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/01_DIVERGENT_GENERATION/shared_context.txt and generate 1-3 unique property search strategies based on the requirements. You are an expert property development analyst.
Snapshots disabled: current directory is not a Git repository.

thinking
**Planning file read outside cwd**
exec
bash -lc 'cat /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/01_DIVERGENT_GENERATION/shared_context.txt' in /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/.agents succeeded in 28ms:
# SearchLand Filter Generation - Independent Approach

## Your Task
Generate 1-3 unique property search strategies based on the requirements below.

## Key Constraints
1. **Work Independently:** Do NOT see other LLM outputs. Generate YOUR unique perspective.
2. **Reference Materials:** See FILTER_PATTERNS and LEARNINGS_DATABASE sections below
3. **Technical Validity:** All filters MUST exist in available filters list (see below)
4. **Capital Feasibility:** Approaches MUST meet budget requirements
5. **Precedent Analysis:** MANDATORY - Generate at least ONE filter approach for EACH planning application provided in requirements

**IMPORTANT:** All reference materials are included in this prompt below. Do NOT attempt to read external files.

## Output Format
For each approach, provide:

### Approach [Letter]: [Name]
**Strategic Pattern:** [Which pattern from FILTER_PATTERNS.md]  
**Capital Required:** [Breakdown]  

thinking
**Seeking relevant filter patterns**
exec
bash -lc 'rg -n "FILTER_PATTERNS" -n /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/01_DIVERGENT_GENERATION/shared_context.txt' in /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/.agents succeeded in 79ms:
8:2. **Reference Materials:** See FILTER_PATTERNS and LEARNINGS_DATABASE sections below
19:**Strategic Pattern:** [Which pattern from FILTER_PATTERNS.md]  
79:6. **Diversity**: Generate approaches using DIFFERENT patterns from FILTER_PATTERNS.md
229:**Strategic Pattern:** [Which pattern from FILTER_PATTERNS.md]  
276:**Proven Strategies (23 patterns in FILTER_PATTERNS.md v2.1):**
292:- ✅ 23 patterns in FILTER_PATTERNS.md (v2.1 peer reviewed)
323:## REFERENCE: FILTER_PATTERNS.md
2815:Related: See FILTER_PATTERNS.md → Pattern 2D (Liquidation/Administration Sales)
2854:Related: FILTER_PATTERNS.md → Pattern 8A (Regulation-Driven)
2892:Related: FILTER_PATTERNS.md → Pattern 8B (Lease Expiry Opportunities)
2939:Related: FILTER_PATTERNS.md → Pattern 8C (EPC Compliance Opportunities)
2978:Related: FILTER_PATTERNS.md → Pattern 2E (Never-Sold Legacy Holdings)
3014:Related: FILTER_PATTERNS.md → Pattern 2F (Stale/Passive Holdings)
3059:Related: FILTER_PATTERNS.md → Pattern 9A (Grey Belt Workarounds)
3097:Related: FILTER_PATTERNS.md → Pattern 10A (Renewable Energy Land)
3136:Related: FILTER_PATTERNS.md → Pattern 11A (Strategic Land Promotion)
3186:Related: FILTER_PATTERNS.md → Pattern 10B (Industry-Targeted Solar)
3235:Related: FILTER_PATTERNS.md → Pattern 12A (Traffic-Dependent Commercial)
3283:Related: FILTER_PATTERNS.md → Pattern 10 (Renewable Energy Opportunities)
3341:- See FILTER_PATTERNS.md for proven workarounds

thinking
**Extracting filter pattern section**
exec
bash -lc "sed -n '323,600p' /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/01_DIVERGENT_GENERATION/shared_context.txt" in /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/.agents succeeded in 34ms:
## REFERENCE: FILTER_PATTERNS.md

# Reusable Filter Strategy Patterns

**Version:** v2.1 (Post-Stage 2 Review: Gemini, Codex, Grok)  
**Purpose:** Proven filter strategies that can be adapted across projects  
**Scope:** Strategic approaches, NOT technical implementation (see LEARNINGS_DATABASE.md)  
**Usage:** LLMs should reference these patterns when creating divergent approaches

---

## Pattern Categories

1. **Expired/Stalled Planning Strategies**
2. **Motivated Seller Strategies**
3. **Development Opportunity Strategies**
4. **Low Capital Entry Strategies**
5. **High-Density/Intensification Strategies**
6. **Airspace Development Strategies**
7. **Permitted Development (PDR) Strategies**

thinking
**Planning to retrieve more patterns**
exec
bash -lc "sed -n '600,1200p' /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/01_DIVERGENT_GENERATION/shared_context.txt" in /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/.agents succeeded in 28ms:
---

## 4. Low Capital Entry Strategies

**NOTE:** Enhanced in v2.1 based on Codex review - added concrete filter examples for executability

### Pattern A: Sub-£200k Direct Purchase
```
Strategy: Direct freehold/leasehold purchase under capital limit
Source: User strategy (no direct preset)

Example SearchLand Query:
1. Sales listing price: is less than £200,000
2. Tenure: Freehold
3. Title area (acres): is greater than 0.1 AND less than 0.5
4. Sales listing currently on the market: Yes
5. Use class: Contains "Residential" OR "Mixed"
6. NOT: Flood zone 2, Flood zone 3

Indicators:

thinking
**Requesting more context for filters**
exec
bash -lc "sed -n '1200,1800p' /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/01_DIVERGENT_GENERATION/shared_context.txt" in /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/.agents succeeded in 21ms:
Strengths:
- Policy backing (allocated in plan)
- Lower competition (not yet discovered by housebuilders)
- Can secure option before planning (low capital)
- Planning risk reduced (policy support)

Weaknesses:
- Emerging = not yet adopted (could change)
- Still needs planning permission
- Section 106 obligations likely

Capital requirement:
- Option: £10k-£50k
- Planning costs: £50k-£200k
- Exit to housebuilder at planning stage

Strategy:
1. Identify emerging allocations with no planning
2. Secure option agreement with landowner
3. Apply for planning (first in)

thinking
**Searching for available filters**
exec
bash -lc 'rg -n "AvailableFiltersInSearchLand" /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/01_DIVERGENT_GENERATION/shared_context.txt' in /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/.agents succeeded in 33ms:
76:3. **Filter Names**: Use EXACT names from AvailableFiltersInSearchLand_ACTUAL.md
2360:Solution: Always check AvailableFiltersInSearchLand_ACTUAL.md first
3327:- ALWAYS check AvailableFiltersInSearchLand_ACTUAL.md
4025:**Status:** This replaces theoretical AvailableFiltersInSearchLand.md with ACTUAL capabilities
5516:- **Check against AvailableFiltersInSearchLand_ACTUAL.md**
5532:→ `SearchlandContext/AvailableFiltersInSearchLand_ACTUAL.md` - Real filter list

thinking
**Searching for filters list**
exec
bash -lc 'rg -n "AvailableFiltersInSearchLand_ACTUAL" -n /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/01_DIVERGENT_GENERATION/shared_context.txt' in /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/.agents succeeded in 23ms:
76:3. **Filter Names**: Use EXACT names from AvailableFiltersInSearchLand_ACTUAL.md
2360:Solution: Always check AvailableFiltersInSearchLand_ACTUAL.md first
3327:- ALWAYS check AvailableFiltersInSearchLand_ACTUAL.md
5516:- **Check against AvailableFiltersInSearchLand_ACTUAL.md**
5532:→ `SearchlandContext/AvailableFiltersInSearchLand_ACTUAL.md` - Real filter list

thinking
**Searching for reference section**
exec
bash -lc 'rg -n "SearchLandContext" /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/01_DIVERGENT_GENERATION/shared_context.txt' in /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/.agents exited 1 in 37ms:


thinking
**Considering case sensitivity**
exec
bash -lc 'rg -ni "searchland" /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/01_DIVERGENT_GENERATION/shared_context.txt' in /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/.agents succeeded in 27ms:
1:# SearchLand Filter Generation - Independent Approach
23:**SearchLand AI Prompt:**
63:- **Available Filters List** - Real filters available in SearchLand (see REFERENCE section below)
76:3. **Filter Names**: Use EXACT names from AvailableFiltersInSearchLand_ACTUAL.md
233:**SearchLand AI Prompt (Copy-Paste Ready):**
611:Example SearchLand Query:
635:Example SearchLand Query:
667:Example SearchLand Query:
776:Source: SearchLand Presets #4, #32
790:- SearchLand calculates profit automatically (Preset #4)
821:Source: SearchLand Preset #6
846:Source: SearchLand Preset #31
873:Source: SearchLand Preset #8
875:Pre-calculated by SearchLand:
881:- SearchLand identifies viable sites
901:Source: SearchLand Preset #12
945:Source: SearchLand Presets #17, #41, #46, #66, #68
996:Source: SearchLand Presets #2, #20, #36, #47, #67, #69
1060:Source: SearchLand Presets #7, #43, #44
1114:Source: SearchLand Presets #13, #18, #85, #86

thinking
**Extracting filters list from code**
exec
bash -lc "sed -n '3535,4025p' /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/01_DIVERGENT_GENERATION/shared_context.txt" in /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/.agents succeeded in 28ms:
## REFERENCE: SearchLand Available Filters (CRITICAL - Use ONLY These)

# SearchLand Available Filters - ACTUAL (Verified 2025-01-19)

**Source:** Direct from SearchLand interface (HTML parsed)
**Status:** This is what's ACTUALLY available, not theoretical

---

## Title Basic Information

- Tenure
- Title address
- **Title area (acres)** ⚠️ NOT sqmt - must convert
- Number of addresses
- Ownership type
- Last updated by Land Registry date

## Title Measurements


thinking
**Planning further file inspection**
exec
bash -lc "sed -n '150,320p' /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/01_DIVERGENT_GENERATION/shared_context.txt" in /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/.agents succeeded in 26ms:
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

thinking
**Searching for Type 2 planning details**
exec
bash -lc 'rg -n "Planning Application" /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/01_DIVERGENT_GENERATION/shared_context.txt' in /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/.agents succeeded in 30ms:
86:- [x] **Type 2: Similar Planning Applications**
105:## Type 2: Similar Planning Applications
107:### Planning Application 1:
3579:## Planning Applications

thinking
**Checking code lines around 3579**
exec
bash -lc "sed -n '3500,3605p' /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/01_DIVERGENT_GENERATION/shared_context.txt" in /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/.agents succeeded in 27ms:
- [What was discovered]
- [Why it matters]
- [How to use it]

Example:
1. [Exact filter usage]

Performance/Notes:
- [Any observations]
```
Related: [Link to FILTER_PATTERNS.md if applicable]
```

### Recent Contributions:

**2025-11-19:**
- ✅ "Company status: Liquidation" as strong motivation signal (User: ashsubband)
  - Added to LEARNINGS_DATABASE (line 192)
  - Added Pattern 2D to FILTER_PATTERNS.md
  - Discovered via real SearchLand exploration

thinking
**Reviewing planning application section**
exec
bash -lc "sed -n '3579,3700p' /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/01_DIVERGENT_GENERATION/shared_context.txt" in /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/.agents succeeded in 26ms:
## Planning Applications

- Proposal ✓ (keyword search)
- No. of applications
- Applications in the last 5 years ✓
- Max number of dwellings applied for ✓
- Last application submitted ✓

⚠️ **CRITICAL MISSING:** No "Planning Status" filter (no Expired/Lapsed option)
⚠️ **WORKAROUND:** Must use date ranges + proposal keywords

## Use Class

- Use class ✓
- Property classification ✓
- VOA entry on the title
- VOA property description
- Building use group

## Constraints

thinking
**Extracting application details snippet**
exec
bash -lc "sed -n '100,140p' /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/01_DIVERGENT_GENERATION/shared_context.txt" in /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/.agents succeeded in 28ms:
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

thinking
**Gathering data for strategy crafting**
exec
bash -lc "sed -n '2591,2660p' /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/01_DIVERGENT_GENERATION/shared_context.txt" in /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/.agents succeeded in 24ms:
# SearchLand AI Implementation Learnings Database

**Purpose:** Universal, reusable knowledge about how SearchLand AI actually implements filters
**Scope:** Technical implementation details, NOT geography-specific results
**Status:** Living document - update after each project discovers new behaviors

---

## Filter Syntax & Boolean Logic

### ✅ What Works

**Text Search - AND Logic:**
```
Proposal: contains "mixed-use" AND "storey"
```
- SearchLand AI supports AND within a single text field
- Case-insensitive matching
- Partial word matching (e.g., "storey" matches "8-storey", "multi-storey")


thinking
**Verifying existence of "Company status" filter**
exec
bash -lc 'rg -n "Company status" /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/01_DIVERGENT_GENERATION/shared_context.txt' in /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/.agents succeeded in 32ms:
270:- Company status: Liquidation/Administration = forced sale
509:- Company status: is one of Liquidation (or In Administration)
538:2. Company status: is one of Liquidation
2782:### "Company status" ⚠️ STRONG MOTIVATION SIGNAL
2794:"Company status: is one of Liquidation" = FORCED SALE scenario
2802:2. Company status: is one of Liquidation
3460:- ✅ Found new motivation signals (e.g., "Company status: Liquidation")
3516:- ✅ "Company status: Liquidation" as strong motivation signal (User: ashsubband)
3789:- Company status
5426:- Company status: Liquidation (from user discovery)

thinking
**Verifying presence of Company status filter**
exec
bash -lc "sed -n '3780,3840p' /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/01_DIVERGENT_GENERATION/shared_context.txt'" in /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/.agents exited 2 in 25ms:
bash: -c: line 1: unexpected EOF while looking for matching `''
bash: -c: line 2: syntax error: unexpected end of file

thinking
**Correcting path quoting**
exec
bash -lc "sed -n '3780,3840p' /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/01_DIVERGENT_GENERATION/shared_context.txt" in /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/.agents succeeded in 29ms:
- Company Incorporated Overseas
- Country Incorporated
- SIC codes
- Date added to the register
- Ultimate parent company name
- Ultimate parent company number
- Number of directors at company
- Number of titles owned by company
- Number of mortgages charges associated with company
- Company status

## Sold Price (Price Paid Data)

- **Latest sold price** ✓
- **Latest sold date** ✓
- **Latest price per sqmt** ✓
- Avg sold price in last 5 years ✓
- Number of price paid records on title
- Property type
- Contains new build

thinking
**Checking filter details with sed**
exec
bash -lc "sed -n '3840,3960p' /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/01_DIVERGENT_GENERATION/shared_context.txt" in /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v13/.agents succeeded in 26ms:

- Site allocation type ✓
- Land Availability Assessment (SHLAA) ✓
- In adopted settlement ✓
- In emerging settlement ✓
- Percentage of title in adopted settlement
- Percentage of title in emerging settlement
- Neighbouring Local Planning Authorities of

⚠️ **MISSING:** "Tall Building Policy Zone" NOT a direct filter
⚠️ **MISSING:** "Housing Delivery Test" NOT a filter
⚠️ **WORKAROUND:** Must know geography and filter by authority manually

## Green Belt Review Ratings

- Overall rating of overlapping Green Belt Review
- Setting rating of overlapping Green Belt Review
- Sprawl rating of overlapping Green Belt Review
- Merge rating of overlapping Green Belt Review
- Safeguarding rating of overlapping Green Belt Review

thinking
**Designing three distinct property search strategies**

I’m organizing three unique approaches with precise SearchLand filters, each tied to different development patterns like planning applications, airspace rights, and option agreements. I’m carefully crafting exact filter syntax, expected results, capital breakdowns, plus strengths, limitations, and implementation steps to meet all instructions and highlight strategic rationale and insights from the learnings database.
codex
## Approach A: Approved 8-Storey Precedent Sweep
**Strategic Pattern:** Pattern 3A – Similar Planning Approvals (Development Opportunity)  
**Capital Required:** ~£190k (option £60k, planning & studies £110k, legals £20k)  
**Expected Results:** 15‑25 titles in Slough/Birmingham/Manchester cores

**SearchLand AI Prompt (Copy-Paste Ready):**
```
1. Proposal: contains "mixed-use" AND "storey"
2. Last application submitted: is after 2020-01-01
3. Max number of dwellings applied for: is greater than 40
4. Applications in the last 5 years: is greater than 0 AND less than 4
5. Title area (acres): is greater than 0.2 AND less than 1.2
6. Max building height on title (m): is less than 15
7. Distance to nearest Train Station (m): is less than 800
8. Percentage of title covered by Flood Zone 3: is less than 1
9. Use class: is one of "E - Commercial, Business and Service", "C3 - Dwellinghouses"
10. Sales listing currently on the market: is equal to No
```

**Rationale:** Mirrors the provided 8‑storey approval by targeting titles with recent “mixed-use” + “storey” applications, moderate plots (0.2‑1.2 acres), high dwell counts, and transport-backed cores. Pattern 3A leverages existing policy support; the Learnings DB reminder to keep `Applications in the last 5 years <3` avoids dropping live but stalled schemes. Low existing height (<15m) flags sites where an 8-storey redevelopment meaningfully intensifies value while staying inside PTAL/rail catchments.

**Strengths:**
- Direct precedent targeting aligns with council appetite already demonstrated.
- Low-rise current assets minimise demolition complexity and support airspace massing.
- Rail/PTAL range underwrites absorption and lender comfort.
- Off-market bias (“Sales listing = No”) leaves room for option agreements.

**Limitations:**
- Cannot confirm approval status; requires manual planning check.
- Limited to authorities publishing verbose proposals; rural data thinner.
- Competition higher once applications become public knowledge.
- Requires robust planning/legal review to validate extant consents.

**Implementation Strategy:**  
Validate each result in the LPA portal to confirm approval and Section 106 position, then approach owners with £50‑60k option offers conditional on planning tweaks (parking ratios, façade). Parallel massing and viability studies (c.£110k) refine the 8-storey mix (Class E podium + C3). Once pre-application feedback confirms support, flip option or joint venture with a mid-market residential developer.

**Capital Breakdown:**
- Option premium / exclusivity: £60k  
- Planning, architecture, transport, ESG studies: £110k  
- Legal, surveys, contingencies: £20k  
- **Total:** £190k

---

## Approach B: Flat-Roof Airspace Urban Uplift
**Strategic Pattern:** Pattern 6A – Airspace Development Strategies  
**Capital Required:** ~£180k (airspace rights £80k, structural & design £70k, due diligence £30k)  
**Expected Results:** 18‑30 titles across London PTAL zones plus Birmingham tram corridors

**SearchLand AI Prompt (Copy-Paste Ready):**
```
1. A building in the title has flat roof: is equal to Yes
2. Max building height on title (m): is less than 12
3. Title area (acres): is greater than 0.15 AND less than 0.6
4. Distance to nearest Train Station (m): is less than 500
5. Ownership type: is equal to Company
6. Latest sold date: is before 2013-01-01
7. Percentage of title covered by hard standings: is greater than 30
8. Use class: is one of "E - Commercial, Business and Service"
9. Building on title is inactive: is equal to Yes
10. Percentage of plot un-constrained: is greater than 85
```

**Rationale:** Targets corporate-owned, flat-roofed commercial blocks ripe for vertical extensions, allowing 8-storey mixed-use outcomes via airspace rights—ideal for £200k capital. Long holds plus inactivity signal openness to joint ventures (Pattern 6A). Hardstanding >30% and small plot size maintain urban settings while keeping structural loads predictable. Sub-500m rail access substitutes PTAL where unavailable, aligning with height-friendly policies.

**Strengths:**
- Airspace deals avoid land purchase, stretching the £200k budget.
- Corporate owners familiar with JV/overbuild structures.
- Flat roofs reduce engineering risk and planning objections.
- Minimal constraints accelerate prior approval/Section 73 pathways.

**Limitations:**
- Requires detailed structural survey before exchange.
- Some authorities resist pure airspace schemes above 5‑6 storeys.
- Negotiations can stall if freeholder covenants complex.
- Build cost inflation may squeeze margins without fixed-price contracts.

**Implementation Strategy:**  
Contact company asset managers with proposal for 4‑8 storey rooftop addition in exchange for revenue share. Secure airspace option (~£80k) contingent on feasibility. Commission structural, fire, wind, and rights-of-light packages (~£70k) before submitting planning/roof extension applications referencing existing massing precedents. Package scheme and forward-fund with BTR or PBSA operator once consented.

**Capital Breakdown:**
- Airspace option / initial premium: £80k  
- Structural, fire, façade design & planning fees: £70k  
- Legal, surveys, contingency: £30k  
- **Total:** £180k

---

## Approach C: Distressed Mixed-Use Option Turnarounds
**Strategic Pattern:** Pattern 4B – Option Agreement Candidates (Low Capital Entry) layered with Pattern 2D Liquidation Signals  
**Capital Required:** ~£190k (distress option £50k, re-planning £100k, remediation budgets £40k)  
**Expected Results:** 10‑18 titles UK-wide (Birmingham, Manchester, Slough industrial fringes)

**SearchLand AI Prompt (Copy-Paste Ready):**
```
1. Company status: is one of Liquidation, In Administration
2. Building on title is derelict: is equal to Yes
3. Title area (acres): is greater than 0.25 AND less than 1
4. Distance to nearest Train Station (m): is less than 900
5. Latest sold date: is before 2010-01-01
6. Applications in the last 5 years: is less than 3
7. Percentage of title covered by Flood Zone 3: is less than 1
8. Sales listing currently on the market: is equal to No
9. Use class: is one of "E - Commercial, Business and Service", "Sui Generis"
10. Percentage of title covered by Conservation Areas: is less than 5
```

**Rationale:** Filtering for liquidators/in administration owners (per Learnings DB motivation signal) plus derelict Class E/Sui Generis assets uncovers stalled schemes begging for option-based rescue capital. Plot sizes (0.25‑1 acre) support 8-storey envelopes with podium parking; low application counts show planning fatigue but not total refusal. Nearby rail (<900m) keeps density justifiable. Off-market requirement lets us negotiate option + debt novation to control site with sub-£200k spend.

**Strengths:**
- Forced sellers enable steep discounts and flexible option terms.
- Derelict structures simplify demolition and ESG repositioning.
- Transport adjacency underpins a BTR or co-living exit, supporting £2M profit.
- Low constraint percentages reduce planning risk once scheme refreshed.

**Limitations:**
- Liquidators may insist on accelerated timelines and proof of funds.
- Unknown liabilities (contamination, arrears) can erode returns.
- Must underwrite demolition and holding costs despite option control.
- Planning history may include refusals requiring re-design.

**Implementation Strategy:**  
Engage administrators to secure 12‑18 month option (~£50k) with ability to settle creditors post-consent. Conduct full diligence (environmental, title, utilities) and refresh scheme with community amenities mirroring the precedent (Class E ground + C3 above). Allocate £100k to planning, transport, ESG deliverables, and £40k to remediation/demolition enabling works. Exit by novating option to regional developer post-permission or structure JV with mezzanine partner.

**Capital Breakdown:**
- Option/administration deposit: £50k  
- Planning & consultant team (architecture, transport, ESG, viability): £100k  
- Site surveys, remediation allowance, legal: £40k  
- **Total:** £190k

---

Next steps (optional): 1) Validate sample outputs by spot-checking four random titles per approach to ensure data richness; 2) Prepare outreach templates (option vs. airspace vs. liquidation) before mass contact; 3) Line up planning consultants experienced with tall mid-rise infill to accelerate submissions.
tokens used
59,229
## Approach A: Approved 8-Storey Precedent Sweep
**Strategic Pattern:** Pattern 3A – Similar Planning Approvals (Development Opportunity)  
**Capital Required:** ~£190k (option £60k, planning & studies £110k, legals £20k)  
**Expected Results:** 15‑25 titles in Slough/Birmingham/Manchester cores

**SearchLand AI Prompt (Copy-Paste Ready):**
```
1. Proposal: contains "mixed-use" AND "storey"
2. Last application submitted: is after 2020-01-01
3. Max number of dwellings applied for: is greater than 40
4. Applications in the last 5 years: is greater than 0 AND less than 4
5. Title area (acres): is greater than 0.2 AND less than 1.2
6. Max building height on title (m): is less than 15
7. Distance to nearest Train Station (m): is less than 800
8. Percentage of title covered by Flood Zone 3: is less than 1
9. Use class: is one of "E - Commercial, Business and Service", "C3 - Dwellinghouses"
10. Sales listing currently on the market: is equal to No
```

**Rationale:** Mirrors the provided 8‑storey approval by targeting titles with recent “mixed-use” + “storey” applications, moderate plots (0.2‑1.2 acres), high dwell counts, and transport-backed cores. Pattern 3A leverages existing policy support; the Learnings DB reminder to keep `Applications in the last 5 years <3` avoids dropping live but stalled schemes. Low existing height (<15m) flags sites where an 8-storey redevelopment meaningfully intensifies value while staying inside PTAL/rail catchments.

**Strengths:**
- Direct precedent targeting aligns with council appetite already demonstrated.
- Low-rise current assets minimise demolition complexity and support airspace massing.
- Rail/PTAL range underwrites absorption and lender comfort.
- Off-market bias (“Sales listing = No”) leaves room for option agreements.

**Limitations:**
- Cannot confirm approval status; requires manual planning check.
- Limited to authorities publishing verbose proposals; rural data thinner.
- Competition higher once applications become public knowledge.
- Requires robust planning/legal review to validate extant consents.

**Implementation Strategy:**  
Validate each result in the LPA portal to confirm approval and Section 106 position, then approach owners with £50‑60k option offers conditional on planning tweaks (parking ratios, façade). Parallel massing and viability studies (c.£110k) refine the 8-storey mix (Class E podium + C3). Once pre-application feedback confirms support, flip option or joint venture with a mid-market residential developer.

**Capital Breakdown:**
- Option premium / exclusivity: £60k  
- Planning, architecture, transport, ESG studies: £110k  
- Legal, surveys, contingencies: £20k  
- **Total:** £190k

---

## Approach B: Flat-Roof Airspace Urban Uplift
**Strategic Pattern:** Pattern 6A – Airspace Development Strategies  
**Capital Required:** ~£180k (airspace rights £80k, structural & design £70k, due diligence £30k)  
**Expected Results:** 18‑30 titles across London PTAL zones plus Birmingham tram corridors

**SearchLand AI Prompt (Copy-Paste Ready):**
```
1. A building in the title has flat roof: is equal to Yes
2. Max building height on title (m): is less than 12
3. Title area (acres): is greater than 0.15 AND less than 0.6
4. Distance to nearest Train Station (m): is less than 500
5. Ownership type: is equal to Company
6. Latest sold date: is before 2013-01-01
7. Percentage of title covered by hard standings: is greater than 30
8. Use class: is one of "E - Commercial, Business and Service"
9. Building on title is inactive: is equal to Yes
10. Percentage of plot un-constrained: is greater than 85
```

**Rationale:** Targets corporate-owned, flat-roofed commercial blocks ripe for vertical extensions, allowing 8-storey mixed-use outcomes via airspace rights—ideal for £200k capital. Long holds plus inactivity signal openness to joint ventures (Pattern 6A). Hardstanding >30% and small plot size maintain urban settings while keeping structural loads predictable. Sub-500m rail access substitutes PTAL where unavailable, aligning with height-friendly policies.

**Strengths:**
- Airspace deals avoid land purchase, stretching the £200k budget.
- Corporate owners familiar with JV/overbuild structures.
- Flat roofs reduce engineering risk and planning objections.
- Minimal constraints accelerate prior approval/Section 73 pathways.

**Limitations:**
- Requires detailed structural survey before exchange.
- Some authorities resist pure airspace schemes above 5‑6 storeys.
- Negotiations can stall if freeholder covenants complex.
- Build cost inflation may squeeze margins without fixed-price contracts.

**Implementation Strategy:**  
Contact company asset managers with proposal for 4‑8 storey rooftop addition in exchange for revenue share. Secure airspace option (~£80k) contingent on feasibility. Commission structural, fire, wind, and rights-of-light packages (~£70k) before submitting planning/roof extension applications referencing existing massing precedents. Package scheme and forward-fund with BTR or PBSA operator once consented.

**Capital Breakdown:**
- Airspace option / initial premium: £80k  
- Structural, fire, façade design & planning fees: £70k  
- Legal, surveys, contingency: £30k  
- **Total:** £180k

---

## Approach C: Distressed Mixed-Use Option Turnarounds
**Strategic Pattern:** Pattern 4B – Option Agreement Candidates (Low Capital Entry) layered with Pattern 2D Liquidation Signals  
**Capital Required:** ~£190k (distress option £50k, re-planning £100k, remediation budgets £40k)  
**Expected Results:** 10‑18 titles UK-wide (Birmingham, Manchester, Slough industrial fringes)

**SearchLand AI Prompt (Copy-Paste Ready):**
```
1. Company status: is one of Liquidation, In Administration
2. Building on title is derelict: is equal to Yes
3. Title area (acres): is greater than 0.25 AND less than 1
4. Distance to nearest Train Station (m): is less than 900
5. Latest sold date: is before 2010-01-01
6. Applications in the last 5 years: is less than 3
7. Percentage of title covered by Flood Zone 3: is less than 1
8. Sales listing currently on the market: is equal to No
9. Use class: is one of "E - Commercial, Business and Service", "Sui Generis"
10. Percentage of title covered by Conservation Areas: is less than 5
```

**Rationale:** Filtering for liquidators/in administration owners (per Learnings DB motivation signal) plus derelict Class E/Sui Generis assets uncovers stalled schemes begging for option-based rescue capital. Plot sizes (0.25‑1 acre) support 8-storey envelopes with podium parking; low application counts show planning fatigue but not total refusal. Nearby rail (<900m) keeps density justifiable. Off-market requirement lets us negotiate option + debt novation to control site with sub-£200k spend.

**Strengths:**
- Forced sellers enable steep discounts and flexible option terms.
- Derelict structures simplify demolition and ESG repositioning.
- Transport adjacency underpins a BTR or co-living exit, supporting £2M profit.
- Low constraint percentages reduce planning risk once scheme refreshed.

**Limitations:**
- Liquidators may insist on accelerated timelines and proof of funds.
- Unknown liabilities (contamination, arrears) can erode returns.
- Must underwrite demolition and holding costs despite option control.
- Planning history may include refusals requiring re-design.

**Implementation Strategy:**  
Engage administrators to secure 12‑18 month option (~£50k) with ability to settle creditors post-consent. Conduct full diligence (environmental, title, utilities) and refresh scheme with community amenities mirroring the precedent (Class E ground + C3 above). Allocate £100k to planning, transport, ESG deliverables, and £40k to remediation/demolition enabling works. Exit by novating option to regional developer post-permission or structure JV with mezzanine partner.

**Capital Breakdown:**
- Option/administration deposit: £50k  
- Planning & consultant team (architecture, transport, ESG, viability): £100k  
- Site surveys, remediation allowance, legal: £40k  
- **Total:** £190k

---

Next steps (optional): 1) Validate sample outputs by spot-checking four random titles per approach to ensure data richness; 2) Prepare outreach templates (option vs. airspace vs. liquidation) before mass contact; 3) Line up planning consultants experienced with tall mid-rise infill to accelerate submissions.
