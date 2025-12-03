# Final SearchLand Filters - MixedUse-8Storey-2M-v2

**Status:** ✅ CONVERGED (All 3 LLMs Agree)
**Date:** 2025-11-19
**Iterations:** 2
**System Version:** v2.2

---

## Filter 1: Stalled Mixed-Use Development

**Purpose:** Find properties with lapsed/stalled planning permission for mixed-use developments

**Copy this into SearchLand AI:**

```
1. Proposal: contains "mixed-use" AND "storey"
2. Last application submitted: is before 2023-01-19
3. Applications in the last 5 years: is equal to 0
4. Title area (acres): is greater than 0.2 AND less than 2
5. Building on title is inactive: is equal to Yes
6. Sales listing currently on the market: is equal to Yes
7. Sales listing price: is less than 500000
```

---

## Filter 2: High-Density Redevelopment Opportunity

**Purpose:** Find under-developed sites in high-transport accessibility areas with redevelopment potential

**Copy this into SearchLand AI:**

```
1. Max building height on title (m): is less than 12
2. TFL Public Transport Accessibility Level (PTAL): is one of 4, 5, 6a, 6b
3. Title area (acres): is greater than 0.25 AND less than 2
4. Percentage of title covered by Green Belt land: is equal to 0
5. Developed area percentage: is less than 50
6. Sales listing currently on the market: is equal to Yes
```

---

## Filter 3: Motivated Corporate Seller (Low Entry)

**Purpose:** Find derelict/inactive corporate-owned properties within £200k budget near transport

**Copy this into SearchLand AI:**

```
1. Ownership type: is equal to Company
2. Latest sold date: is before 2020-01-19
3. Sales listing price: is less than 200000
4. Distance to nearest Train Station (m): is less than 1000
5. Title area (acres): is greater than 0.2 AND less than 3
6. Building on title is derelict: is equal to Yes OR Building on title is inactive: is equal to Yes
```

---

## Testing Instructions

1. **Open SearchLand AI** at searchland.co.uk
2. **Select target area** (e.g., Slough or specific LPA)
3. **Paste each filter** into the SearchLand AI prompt box
4. **Review results** - expect 10-50 properties per filter
5. **Document findings** in IMPLEMENTATION_ITERATION.md

## Key Learnings

- **Height Logic:** For redevelopment, target LOW existing height (<12m) with HIGH density potential (PTAL 4-6b)
- **Budget Constraint:** £200k is strict - only Filter 3 stays within budget for direct purchase
- **Expired Planning Proxy:** Use "Applications in last 5 years = 0" + old submission date
- **Filter Names:** All exact matches to AvailableFiltersInSearchLand_ACTUAL.md
- **Units:** acres, sqft, metres (as per actual system)

---

## Multi-LLM Validation

✅ **Gemini:** Designed initial filters, caught Claude's height/price errors  
✅ **Codex:** Validated filter names, units, and logic  
✅ **Claude:** Synthesized corrections, acknowledged errors  

**Consensus achieved after 2 iterations** (minimum requirement met)

---

**Next Step:** Test in SearchLand AI and document results in IMPLEMENTATION_ITERATION.md
