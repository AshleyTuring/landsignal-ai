# Stage 4: Quick Start Guide

**Status:** Ready to test approaches in SearchLand  
**Current Approach:** Start with Approach A or B

---

## 🚀 Quick Steps

### 1. Open SearchLand.co.uk
- Navigate to "Create Custom Search" or "AI Search"

---

### 2. Copy the Prompt

**For Approach A:**
Open: `03_PARALLEL_TESTING/ApproachA_ReadyToTest.md`

Copy the prompt (lines 7-17):
```
1. Proposal: contains "Approved" OR contains "Permission Granted"
2. Proposal: contains "Mixed Use" OR contains "mixed-use" OR contains "Retail and Residential"
3. Proposal: contains "storey" OR contains "storeys"
4. Max building height on title (m): is greater than 18
5. Title area (acres): is greater than 0.1 AND less than 0.6
6. Distance to nearest Train Station (m): is less than 800
7. PTAL: is one of 3, 4, 5, 6a, 6b (Best)
8. Planning constraints: does not contain [Conservation Area, Listed Building(s) in plot, Green Belt]
9. Applications in last 5 years: is less than 3
10. Building on title is inactive: Yes OR Building on title is derelict: Yes
```

---

### 3. Paste into SearchLand AI

Paste the entire prompt into SearchLand's AI input field.

---

### 4. Take Screenshot #1 (BEFORE Search)

**⚠️ IMPORTANT:** Take screenshot BEFORE clicking "Search"

**What to capture:**
- The filter panel showing all filters SearchLand AI created
- All 10 filters visible (scroll if needed)

**Save as:**
```
04_REFINEMENT/Screenshots/ApproachA_SearchLandOutput.jpg
```

**Naming pattern:**
- Approach A → `ApproachA_SearchLandOutput.jpg`
- Approach B → `ApproachB_SearchLandOutput.jpg`
- Approach C → `ApproachC_SearchLandOutput.jpg`
- etc.

---

### 5. Click "Search"

Now click the search button to execute the query.

---

### 6. Document Result Count

Note the number of properties found:
- By geography (if shown)
- Total count

Add to `VALIDATION_LOG.md`:
```markdown
**Result Count by Geography:**
- London: 12 properties
- Birmingham: 8 properties
- Manchester: 5 properties
- **TOTAL:** 25 properties
```

---

### 7. Take Property Screenshots

**For EACH property in results:**

1. Click on the property in SearchLand
2. View the aerial/satellite image
3. Take screenshot showing:
   - Property boundaries
   - Surrounding context
   - Obvious constraints (rivers, roads, green space)

**Save as:**
```
04_REFINEMENT/Screenshots/Approach[LETTER]_Property_[ShortAddress].jpg
```

**Examples:**
```
ApproachA_Property_123HighStSlough.jpg
ApproachA_Property_45CommercialRdLondon.jpg
ApproachA_Property_789IndustrialWayBirmingham.jpg
```

**Address shortening tips:**
- Remove spaces: `123 High Street` → `123HighSt`
- Abbreviate: `Street`→`St`, `Road`→`Rd`, `Avenue`→`Ave`
- Add city: `...Slough`, `...London`, `...Birmingham`
- Keep under 50 chars total

---

### 8. Visual Exclusion

Review each property screenshot and exclude obviously unsuitable:

**Exclusion reasons:**
- ❌ Too small (visual check vs expected size)
- ❌ Wrong type (residential when seeking commercial)
- ❌ Obvious constraints (flood zone visible, listed building)
- ❌ Wrong location (not near station despite filter)

**Document in VALIDATION_LOG.md:**
```markdown
### Visual Exclusions

| Property Address | Screenshot | Reason |
|------------------|------------|--------|
| 789 Small Lane | ApproachA_Property_789SmallLn.jpg | Too small (~0.05 acres, under threshold) |
| 101 Listed Building | ApproachA_Property_101ListedBldg.jpg | Listed building visible |
```

---

### 9. Update VALIDATION_LOG.md

