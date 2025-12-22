# Property Search Requirements

## Context

You are an expert UK property analyst. You are also an expert user of searchland.co.uk. Generate filter strategies based on the requirements below.

### Available Resources (included in this prompt):
- **AvailableFiltersInSearchLand_ACTUAL.md** - Complete list of filters available in SearchLand
- **PresetFiltersBuiltIntoSearchLand.md** - Expert preset examples
- **LEARNINGS_DATABASE.md** - Implementation behaviors and insights
- **FILTER_PATTERNS.md** - Strategic patterns
- **PRESET_STRATEGY_GUIDE.md** - Guide to presets

**IMPORTANT:** All reference materials are included in this prompt. Do NOT attempt to read external files.

### CRITICAL RULES:
1. **Output Format**: Use STRUCTURED LIST FORMAT (not prose) WHERE APPROPRIATE
   - Example: `1. Title area (acres): is greater than 0.198 AND less than 2.47`
   - NOT: "Look for properties between 8,000-100,000 sqft"
2. **Units**: Use acres/sqft/metres (as shown in ACTUAL filters)
3. **Filter Names**: Use EXACT names from AvailableFiltersInSearchLand_ACTUAL.md
4. **No Assumptions**: If a filter doesn't exist, propose proxy filters

---

## Requirement Type

- [x] **Type 1: Profit & Capital Outlay**

---

## Type 1: Profit & Capital Outlay

**Target Profit:** £150,000+ (minimum)

**Capital Outlay:** £200,000

**Strategy Focus:**
- Class MA arbitrage opportunities
- Commercial to residential conversions
- Permitted development routes
- Any lucrative opportunities within capital constraints

---

## Additional Requirements

**Priority Level:**
- [x] High - Need precise matches
- [ ] Medium - Some flexibility acceptable
- [ ] Low - Exploratory search


**Special Considerations:**
- Open to arbitrage opportunities
- Commercial to residential conversions mentioned but not priority
- Volume strategy acceptable 
---

## Target Geographies

**Primary:** 6-LPA Strategy (Essex Commuter Belt)
- **Brentwood** (primary focus)
- **Basildon**
- **Rochford**
- **Chelmsford**
- **Epping Forest**
- **Harlow**

**Context:**
- All 6 LPAs are Essex commuter towns to London
- Strong residential demand across the region
- Active commercial property markets
- Wider geography increases deal flow but requires longer travel for site visits
- May have Green Belt constraints on periphery (varies by LPA)

---

## SearchLand Preset Results for Brentwood LPA

**CRITICAL:** The following are actual SearchLand preset filter results for Brentwood LPA. Review these carefully before generating manual filter strategies.



Results: 
87
  preset filters - note check how many you have and update add any missing and notify the user if you need the definition

Edge Of Settlement Sites
Popular
0 sites in Brentwood LPA


Unbroken freeholds
Popular
Multi-unit freeholds with potential to split or repurpose
16 sites in Brentwood LPA


Run down homes
Popular
Low-EPC single homes with rebuild or improvement potential
112 sites in Brentwood LPA


1-2 acres land opportunities
Popular
Unconstrained 1–2 acre flat land plots, undeveloped and buildable
0 sites in Brentwood LPA


Unconstrained, up to 5 units
Popular
Small undeveloped plots in built-up areas for housing
4 sites in Brentwood LPA


Vacant land in built-up areas
Popular
Undeveloped land plots within built-up areas for development
9 sites in Brentwood LPA


Class MA (pre-configured)
Popular
Class MA sites filtered for potential profit based on local values permitted development
44 sites in Brentwood LPA


Infill (pre-configured)
Popular
C3 sites with road access and space for additional infill homes
592 sites in Brentwood LPA


Class Q (pre-configured)
Popular
Agricultural buildings on Grade 1–5 land eligible for Class Q permitted development
44 sites in Brentwood LPA


Grey Belt
Popular
Green Belt sites with hardstanding & development potential
170 sites in Brentwood LPA


Houses with big gardens
Popular
Homes with big gardens suitable for infill development
181 sites in Brentwood LPA


Brownfield - industrial
Popular
Freehold brownfield sites 0.25-3 acres for industrial use
5 sites in Brentwood LPA


