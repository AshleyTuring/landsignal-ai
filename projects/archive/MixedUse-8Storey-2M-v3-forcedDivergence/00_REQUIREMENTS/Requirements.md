# Filter Requirements

**Project:** MixedUse-8Storey-2M-v3  
**Date:** 2025-11-19  
**Status:** Requirements Complete  
**System Version:** 3.1 (Divergent Hypothesis Testing + Preset Analysis)

---

## Global Context

**You are an expert UK property analyst and power user of SearchLand.co.uk**

You have been tasked with creating SearchLand filters based on user requirements through **divergent hypothesis testing**.

### Available Resources:
- `/SearchlandContext/AvailableFiltersInSearchLand_ACTUAL.md` - **USE ONLY THIS** - Real filters available
- `/SearchlandContext/PresetFiltersBuiltIntoSearchLand.md` - 86 expert presets (reference)
- `/LEARNINGS_DATABASE.md` - Universal implementation behaviors (16+ motivation signals!)
- `/FILTER_PATTERNS.md` - 35 reusable strategies (12 categories)
- `/PRESET_STRATEGY_GUIDE.md` - **NEW!** Comprehensive guide to all 86 presets

### CRITICAL RULES:
1. **Output Format**: Use STRUCTURED LIST FORMAT ONLY (not prose)
   - Example: `1. Title area (acres): is greater than 0.198 AND less than 2.47`
   - NOT: "Look for properties between 8,000-100,000 sqft"
2. **Units**: Use acres/sqft/metres (as shown in ACTUAL filters)
3. **Filter Names**: Use EXACT names from AvailableFiltersInSearchLand_ACTUAL.md
4. **No Assumptions**: If a filter doesn't exist, propose proxy filters
5. **Divergent Generation**: Create MULTIPLE diverse approaches, not one consensus
6. **Use Preset Insights**: Reference PRESET_STRATEGY_GUIDE.md for proven strategies

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

**Location:** [User to specify - e.g., Slough, Birmingham, etc.]  
**Decision:** Approved (assumed - user to confirm)  
**Decision Date:** [User to provide if known]

**Key Success Factors to Analyze:**
- **Development Type:** 8-storey mixed-use (Class E ground + C3 residential above)
- **Scale:** Substantial height (25-35m), multi-unit residential
- **Use Class Mix:** Flexible retail/commercial ground floor + residential above
- **Amenity:** Communal terraces, cycle parking, accessible parking
- **Policy Support:** Must have been in area supporting tall buildings/densification

**Implicit Filters to Extract:**
- Title area: Likely 0.2-2 acres (large enough for 8-storey with parking/amenity)
- Height potential: Building height <15m OR permission for 25-35m additions
- Use classes: E or previous commercial + permission for residential
- Transport: Likely <800m train OR PTAL 4+ (supports density)
- Constraints: Zero flood zone 3, minimal conservation areas
- Planning policy: Tall building zone OR opportunity area OR HDT

---

### Planning Application 2 (Optional):
[User to provide if they have additional examples]

---

### Analysis Guidance for Agents:

**MANDATORY: At least ONE agent must create a precedent-based approach that:**

1. **Analyzes this application** for what made it approvable
2. **Extracts success criteria:**
   - 8-storey = need 25-35m height potential
   - Mixed-use = need commercial ground + residential permission
   - Good transport = PTAL 4+ (London) or <800m train (rest of UK)
   - Urban location = supports densification policy
   - No major constraints = avoid flood, conservation, green belt

3. **Creates filters to find similar sites:**
   - Where 8-storey mixed-use has been approved recently (2020+)
   - OR where site characteristics match (area, height, transport, policy)
   - OR adjacent to approved schemes (precedent proximity)

4. **Strategy:** Replicate success conditions, not just keywords

---

### Additional Context:
- Geographic area: UK-wide, urban areas with high PTAL (London) or good transport (rest of UK)
- Scale preferences: Same size or larger (8+ storeys = 25-35m)
- Must-have features: Mixed-use potential (E+C3), substantial height capability
- Nice-to-have features: Existing planning (even expired), flat roofs (airspace), corporate ownership
- Exclusions: Heavy constraints (Flood zone 3, Green Belt without exceptions)

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
- Multiple diverse strategies preferred (test 4-6 approaches)
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

## Strategic Guidance (NEW - v3.1 System)

### Potential Approaches to Explore:

Based on PRESET_STRATEGY_GUIDE.md and FILTER_PATTERNS.md, consider these DIVERSE strategies:

**Regulation-Driven:**
- Pattern 8A: HMO Expired Licenses (Preset #12) - forced sale
- Pattern 8B: Lease Expiry (Presets #17, #46, #66) - income cliff
- Pattern 8C: EPC Compliance (Presets #2, #20, #69) - cannot rent

**Airspace Development:**
- Pattern 6A: Flat Roof + Height Headroom (Presets #22-#25)
- Preset #23: Commercial no resi (add 8 storeys above)

**Stalled Planning:**
- Pattern 1A: Old Planning + No Activity (with proxy filters)
- Combine with liquidation (discovered by ashsubband!)

**Grey Belt:**
- Pattern 9A: Previously Developed in GB (Presets #7, #44)
- Hardstanding >25% + edge of settlement

**Strategic Land:**
- Pattern 11A: Emerging Allocations (Preset #38) - first mover
- Pattern 11B: Edge of Settlement (Presets #18, #85)

**Corporate Distress:**
- Pattern 2D: Liquidation Sales (User discovery + presets)
- Combine with Pattern 8B: Lease expiry = double motivation

### Expected Diverse Approaches (4-6):

LLMs should generate approaches from DIFFERENT categories:
1. One regulation-driven (HMO/Lease/EPC)
2. One airspace development (flat roofs)
3. One stalled planning (proxy filters)
4. One strategic land/edge (promotion)
5. One corporate distress (liquidation + others)
6. Creative variant (combination)

**DO NOT** generate 6 similar approaches! Explore different strategic angles.

---

## Notes

**System Version:** 3.1 (Preset Analysis Complete)
- **v1 (archived):** Single convergent approach (0 results)
- **v2 (archived):** Refined convergence (validated structured output)
- **v3.1 (current):** Divergent generation + 86 preset insights + 16 motivation signals

**New Knowledge Since v2:**
- 11 additional motivation signals (HMO licenses, lease expiry, hardstanding, etc.)
- 6 new pattern categories (7-12 from 86 presets)
- 18 new proven strategies
- Commercial viability thresholds (footfall, vehicles)
- Energy project criteria (ag grades, substations)
- Green Belt workarounds (previously developed)
- Strategic land indicators (SHLAA, emerging allocations)

**Key Learnings Applied:**
- "Applications in last 5 years = 0" too restrictive (try "< 3")
- £200k direct purchase extremely limited (need creative structures)
- PTAL filters London-only (use "Distance to Train Station" elsewhere)
- Structured output format essential
- Units: acres (not sqm), sqft (not sqm), metres
- Company status: Liquidation = forced sale (user discovery!)

---

**Next Step:** Stage 1 - Divergent Approach Generation

Generate 4-6 DIVERSE approaches using:
- **Claude** (2 approaches) - I'll do this now
- **Gemini** (2 approaches) - User will run
- **Codex** (2 approaches) - User will run

Reference: MASTER_SetupFilters.md → Stage 1 for detailed prompts
