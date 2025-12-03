# Stage 4: Refinement & Validation

**Purpose:** Validate SearchLand AI filter parsing and refine approaches based on actual results

**Duration:** 2-4 hours per approach (depending on result count)

**Prerequisites:** Phase 2 complete (ready-to-test approaches extracted)

---

## Workflow Overview

```
Ready-to-Test Approach
    ↓
Step 0: Create Executive Summary
    ↓
Step 1: Copy SearchLand AI prompt
    ↓
Step 2: Paste screenshot (validation)
    ↓
Step 3: Run validation script
    ↓
Step 4: Update prompts + LEARNINGS_DATABASE.md
    ↓
Step 5: Document results & screenshots
    ↓
Refined Approach → Stage 5
```

---

## Step 0: Create Executive Summary

**For each approach (A, B, C...), create:**

`04_REFINEMENT/ExecutiveSummary_ApproachX.md`

**Use template:** `../templates/ExecutiveSummary_Template.md`

**Key fields to populate initially:**
- Approach name and letter
- Key criteria (filters from ready-to-test file)
- Expected results (from original approach generation)
- Justification (strategic rationale)
- Strengths & Limitations
- Capital breakdown
- **"Based On"** field (critical - link to preset/pattern used)

**This file tracks ALL refinement steps and becomes the living document for this approach.**

---

## Step 1: Copy SearchLand AI Prompt

1. Open `03_PARALLEL_TESTING/ApproachX_ReadyToTest.md`
2. Copy the **SearchLand AI Prompt** section (numbered filter list)
3. Go to **SearchLand.co.uk**
4. Click "Create Custom Search" or "AI Search"
5. Paste the prompt

**Example:**
```
1. Title area (acres): is greater than 0.25 AND less than 2
2. Ownership type: is equal to Company
3. Company status: is one of Liquidation, In Administration
4. Building on title is inactive: is equal to Yes
5. Max building height on title (m): is less than 12
```

---

## Step 2: Paste Screenshot (Validation)

**Critical step - visual validation of filter parsing**

1. After pasting prompt, **DO NOT click "Search" yet**
2. Look at what filters SearchLand AI actually created
3. Take screenshot showing:
   - All filters created by AI
   - Any parsing errors or misinterpretations
   - Missing filters
   - Unit conversions (if any)

4. Save screenshot as:
   `04_REFINEMENT/Screenshots/ApproachX_SearchLandOutput.jpg`

**Common issues to check visually:**
- ✅ All filters from prompt are present?
- ✅ Correct units? (acres not sqm, sqft not sqm, metres not feet)
- ✅ Correct operators? ("is greater than" vs "is equal to")
- ✅ Correct values? (0.25 acres not 25 acres)
- ✅ AND/OR logic correct?

---

## Step 3: Run Validation Script

**Script:** `04_REFINEMENT/validate_searchland_output.sh` (TBD - manual for now)

**Manual validation checklist:**

| Filter # | Intended | Actual | Status | Issue |
|----------|----------|--------|--------|-------|
| 1 | Title area > 0.25 acres | Title area > 0.25 acres | ✅ OK | None |
| 2 | Ownership = Company | Ownership = Company | ✅ OK | None |
| 3 | Company status = Liquidation | Company status = Liquidation | ✅ OK | None |
| 4 | Inactive = Yes | [Missing] | ❌ ERROR | Filter not created |
| 5 | Max height < 12m | Max height < 12 **acres** | ❌ ERROR | Wrong unit |

**Document in:** `04_REFINEMENT/VALIDATION_LOG.md`

**If all ✅ OK → proceed to search**  
**If any ❌ ERROR → fix prompt, re-paste, re-screenshot (iterate Steps 1-3)**

---

## Step 4: Update Prompts + LEARNINGS_DATABASE.md

### A. Fix Prompt Issues

**If errors found in Step 3, update the prompt:**

**Example fix - Missing filter:**
```
OLD: 
4. Building on title is inactive: is equal to Yes

NEW (more explicit):
4. Building on title is inactive: Yes
```

**Example fix - Wrong unit:**
```
OLD:
5. Max building height on title (m): is less than 12

NEW (specify unit explicitly):
5. Max building height on title: is less than 12 metres
```

**Save updated prompt in Executive Summary under "Recommended Tweaks" section.**

### B. Update LEARNINGS_DATABASE.md

**Critical - Capture universal insights**

**If you discover:**
- SearchLand AI misinterprets certain syntax → document in "SearchLand AI Parsing Quirks"
- New filter behavior → document in "Filter Interpretation & Behavior"
- Unit issues → document in "Unit Conventions"
- Working workaround → document in "Proxy Filter Strategies"

**Example learning:**
```markdown
### "Building on title is inactive" - Parsing Issue

**Discovered:** 2025-11-20 (Project: MixedUse-8Storey-2M-v5, Approach A)

**Issue:** 
SearchLand AI skips this filter when phrased as:
"Building on title is inactive: is equal to Yes"

**Workaround:**
Use shortened syntax:
"Building on title is inactive: Yes"

**Performance:**
✅ Tested in Approach A - filter created correctly with shortened syntax
```

