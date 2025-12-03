# Validation Analysis: Why 0 Results vs 25,910

**Date:** 2025-11-24  
**Test Location:** Slough LPA

---

## Results Summary

| Approach | Results | Status | Root Cause |
|----------|---------|--------|------------|
| A | 0 | ❌ Failed | PTAL (London-only) + Derelict instead of Inactive |
| B | 0 | ❌ Failed | Liquidation + Derelict + On Market (too restrictive combo) |
| C | 0 | ❌ Failed | Sub-£200k + Inactive + Multiple conditions |
| D | 0 | ❌ Failed | Industrial use classes very rare in Slough |
| E | 25,910 | ⚠️ Too Broad | Only 2 real filters applied! |

---

## Approach A: 0 Results - Critical Issues

### What We Asked For:
```
10. Building on title is inactive: Yes OR Building on title is derelict: Yes
```

### What SearchLand Created:
```
- Building on title is derelict: is true
```

**❌ CRITICAL ERROR #1:** SearchLand **IGNORED the "inactive" option** and only created "derelict"
- Derelict is MUCH more restrictive than inactive
- Inactive = not in use (common)
- Derelict = abandoned/falling apart (rare)

**❌ CRITICAL ERROR #2:** PTAL filter
```
- TFL Public Transport Accessibility Level (PTAL) contains any: 3, 4, 5, 6a, 6b (Best)
```
- PTAL only covers London (Transport for London)
- **Slough has NO PTAL data**
- This filter automatically excludes ALL Slough properties

**❌ ISSUE #3:** SearchLand added "Tenure: Freehold" (not in original prompt)

**Combined Effect:** PTAL excludes all Slough + Derelict is very rare = 0 results

---

## Approach B: 0 Results - Ultra-Restrictive Combination

### What SearchLand Created (Correct):
✅ All filters created correctly!

**Why 0 Results:**
The combination is too restrictive for a single LPA:

1. **Company in Liquidation/Administration** (rare - maybe 5-10 in Slough)
2. **Building is derelict** (very rare)
3. **Listed for sale** (not all liquidations are marketed)
4. **Price <£400k** (liquidators often price higher)
5. **E or Mixed Use** (excludes other commercial)

**Reality Check:**
- Companies in liquidation: Very rare in single LPA
- + Derelict building: Even rarer
- + On market: Rarer still
- + Under £400k: Almost impossible

**This strategy needs UK-wide search, not single LPA**

---

## Approach C: 0 Results - Sub-£200k Too Restrictive

### What SearchLand Created (Correct):
✅ All filters created correctly!

**Why 0 Results:**
The combination is too restrictive for Slough:

1. **Price <£200k** (very few commercial properties this cheap in SE England)
2. **Currently on market** (limits to active listings)
3. **Inactive building** (rare)
4. **<1 application in 5 years** (very passive)

**Reality Check:**
- Sub-£200k commercial in Slough: Maybe 10-20 total
- That are also inactive: Maybe 5
- That are also on market: Maybe 1-2
- That meet all other conditions: 0

**This strategy needs broader geography or higher price cap**

---

## Approach D: 0 Results - Wrong Use Classes for Slough

### What SearchLand Created (Correct):
✅ All filters created correctly!

**Why 0 Results:**
Slough may not have many industrial properties matching these criteria:

1. **B1c, B2, E(g)(iii)** - Light/general industrial
2. **5,000-50,000 sqft** - Specific size range
3. **Active building** (not derelict/inactive)
4. **<1,200m from station**
5. **All other constraints**

**Reality Check:**
- Slough has industrial areas, but:
- Many are larger than 50,000 sqft
- Or smaller than 5,000 sqft
- Or not within 1.2km of station
- Or have planning constraints

**This strategy might work better in Birmingham/Manchester industrial areas**

---

## Approach E: 25,910 Results - TOO BROAD!

### What We Asked For (8 filters):
```
1. Max building height on title (m): is less than 12
2. Distance to nearest Train Station (m): is less than 800
3. Title area (acres): is greater than 0.25 AND less than 1.5
4. Use class: contains any [E - Commercial Business and Service, Sui Generis]
5. Latest sold date: is before 2015-01-01
6. Applications in the last 5 years: is less than 2
7. Sales listing currently on the market: No
8. Planning constraints: does not contain [Green Belt]
```

### What SearchLand Actually Created (2 filters!):
```
- Tenure is one of: Freehold
- Max number of building floors on title: is less than 4
```

