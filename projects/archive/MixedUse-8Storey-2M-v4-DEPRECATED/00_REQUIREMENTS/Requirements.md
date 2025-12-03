# Filter Requirements

**Project:** MixedUse-8Storey-2M-v4  
**Date:** 2025-11-19  
**Status:** Requirements Complete  
**System Version:** 3.2.0 (Collaborative Angle Exploration)

---

## Global Context

**You are three expert UK property analysts collaborating to create SearchLand filters**

You will work together through **systematic angle exploration** (5 rounds) to generate 4-10 diverse filter strategies.

### Available Resources:
- `/SearchlandContext/AvailableFiltersInSearchLand_ACTUAL.md` - **USE ONLY THIS** - Real filters available
- `/SearchlandContext/PresetFiltersBuiltIntoSearchLand.md` - 86 expert presets (reference)
- `/LEARNINGS_DATABASE.md` - Universal implementation behaviors (16+ motivation signals!)
- `/FILTER_PATTERNS.md` - 13 strategic patterns including Time Arbitrage
- `/PRESET_STRATEGY_GUIDE.md` - Comprehensive guide to all 86 presets

### CRITICAL RULES:
1. **Output Format**: Use STRUCTURED LIST FORMAT ONLY (not prose)
   - Example: `1. Title area (acres): is greater than 0.198 AND less than 2.47`
   - NOT: "Look for properties between 8,000-100,000 sqft"
2. **Units**: Use acres/sqft/metres (as shown in ACTUAL filters)
3. **Filter Names**: Use EXACT names from AvailableFiltersInSearchLand_ACTUAL.md
4. **No Assumptions**: If a filter doesn't exist, propose proxy filters
5. **Collaborative Exploration**: Explore 5 systematic angles together (not separate personas)
6. **Natural Collaboration**: Best ideas win per angle (don't force divergence)

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

**Key Success Factors to Analyze (All Agents Collaborate on This):**
- **Development Type:** 8-storey mixed-use (Class E ground + C3 residential above)
- **Scale:** Substantial height (25-35m), multi-unit residential
- **Use Class Mix:** Flexible retail/commercial ground floor + residential above
- **Amenity:** Communal terraces, cycle parking, accessible parking
- **Policy Support:** Area supporting tall buildings/densification

**Implicit Filters to Extract (Round 1: Precedent Analysis):**
- Title area: Likely 0.2-2 acres (large enough for 8-storey with parking/amenity)
- Height potential: Building height <15m OR permission for 25-35m additions
- Use classes: E or previous commercial + permission for residential
- Transport: Likely <800m train OR PTAL 4+ (supports density)
- Constraints: Zero flood zone 3, minimal conservation areas
- Planning policy: Tall building zone OR opportunity area OR HDT

---

### Analysis Guidance for Collaborative Exploration:

**ROUND 1 (MANDATORY): Precedent Analysis**

All agents must analyze this application together:

1. **Collaborative Discussion:**
   - What made this 8-storey mixed-use development approvable?
   - Height: Need 25-35m potential
   - Mixed-use: Need commercial ground + residential permission
   - Transport: PTAL 4+ (London) or <800m train (rest of UK)
   - Urban policy: Supports densification
   - No major constraints: Avoid flood, conservation, green belt

2. **Implementation Options:**
   - Direct approach: Find similar 8-storey approvals (2020+)
   - Site characteristics: Match area, height, transport, policy
   - Adjacency: Properties near approved schemes
   - Proxy approach: Similar height/mixed-use applications

3. **Natural Variations:**
   - If agents propose different implementations, include both
   - If consensus emerges, single precedent approach is fine
   - Expected output: 1-3 precedent approaches

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
- Multiple diverse strategies preferred (4-10 approaches across 5 angles)
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

## Strategic Angles to Explore (v3.2.0 System)

### 5 Systematic Rounds:

**Round 1: Precedent Analysis (MANDATORY)**
- Analyze 8-storey mixed-use planning application above
- Extract success factors as filters
- Find sites with similar approvable characteristics
- Expected: 1-3 precedent approaches

**Round 2: Regulation/Policy Angle**
- HMO expired licenses (forced sale) - Pattern 8A
- Lease expiry (income cliff) - Pattern 8B, Presets #17, #46, #66
- EPC compliance (cannot rent) - Pattern 8C, Presets #2, #20, #69
- Expected: 0-2 regulation approaches

**Round 3: Structural/Creative Angle**
- Airspace development (flat roofs) - Pattern 6A, Presets #22-#25
- Option agreements (low capital control)
- Grey Belt exceptions (previously developed) - Pattern 9A
- Expected: 0-2 structural approaches

**Round 4: Behavioral/Motivation Angle**
- Corporate distress (liquidation) - Pattern 2D, user discovery
- Long hold + derelict (motivation) - Pattern 2A
- Stalled planning (proxy filters) - Pattern 1A
- Expected: 0-2 behavioral approaches

**Round 5: Challenge Round**
- Time arbitrage (fresh consents, 24h data) - Pattern 13
- Strategic land (emerging allocations) - Pattern 11A
- Contrarian/unconventional combinations
- Expected: 0-2 challenge approaches

**Total Expected:** 4-10 approaches (organic based on collaborative discussion)

---

## Notes

**System Version:** 3.2.0 (Collaborative Angle Exploration)
- **v1 (archived):** Single convergent approach (0 results)
- **v2 (archived):** Refined convergence (validated structured output)
- **v3.0-3.1 (archived):** Divergent generation with forced personas
- **v3.2 (current):** Collaborative angle exploration (no forced personas)

**Key Learnings Applied:**
- "Applications in last 5 years = 0" too restrictive (try "< 3")
- £200k direct purchase extremely limited (need creative structures)
- PTAL filters London-only (use "Distance to Train Station" elsewhere)
- Structured output format essential
- Units: acres (not sqm), sqft (not sqm), metres
- Company status: Liquidation = forced sale (user discovery!)
- Time arbitrage: 24h data refresh = speed advantage
- Systematic angle exploration > forced divergence

**New in v3.2.0:**
- Natural collaboration (all agents contribute to all angles)
- Structured 5-round exploration (comprehensive but honest)
- Can skip weak angles (quality over quota)
- Challenge round prevents groupthink
- Best ideas win per angle (not forced by persona)

---

**Next Step:** Run collaborative exploration system

```bash
cd /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v4/.agents
./RUN_ALL.sh
```

This will execute:
- Phase 0: Collaborative Exploration (5 rounds)
- Phase 1: Cross-Critique (technical validation)
- Phase 1.5: Iteration (if disagreements)
- Phase 2: Consensus (final validation matrix)

Expected output: 4-10 approaches ready for parallel testing