Fill in the validation table:
- Compare intended vs actual filters (from screenshot #1)
- Mark each filter ✅ OK or ❌ ERROR
- Note any issues

**Example:**
```markdown
| Filter # | Intended | Actual | Status | Issue |
|----------|----------|--------|--------|-------|
| 1 | Proposal: contains "Approved" | Proposal: contains "Approved" | ✅ OK | None |
| 2 | Proposal: contains "Mixed Use" | [Missing] | ❌ ERROR | Filter not created |
```

---

### 10. Capture Learnings

If SearchLand AI behaved unexpectedly:

**Add to VALIDATION_LOG.md:**
```markdown
**Updates for LEARNINGS_DATABASE.md:**
- SearchLand AI skipped filter #2 (Proposal with OR operators)
- Workaround: Use separate Proposal filters or contains any syntax
```

Later, update the main `LEARNINGS_DATABASE.md` with universal insights.

---

## 📁 File Organization After Testing

```
04_REFINEMENT/
├── Screenshots/
│   ├── ApproachA_SearchLandOutput.jpg          ← Filter interpretation
│   ├── ApproachA_Property_123HighStSlough.jpg  ← Property 1
│   ├── ApproachA_Property_45CommercialRd.jpg   ← Property 2
│   ├── ApproachA_Property_789IndustrialWay.jpg ← Property 3
│   └── ... (all properties)
├── VALIDATION_LOG.md                           ← Your validation tracking
└── STAGE4_QUICK_START.md                       ← This file
```

---

## 🎯 Expected Outcomes

### Approach A (High-Density Precedent)
- **Expected:** 15-30 properties
- **After visual exclusion:** 8-15 viable
- **Geography:** Mix across UK (London/Birmingham/Manchester)

### Approach B (Distressed Company)
- **Expected:** 5-20 properties
- **After visual exclusion:** 3-10 viable
- **Geography:** Wherever companies in liquidation exist

---

## ⚠️ Common Issues

### Issue: SearchLand AI skips a filter
**Solution:** 
- Note in VALIDATION_LOG.md
- Manually add the filter in SearchLand UI
- Re-run search
- Document in LEARNINGS_DATABASE.md

### Issue: 0 results
**Solution:**
- Check if PTAL filter is too restrictive (London only)
- Remove PTAL filter and try UK-wide
- Relax other constraints (e.g., allow <2 storeys higher)

### Issue: Too many results (100+)
**Solution:**
- Add more restrictive filters
- Focus on specific postcodes
- Increase minimum size or other thresholds

---

## 🔄 Iteration Process

If results are poor:
1. Document issues in VALIDATION_LOG.md
2. Update approach prompt (fix filter syntax)
3. Re-test in SearchLand
4. Compare results

**Track iterations:**
```markdown
## Approach A - Iteration 1 (Original)
- Result: 3 properties (too few)
- Issue: PTAL London-only too restrictive

## Approach A - Iteration 2 (Removed PTAL)
- Result: 25 properties (good!)
- Issue: None - proceeding
```

---

## ✅ When Stage 4 is Complete

**For each approach:**
- [x] SearchLand AI screenshot captured
- [x] Filter validation complete
- [x] Property screenshots taken
- [x] Visual exclusions documented
- [x] Shortlist identified (5-15 properties)
- [x] VALIDATION_LOG.md updated

**Then proceed to:**
- **Stage 5:** Multi-LLM property analysis
- **Stage 6:** Deep research on top properties

---

## 📞 Quick Help

**Where are the prompts?**
→ `03_PARALLEL_TESTING/Approach[LETTER]_ReadyToTest.md`

**Where do screenshots go?**
→ `04_REFINEMENT/Screenshots/`

**What do I name screenshots?**
→ `Approach[LETTER]_SearchLandOutput.jpg` (filters)
→ `Approach[LETTER]_Property_[ShortAddress].jpg` (properties)

**Where do I track validation?**
→ `04_REFINEMENT/VALIDATION_LOG.md`

**Which approach should I test first?**
→ **Approach B** (Distressed Company) - highest motivation signals
→ OR **Approach A** (Precedent) - most comprehensive

---

**Status:** Ready to start testing! 🚀  
**Next Step:** Copy Approach A or B prompt → Paste into SearchLand → Screenshot → Search

