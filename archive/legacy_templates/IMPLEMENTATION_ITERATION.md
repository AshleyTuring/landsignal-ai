# Implementation Iteration - Filter 2 Reality Check

**Project:** MixedUse-8Storey-2M
**Date:** 2025-01-19
**Phase:** Implementation (Theory → Reality)
**Status:** In Progress

---

## The Problem

**Initial Result:** 0 opportunities found (entire UK)

This is the "**Reality Check Phase**" - where theoretically perfect filters meet actual system capabilities.

---

## Issues Discovered

### Issue #1: Unit Mismatches ✅ UNDERSTOOD

**Problem:**
- Filter spec: "Title area 800-2,500 sqmt"
- SearchLand reality: "Title area (acres)" ONLY

**Root Cause:**
- LLMs assumed SearchLand uses metric system
- Actually uses imperial (acres) and US units (square feet)

**Solution:**
```
Conversion required:
- 800 sqmt = 0.198 acres ✓
- 2,500 sqmt = 0.618 acres ✓

User already converted correctly!
```

**Fix Applied:** ✅ User has correct acre values

**Learning:** Always check ACTUAL unit labels in interface

---

### Issue #2: "Listed >12 Months" Doesn't Exist ⚠️ WORKAROUND NEEDED

**Problem:**
- Filter spec: "Sales listing on market >12 months OR price reduced"
- SearchLand reality: No duration or price change filters

**Available "Sales listing status" options:**
- Available
- Under Offer
- Reserved
- Invisible
- Sold Subject to Contract
- Sold Subject to Conclusion of Missives
- Sale Completed

**Root Cause:**
- SearchLand doesn't track listing duration
- SearchLand doesn't track price changes
- These were ASSUMED capabilities

**Workaround Options:**

#### Option A: Use "Sales listing status: Available" as proxy
```
Logic: If listed AND old sold date, likely long listing
Filters:
- Sales listing status: Available
- Latest sold date: >3 years ago (property isn't moving)
```

#### Option B: Remove sales listing filters entirely
```
Focus on other motivation signals:
- Building status: Derelict, Inactive
- Expired commercial leases (if available)
- Old sold dates
- Poor EPC
```

#### Option C: Manual screening
```
Get results, then manually check:
- Rightmove listing history
- Price history on property portals
- Direct research on each property
```

**Recommended:** Start with Option B (remove sales listing filters)

---

### Issue #3: "Planning Status: Expired" MISSING ❌ CRITICAL

**Problem:**
- Filter spec: "Planning status: Expired OR Lapsed"
- SearchLand reality: **NO planning status filter exists**

**This is CORE to Filter 2!**

**Available Planning Filters:**
- Proposal (keyword search) ✓
- No. of applications ✓
- Applications in last 5 years ✓
- Max dwellings applied for ✓
- Last application submitted ✓

**Root Cause:**
- LLMs assumed planning status would be tracked
- SearchLand only tracks applications, not their outcomes

**Workaround:**

#### Method 1: Use date logic as proxy
```
Assumption: Application >2 years old with no construction = likely expired/lapsed

Filters:
- Proposal: contains "8-storey" AND "mixed-use"
- Last application submitted: 2-6 years ago
- Building on title is NOT under construction
- Max dwellings applied for: >10
```

**Logic:** If planning applied for 2+ years ago, not built, and no active construction, it likely expired or was refused.

#### Method 2: Add "inactive" building status
```
Further proxy for stalled development:
- Building on title is inactive
- OR Building on title is derelict
```

**Recommended:** Use Method 1 with date proxy

---

### Issue #4: "Tall Building Policy Zone" MISSING ⚠️ GEOGRAPHIC

**Problem:**
- Filter spec: "Within Tall Building Policy Zone or Opportunity Area"
- SearchLand reality: No direct filter for policy zones

**Available Related Filters:**
- Site allocation type ✓
- Land Availability Assessment (SHLAA) ✓
- In adopted/emerging settlement ✓

**Workaround:**

#### Option A: Use geographic knowledge
```
Manually filter by known tall building boroughs:
- London: Tower Hamlets, Newham, Croydon, Greenwich
- Then apply PTAL filter within those
```

#### Option B: Use PTAL as proxy
```
Logic: PTAL 5-6 areas more likely to support tall buildings
Filters:
- PTAL: 5, 6a, 6b
- This concentrates on high-density areas
```

#### Option C: Use site allocations
```
Filters:
- Site allocation type: contains "Opportunity Area"
- Site allocation type: contains "Housing allocation"
```

**Recommended:** Use geographic search (Tower Hamlets, Newham, etc.) + PTAL 5-6

---

### Issue #5: Dates Too Specific ⚠️ OVERLY RESTRICTIVE

**Problem:**
- Current: After 07/06/2020, Before 07/06/2023
- This is exactly 3 years - arbitrary and restrictive