**This learning helps ALL future projects!**

---

## Step 5: Document Results & Screenshots

### A. Run Search & Document Result Counts

1. Click "Search" in SearchLand
2. Note total result count
3. Test across multiple geographies (if applicable)

**Update Executive Summary - Results Summary table:**

| Geography | Result Count | Quality Notes |
|-----------|--------------|---------------|
| Slough | 12 properties | Mix of commercial/residential |
| Birmingham | 8 properties | Mostly residential |
| Manchester | 5 properties | All in city centre |
| London | 0 properties | Over-constrained (liquidation rare) |
| **TOTAL** | **25 properties** | Good diversity |

### B. Screenshot Each Property

**For each property in results:**

1. Click property in SearchLand
2. View aerial/satellite view
3. Take screenshot showing:
   - Property outline
   - Surrounding context
   - Any obvious constraints (roads, rivers, green space)

4. Save as:
   `04_REFINEMENT/Screenshots/ApproachX_PropertyAddress.jpg`
   
   Example filename:
   `04_REFINEMENT/Screenshots/ApproachA_123HighStreetSlough.jpg`

### C. Visual Exclusion

**Immediately exclude obviously non-relevant sites:**

- ✅ Keep: Properties that match criteria visually
- ❌ Exclude: 
  - Too small (visual check vs expected size)
  - Wrong property type (e.g., residential when seeking commercial)
  - Obvious constraints (flood zone, conservation area visible on map)
  - No development potential (surrounded by protected land)

**Document exclusions in Executive Summary:**

**Properties Removed in Refinement:**
1. `123 High Street, Slough` - Too small (visual check shows ~100sqm, need 500+sqm)
2. `456 Main Road, Birmingham` - Adjacent to listed building (constraint)
3. `789 Park Lane, Manchester` - Flood zone 3 visible on map

**Updated count:** 25 → 22 properties (3 excluded visually)

### D. Update Executive Summary

**Final update for Stage 4:**

1. **Expected Results** → Update with actual counts
2. **Results Summary** → Populate table with real data
3. **Properties Identified** → List all addresses
4. **Properties Removed in Refinement** → List excluded properties with reasons
5. **Final Shortlist** → 22 properties advancing to Stage 5

**Mark approach as:** `Status: REFINED - Ready for Stage 5 (Site Validation)`

---

## Quality Gates

**Before proceeding to Stage 5:**

- [ ] Executive Summary created and fully populated
- [ ] SearchLand AI output screenshot saved
- [ ] Validation performed (all filters correct or issues fixed)
- [ ] Prompt updated if issues found
- [ ] LEARNINGS_DATABASE.md updated with new insights
- [ ] Result counts documented per geography
- [ ] Property screenshots saved (all properties)
- [ ] Visual exclusion completed (non-relevant sites removed)
- [ ] Executive Summary updated with final shortlist

**If any step incomplete → do NOT proceed to Stage 5**

---

## Common Issues & Solutions

### Issue 1: 0 Results

**Diagnosis:**
- Over-constrained filters
- Geography doesn't have any properties meeting criteria
- Filter syntax error (SearchLand didn't apply filters)

**Solutions:**
1. Check validation log - were all filters applied?
2. Test with fewer filters (remove most restrictive)
3. Test different geography
4. Review LEARNINGS_DATABASE.md for known restrictive filters

**Document in Executive Summary under "Limitations"**

---

### Issue 2: 500+ Results

**Diagnosis:**
- Under-constrained (filters too broad)
- Wrong units (e.g., 0.25 acres became 0.25 sqm = tiny)

**Solutions:**
1. Add more restrictive filters
2. Check units in validation
3. Narrow geography (e.g., London only instead of UK-wide)

**Document in Executive Summary under "Recommended Tweaks"**

---

### Issue 3: SearchLand AI Misinterpreted Prompt

**Diagnosis:**
- Wrong filters created
- Wrong units applied
- AND/OR logic incorrect

**Solutions:**
1. Iterate Steps 1-3 with updated syntax
2. Document learning in LEARNINGS_DATABASE.md
3. Test alternative phrasing
4. If persistent issue, mark as "SearchLand AI limitation"

**Critical: Update LEARNINGS_DATABASE.md to prevent future projects hitting same issue**

---

## Next Stage

**After completing Stage 4 for ALL approaches:**

Proceed to **Stage 5: Site Validation**

See: `05_SITE_VALIDATION/README.md`

---

**Stage 4 Complete Checklist:**
- [ ] All approaches have Executive Summaries
- [ ] All SearchLand AI outputs validated
- [ ] All property screenshots saved
- [ ] Visual exclusion completed
- [ ] LEARNINGS_DATABASE.md updated
- [ ] Ready to proceed to multi-LLM property analysis

**Estimated time:** 2-4 hours per approach × number of approaches


