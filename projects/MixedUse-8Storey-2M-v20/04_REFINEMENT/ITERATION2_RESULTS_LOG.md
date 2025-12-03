# Iteration 2 Testing Results

**Date:** 2025-11-24  
**Tester:** User  
**Geography Tested:** Slough (A, C, E) + UK-Wide (B)

---

## Round 1 Results (Original Prompts)

| Approach | Geography | Results | Status |
|----------|-----------|---------|--------|
| A | Slough | 0 | ❌ PTAL + Derelict too restrictive |
| B | Slough | 0 | ❌ Too rare for single LPA |
| C | Slough | 0 | ❌ Sub-£200k too restrictive |
| D | Slough | Some results ✅ | ⚠️ Needs investigation |
| E | Slough | 25,910 | ❌ Parsing failure (only 2/8 filters) |

---

## Round 2 Results (User Corrections)

### Approach A - Corrected (User-Modified)
- **Geography:** Slough
- **Results:** 0
- **Notes:** User corrected (removed PTAL?), still no results
- **Status:** ❌ **Still too restrictive**

**Possible Issues:**
- "Approved" proposal filter may be too specific (try removing)
- "Mixed Use" proposal text may not match Slough planning descriptions
- Derelict still too rare
- Multiple proposal "contains" filters creating AND logic (all must match)

---

### Approach B - UK-Wide Test
- **Geography:** UK-Wide
- **Results:** 0
- **Notes:** Still no results even UK-wide
- **Status:** ❌ **Liquidation + Derelict + On Market = impossible combo**

**Analysis:**
Even UK-wide, this combination is nearly impossible:
- Companies in liquidation/administration: ~500-1,000 UK-wide
- That own derelict buildings: ~50-100
- That are listed for sale: ~10-20
- Under £400k: ~5-10
- That are E or Mixed Use: ~1-3
- Within 1.2km of station: ~0-1

**Recommendation:** This strategy doesn't work with "derelict" - needs "inactive" or remove building condition entirely

---

### Approach C - Re-tested
- **Geography:** Slough (assumed)
- **Results:** 0
- **Status:** ❌ **Sub-£200k commercial + all conditions = too rare**

**Reality Check:**
Sub-£200k commercial properties in SE England are extremely rare, especially when:
- Also inactive
- Also on market
- Also meet all other conditions

**Recommendation:** Increase to £500k or remove "on market" requirement

---

### Approach D - Success!
- **Geography:** Slough (assumed)
- **Results:** Some results ✅
- **Status:** ⚠️ **WORKING - Needs detail analysis**

**Questions:**
- How many results? (5? 20? 50?)
- What do they look like? (industrial buildings near station?)
- Are they viable for Class MA conversion?

**Next Steps:**
1. Screenshot the results
2. Count total properties
3. Visual screening of top 10
4. Check Class MA eligibility (must be <1,500 sqm / 16,145 sqft)

---

### Approach E - Iteration 2 Ready
- **Status:** Fixed prompt provided in `ApproachE_ITERATION2_FixedPrompt.md`
- **Changes:** Simplified structure, split AND conditions, removed complex filters
- **Expected Results:** 10-50 in Slough, 100-300 UK-wide

---

## Key Findings

### What Works:
✅ **Approach D** - Industrial PDR conversion strategy is viable in Slough

### What Doesn't Work:
❌ **Approach A** - Even corrected, "Approved" + "Mixed Use" + Multiple proposal filters too restrictive  
❌ **Approach B** - Liquidation + Derelict combo too rare even UK-wide  
❌ **Approach C** - Sub-£200k commercial in SE England almost non-existent

### SearchLand AI Parsing Issues Confirmed:
1. Multiple "Proposal: contains" filters may create AND logic (all must match)
2. Complex prompts get partially ignored (Approach E: 2/8 filters)
3. OR operators in same filter line don't work ("inactive OR derelict" → only creates one)

---

## Recommended Next Actions

### Priority 1: Approach D Deep Dive
Since D got results, focus here:
1. How many results?
2. Screenshot top 10 properties
3. Visual screening for viability
4. Class MA eligibility check
5. If promising, this becomes primary strategy

### Priority 2: Test Approach E Iteration 2
Use the fixed prompt in `ApproachE_ITERATION2_FixedPrompt.md`

### Priority 3: Simplify Approach A
Remove all the "Proposal: contains" filters except one:
```
1. Max building height on title (m): is greater than 15
2. Title area (acres): is greater than 0.1 AND less than 1
3. Distance to nearest Train Station (m): is less than 1000
4. Use class: contains any [E - Commercial Business and Service, Mixed Use]
5. Applications in last 5 years: is less than 5
```

### Priority 4: Fix Approach B
Remove "derelict" entirely:
```
1. Ownership type: is one of Company
2. Company status: is one of Liquidation, In Administration
3. Use class: contains any [E - Commercial Business and Service, Mixed Use]
4. Distance to nearest Train Station (m): is less than 1200
5. Title area (acres): is greater than 0.1 AND less than 0.7
6. Sales listing currently on the market: Yes
7. Sales listing price: is less than £600,000
```

### Priority 5: Fix Approach C
Increase price cap to £500k and remove "on market" requirement:
```
1. Sales listing price: is less than £500,000
2. Tenure: is one of Freehold
3. Use class: contains any [E - Commercial Business and Service, Mixed Use]
4. Building on title is inactive: Yes
5. Distance to nearest Train Station (m): is less than 1000
6. Title area (acres): is greater than 0.05 AND less than 0.5
```

---

## Next Update: 
**Waiting for:**
- Approach D result count + screenshots
- Approach E Iteration 2 test results
- Decision on whether to iterate A, B, C

