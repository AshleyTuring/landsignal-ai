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
1. **Output Format**: Use STRUCTURED LIST FORMAT ONLY (not prose)
   - Example: `1. Title area (acres): is greater than 0.198 AND less than 2.47`
   - NOT: "Look for properties between 8,000-100,000 sqft"
2. **Units**: Use acres/sqft/metres (as shown in ACTUAL filters)
3. **Filter Names**: Use EXACT names from AvailableFiltersInSearchLand_ACTUAL.md
4. **No Assumptions**: If a filter doesn't exist, propose proxy filters

---

## Requirement Type

- [x] **Type 1: Profit & Capital Outlay**
- [x] **Type 2: Similar Planning Applications**

---

## Type 1: Profit & Capital Outlay

**Target Profit:** £2,000,000

**Capital Outlay:** £200,000


---

## Type 2: Similar Planning Applications

### Planning Application 1:

**Description:**
```
Demolition and construction of an 8-storey mixed-use development comprising 
flexible retail (class E) and residential (Class C3) use with associated communal 
terraces, cycle parking, accessible car parking and waste storage
```

**Location:** Slough, UK 
**Decision:** Approved  




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

---

## Target Geographies

**Primary:**
- UK


---

## Task

**Generate 2 or more unique filter strategies** that could achieve the target profit (£2,000,000) with the available capital (£200,000).

**Required:**
- **At least ONE approach** must target properties similar to the planning application specified in Type 2 (8-storey mixed-use development in Slough)
  - You may generate multiple different search strategies for finding precedent-similar properties
- **At least ONE approach** using a completely different strategy (not precedent-based)

**Your approach:**
- Analyze the profit/capital requirements (Type 1)
- Consider the planning precedent provided (Type 2)
- Review the reference materials provided in this prompt
- Develop filter strategies that you believe will identify suitable opportunities
- Provide detailed rationale for each approach

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
