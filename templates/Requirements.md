# Filter Requirements

**Project:** [PROJECT_NAME]  
**Date:** [DATE]  
**Status:** Requirements Gathering

---

## Global Context

**You are an expert UK property analyst and power user of SearchLand.co.uk**

You have been tasked with creating SearchLand filters based on user requirements through a **divergent hypothesis testing** approach.

### Available Resources:
- `/SearchlandContext/AvailableFiltersInSearchLand_ACTUAL.md` - **USE ONLY THIS** - Real filters available
- `/SearchlandContext/PresetFiltersBuiltIntoSearchLand.md` - Pre-configured examples (learning only)
- `/LEARNINGS_DATABASE.md` - Known SearchLand AI implementation behaviors
- `/FILTER_PATTERNS.md` - Reusable strategy templates

### CRITICAL RULES:
1. **Output Format**: Use STRUCTURED LIST FORMAT ONLY (not prose)
   - Example: `1. Title area (acres): is greater than 0.198 AND less than 2.47`
   - NOT: "Look for properties between 8,000-100,000 sqft"
2. **Units**: Use acres/sqft/metres (as shown in ACTUAL filters)
3. **Filter Names**: Use EXACT names from AvailableFiltersInSearchLand_ACTUAL.md
4. **No Assumptions**: If a filter doesn't exist, propose proxy filters
5. **Divergent Generation**: Create MULTIPLE approaches, not one consensus

### Search Area Flexibility:
We can easily adjust the search area by local planning authority or by geographic area using their map interface.

---

## Requirement Type

Select either or both:
- [ ] **Type 1: Profit & Capital Outlay**
- [ ] **Type 2: Similar Planning Applications**

---

## Type 1: Profit & Capital Outlay

**Target Profit:** £

**Capital Outlay:** £

**Additional Context:**
- Property type preferences:
- Geographic preferences:
- Risk tolerance: [Low / Medium / High]
- Time horizon: [months]
- Other considerations:

---

## Type 2: Similar Planning Applications

### Planning Application 1:

**Description:**
```
[Paste planning application description here]
Example: "Demolition and construction of an 8-storey mixed-use development 
comprising flexible retail (class E) and residential (Class C3) use..."
```

**Location:** [LPA / Area]  
**Decision:** [Approved / Refused / Pending]  
**Decision Date:** [YYYY-MM-DD]

**Key Success Factors to Analyze:**
- What made this approvable? (policy support, PTAL, precedent)
- Site characteristics: [Size in acres/sqft, existing height, use class]
- Location characteristics: [Urban/suburban, transport, constraints]
- Planning policy support: [Tall building zone? Opportunity area? HDT?]

---

### Planning Application 2 (Optional):

**Description:**
```
[If you have multiple examples, paste second one here]
```

**Location:** [LPA / Area]  
**Decision:** [Approved / Refused / Pending]  
**Decision Date:** [YYYY-MM-DD]

**Key Success Factors:**
- [What patterns emerge across multiple applications?]

---

### Planning Application 3 (Optional):

**Description:**
```
[Third example if available]
```

**Location:** [LPA / Area]  
**Decision:** [Approved / Refused / Pending]  
**Decision Date:** [YYYY-MM-DD]

---

### Analysis Guidance for Agents:

**Extract Implicit Filters:**
- What title area range? (e.g., 0.2-1.5 acres)
- What height/storeys? (e.g., 8-10 storeys = 25-35m)
- What use class mix? (e.g., E ground floor + C3 above)
- What transport accessibility? (e.g., <500m train, PTAL 4+)
- What policy support? (e.g., tall building zones, opportunity areas)
- What constraints avoided? (e.g., zero flood, zero conservation)

**Create Precedent-Based Strategy:**
At least ONE agent must create an approach that:
1. Replicates these success factors
2. Finds sites with similar characteristics
3. Targets areas where this development type is proven viable

---

### Additional Context:
- Geographic area: [Target LPAs / regions]
- Scale preferences: [Same size / Smaller / Larger]
- Must-have features: [Essential characteristics]
- Nice-to-have features: [Desirable but not essential]
- Exclusions: [Deal-breakers]

---

## Additional Requirements

**Priority Level:**
- [ ] High - Need precise matches
- [ ] Medium - Some flexibility acceptable
- [ ] Low - Exploratory search

**Expected Number of Results:**
- [ ] Narrow (10-50 properties)
- [ ] Moderate (50-200 properties)
- [ ] Wide (200+ properties)

**Special Considerations:**
[Any other requirements, constraints, or preferences]

---

## Target Geographies

**Primary:**
- [LPA or region]

**Secondary (for testing):**
- [LPA or region]
- [LPA or region]

---

## Notes

[Add any additional context that might help in filter creation]

---

**Next Step:** Stage 1 - Divergent Approach Generation (see MASTER_SetupFilters.md)