Class MA eligible commercial sites
Popular
Commercial sites in built-up areas eligible for Class MA permitted development
209 sites in Brentwood LPA


Padel opportunities
Popular
Land suitable for developing new padel courts
8 sites in Brentwood LPA


Mixed use search
Popular
Freehold mixed-use properties with commercial & resi units
175 sites in Brentwood LPA


Edge of settlement sites
Popular
Strategic sites on settlement edges of 2 acres or more
28 sites in Brentwood LPA


Allocated sites, 5-50 acres
Popular
Strategic land parcels, 5–50 acres, suitable for development
14 sites in Brentwood LPA


HMO expired licences
Popular
Houses in multiple occupation with expired licences
0 sites in Brentwood LPA


Commercial with expiring leases
Popular
Medium commercial sites with leases ending before 2027
6 sites in Brentwood LPA


Land for solar ground mount
Popular
Freehold land suitable for ground-mounted solar farms
10 sites in Brentwood LPA


100+ unit in London, high PTAL
Sites with 100 or more residential units and PTAL 5+
0 sites in Brentwood LPA


Airspace: 8 or more addresses
Flats with flat roofs on freehold titles with 8+ units
37 sites in Brentwood LPA


Airspace: Commercial, no resi
Commercial buildings with flat roofs and no residential use
22 sites in Brentwood LPA


Airspace: Sales listing pre-1990
Flats with flat roofs built before 1990, multiple addresses
10 sites in Brentwood LPA


Airspace: Unbroken freeholds
Flats with flat roofs on single freehold (no leases)
1 sites in Brentwood LPA


Cafe & restaurant sites
High-footfall sites suitable for cafes and restaurants
66 sites in Brentwood LPA


Care home opportunities
Care homes within 500 m of a hospital for an older demographic
0 sites in Brentwood LPA


Car Parks
Sites that have a carpark as defined by OS
2 sites in Brentwood LPA


Class A
Houses suitable for extensions or alteration (Class A permitted development)
55 sites in Brentwood LPA


Class G
Space above shops convertible to two flats, permitted development
0 sites in Brentwood LPA


Class ZA
Small commercial buildings eligible for Class ZA (permitted development) rebuild
58 sites in Brentwood LPA


Commercial solar rooftops
Commercial buildings with suitable roof space for solar
3 sites in Brentwood LPA


Companies owning more than 30 titles
Companies holding over 30 freehold titles with HMOs
0 sites in Brentwood LPA


ECO4
Private sites with poor EPCs for ECO4 solar installs
15 sites in Brentwood LPA


Edge of settlement sites
Plots on settlement edges with potential boundary changes
1 sites in Brentwood LPA


Educational sites with parking
Large freehold sites suitable for education with parking space
23 sites in Brentwood LPA


Emerging sites without planning
Strategic sites on emerging allocations without planning
3 sites in Brentwood LPA


Farmland in nutrient neutrality areas
Freehold farmland >8 ha in nutrient neutrality zones
0 sites in Brentwood LPA


Farm titles less than 5 acres
Farm land plots of less than 5 acres
5 sites in Brentwood LPA


Fast food restaurant sites
Fast food or café sites with expired leases and undeveloped land
1 sites in Brentwood LPA



---

## Task

**Generate 2 or more unique filter strategies** that could achieve the target profit (£200,000+) with the available capital (£200,000).

**Your approach:**
- Analyze the profit/capital requirements (Type 1)
- Review the SearchLand preset results for Brentwood LPA (above)
- Consider the strategy focus
- Review the reference materials provided in this prompt
- Develop filter strategies that you believe will identify suitable opportunities
- Provide detailed rationale for each approach

**Strategy Guidelines:**

- Consider volume strategies (multiple smaller deals) vs. single large deals
- Consider commercial to residential conversions,permitted development routes (Class MA, Q, ZA) where applicable and other strategies you think appropriate where profit margins are highest
- Evaluate preset refinement opportunities (add filters to existing presets)
- Generate manual filter strategies only where presets are insufficient - this should be rare over fine tunning an existing

**The system will test all valid approaches empirically.**

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

## Reference Materials

All reference materials are included in your prompt context. Review them to inform your approach generation.
