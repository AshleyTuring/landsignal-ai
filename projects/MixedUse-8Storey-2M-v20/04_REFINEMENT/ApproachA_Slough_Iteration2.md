# Approach A - Iteration 2: Slough-Specific (Fixed)

**Original Issue:** 0 results in Slough
- PTAL filter London-only (excluded all Slough properties)
- Too many restrictive filters for single LPA

**Fix Applied:**
- ✅ Removed PTAL (replaced with station distance only)
- ✅ Broadened height requirement (>15m instead of >18m)
- ✅ Increased area range (up to 1 acre instead of 0.6)
- ✅ Removed inactive/derelict filter (too restrictive for single LPA)

---

## SearchLand AI Prompt (Copy-Paste Ready)

```
1. Proposal: contains "Approved" OR contains "Permission Granted"
2. Proposal: contains "mixed" OR contains "storey"
3. Max building height on title (m): is greater than 15
4. Title area (acres): is greater than 0.1 AND less than 1
5. Distance to nearest Train Station (m): is less than 1000
6. Planning constraints: does not contain [Conservation Area, Green Belt]
7. Applications in last 5 years: is less than 5
8. Use class: contains any [E - Commercial Business and Service, Mixed Use]
```

**Expected Results:** 5-20 properties in Slough

---

## Key Changes Explained

### 1. Removed PTAL Filter
**Original:** `PTAL: is one of 3, 4, 5, 6a, 6b`  
**Issue:** PTAL only covers London (Transport for London data)  
**Fix:** Rely on station distance only (<1000m)

### 2. Lowered Height Threshold
**Original:** `> 18m` (6 storeys)  
**New:** `> 15m` (5 storeys)  
**Why:** More properties qualify, still supports 6-8 storey intensification

### 3. Increased Area Range
**Original:** `0.1-0.6 acres`  
**New:** `0.1-1.0 acres`  
**Why:** Broader search, 1 acre still manageable for £2M profit target

### 4. Removed Inactive/Derelict Filter
**Original:** `Building on title is inactive: Yes OR derelict: Yes`  
**Fix:** Removed entirely  
**Why:** Too restrictive for single LPA, will filter manually in Stage 5

### 5. Increased Applications Threshold
**Original:** `< 3 applications`  
**New:** `< 5 applications`  
**Why:** Less restrictive, still targets relatively passive properties

### 6. Simplified Proposal Search
**Original:** Multiple OR conditions  
**New:** Simpler "mixed" OR "storey" search  
**Why:** Broader match, we'll manually filter for precedents

---

## Test This Iteration

1. Copy the prompt above
2. Paste into SearchLand AI
3. Take screenshot: `ApproachA_Iteration2_SearchLandOutput.jpg`
4. Click Search
5. Note result count

**Target:** 5-20 properties in Slough

---

**Status:** Ready to test  
**Expected Improvement:** Should return results now