**🚨 CRITICAL PARSING ERROR:**
SearchLand AI **IGNORED 6 out of 8 filters!**

**Missing Filters:**
- ❌ Distance to Train Station
- ❌ Title area range
- ❌ Use class
- ❌ Latest sold date
- ❌ Applications in last 5 years
- ❌ Not on market
- ❌ Planning constraints

**Why 25,910 Results:**
With only 2 broad filters:
- Freehold (most properties)
- <4 floors (most buildings)

= Matches almost everything in Slough!

**Also:** SearchLand changed "height in metres" to "number of floors" (different measurement!)

---

## Root Cause Analysis

### SearchLand AI Parsing Issues Discovered:

1. **OR operators in same filter ignored**
   - "inactive: Yes OR derelict: Yes" → only created "derelict"

2. **Multiple filters from same prompt line**
   - Sometimes creates all filters
   - Sometimes drops most filters (Approach E)

3. **Auto-adds filters not requested**
   - Added "Tenure: Freehold" to A, B, C, D (not in prompts)

4. **Unit conversions**
   - "Max building height (m): < 12" became "Max floors: < 4"
   - Conversion is approximate (3-4m per floor assumed)

---

## Recommended Fixes

### Approach A - Fix for Slough (Most Promising)

**Remove:** PTAL filter (London only)  
**Change:** "Building derelict" → Remove entirely or change to "inactive"  
**Simplify:** Proposal filters (too many OR conditions)

```
1. Proposal: contains "storey"
2. Max building height on title (m): is greater than 15
3. Title area (acres): is greater than 0.1 AND less than 1
4. Distance to nearest Train Station (m): is less than 1000
5. Planning constraints: does not contain [Conservation Area, Green Belt]
6. Applications in last 5 years: is less than 5
7. Use class: contains any [E - Commercial Business and Service, Mixed Use]
```

**Expected:** 5-20 results in Slough

---

### Approach E - Fix (Add Missing Filters Manually)

SearchLand AI failed to parse most filters. **Manual approach:**

1. Start with the 2 filters it created
2. Manually add the 6 missing filters in SearchLand UI:
   - Distance to Train Station: < 800m
   - Title area: 0.25-1.5 acres
   - Use class: E or Sui Generis
   - Latest sold date: before 2015
   - Applications: < 2
   - Not on market

**Expected:** 10-30 results

---

### Approach B - Needs UK-Wide Search

This strategy is TOO SPECIFIC for single LPA.

**Recommendation:** Change geography to UK-wide or at least SE England region

---

### Approach C - Increase Price Cap

**Change:** £200k → £400k or £500k  
**Or:** Remove "on market" requirement (find off-market)

---

### Approach D - Try Different Geography

Slough may not have enough industrial properties. Try:
- Birmingham
- Manchester  
- Leeds
- Industrial areas of London

---

## Key Learnings for LEARNINGS_DATABASE.md

1. **SearchLand AI OR operators:** 
   - "X: Yes OR Y: Yes" syntax doesn't work
   - Only creates one of the filters
   - Use separate filter lines instead

2. **PTAL is London-only:**
   - Will return 0 results for all non-London LPAs
   - MUST remove for UK-wide or non-London searches

3. **Derelict vs Inactive:**
   - Derelict = very rare (abandoned, falling apart)
   - Inactive = more common (not in use, but maintained)
   - If using single LPA, inactive gives more results

4. **SearchLand auto-adds Tenure filter:**
   - Even when not requested, often adds "Freehold"
   - Usually harmless, but worth noting

5. **Complex prompts get partially ignored:**
   - Approach E: 8 filters requested, only 2 created
   - Break into simpler chunks or add manually in UI

6. **Unit conversions:**
   - "Height in metres" may become "number of floors"
   - 12m ≈ 3-4 floors (approximate conversion)

---

## Next Steps

**Option 1: Fix Approach A** (Recommended)
- Most promising strategy
- Just needs PTAL removed + derelict relaxed
- Test iteration in Slough

**Option 2: Manually Fix Approach E**
- Add the 6 missing filters in SearchLand UI
- Should get 10-30 results

**Option 3: Test Approaches B-D UK-Wide**
- Change geography from Slough to UK-wide
- Better results for niche strategies

---

**Status:** Analysis complete - ready to iterate  
**Recommendation:** Test Approach A Iteration 2 (already prepared)