**Root Cause:**
- User interpreted "1-4 years ago" literally from today

**Fix:**
```
Broaden window:
- After: 01/01/2019 (6 years ago)
- Before: 31/12/2023 (1 year ago)
- This captures 2019-2023 applications (5 year window)
```

---

## Revised Filter 2 - Implementation Version

### Remove These (Don't Exist):
❌ Planning status: Expired
❌ Sales listing: Listed >12 months
❌ Sales listing: Price reduced
❌ Tall Building Policy Zone

### Keep These (Core):
✓ Tenure: Freehold
✓ Proposal: contains "8-storey" AND "mixed-use"
✓ Max building height on title: >20m
✓ Title area: 0.198-0.618 acres (800-2,500 sqmt)
✓ PTAL: 4, 5, 6a, 6b

### Adjust These:
~ Last application submitted: 01/01/2019 - 31/12/2023 (broader window)
~ Max dwellings applied for: >8 (slightly broader than >10)
~ Latest sold date: >3 years ago (proxy for lack of movement)

### Add These (Proxies):
➕ Building on title is NOT under construction
➕ Ownership type: Private owner OR Company (not institutional)
➕ Site allocation type: contains "Opportunity" (if it matches)

### Optional Motivation Signals:
- Building on title is inactive
- EPC rating: D, E, F, G
- Number of price paid records: 0-2 (limited sales history = potential motivation)

---

## Iteration Plan

### Step 1: Ultra-Simple Diagnostic (TEST IF DATA EXISTS)

```
Filters:
1. Proposal contains: "mixed-use"
2. Title area: 0.198-2.47 acres (800-10,000 sqmt - very broad)
3. Max building height: >15m (6+ storeys)
```

**Goal:** Does SearchLand have mixed-use planning data?
**Expected:** >0 results (even if not perfect matches)

### Step 2: Add Core Criteria

```
Keep Step 1, add:
4. Last application submitted: After 01/01/2018
5. PTAL: 3, 4, 5, 6a, 6b (London focus)
```

**Goal:** Narrow to London-area mixed-use applications
**Expected:** 10-100 results

### Step 3: Add Height & Scale

```
Keep Step 2, adjust:
- Max building height: >20m (8+ storeys)
- Max dwellings applied for: >8
- Title area: 0.198-0.618 acres
```

**Goal:** Focus on 8-storey scale
**Expected:** 5-50 results

### Step 4: Add Motivation Proxies

```
Keep Step 3, add:
- Building on title is NOT under construction
- Latest sold date: Before 01/01/2021 (4+ years old)
```

**Goal:** Find stalled/abandoned projects
**Expected:** 2-20 results

### Step 5: Geographic Refinement

**If still 0 or too many, filter by specific authorities:**
- Tower Hamlets
- Newham
- Greenwich
- Croydon
- (Or remove geographic filter to search UK-wide)

---

## Next Actions

1. **Run Step 1** (diagnostic)
   - Document result count
   - If 0: Mixed-use planning data may not exist in SearchLand
   - If >0: Proceed to Step 2

2. **Document each iteration**
   - What filters used
   - Result count
   - What was learned

3. **Update MASTER_SetupFilters.md**
   - Add "Implementation Iteration" pattern
   - Document unit conversion requirements
   - Document proxy strategies for missing filters

4. **Create workaround catalog**
   - For future projects with similar missing filters
   - Proxy strategies that worked
   - Proxy strategies that didn't work

---

## Key Learnings (In Progress)

### What We Learned:
1. **Unit mismatches are common** - Always verify actual units
2. **"Status" fields often don't exist** - Systems track events, not outcomes
3. **Policy zones not directly filterable** - Need geographic knowledge
4. **Proxies can work** - Date logic + building status = expired planning proxy
5. **Iterative testing essential** - Start broad, narrow gradually

### What Worked:
- User correctly converted sqmt to acres ✓
- User identified missing filters quickly ✓

### What Didn't Work:
- Assuming SearchLand has planning status tracking ✗
- Assuming listing duration tracking exists ✗
- Too narrow date ranges ✗

### Still Testing:
- Date proxy for expired planning
- PTAL as tall building policy proxy
- Building status as motivation signal

---

## Success Criteria

**Minimum Success:** Find 5-10 properties matching core criteria
- 8-storey mixed-use proposals
- London or major cities
- Reasonable scale (800-2,500 sqmt / 0.2-0.6 acres)
- Some indication of stalled development

**Ideal Success:** Find 2-5 PERFECT matches
- All criteria + clear expired planning
- Strong motivation signals
- In tall building policy areas
- Manual research confirms opportunity

---

**Status:** Step 1 pending
**Next:** Run diagnostic filter, document results
**Update:** [Date of next update]

