# Restarting Critique After Database Updates

**Date:** 2025-11-24  
**Context:** Filter documentation updated in v5.2.3 - Need to re-validate approaches with new knowledge

---

## What Changed in v5.2.3

**Major Filter Documentation Updates:**
- ✅ **Building use group** (17 values) - Just added
- ✅ **Planning constraints** (34 values) - Just added
- ✅ **Property classification** (~500+ values) - Previously added
- ✅ **PTAL** (9 values) - Previously added
- ✅ **Property type** (5 values) - Previously added
- ✅ **Tenure** (5 values) - Previously added

**Files Updated:**
- `SearchlandContext/AvailableFiltersInSearchLand_ACTUAL.md` - Complete value lists
- `LEARNINGS_DATABASE.md` - Strategic guidance and examples
- `CRITICAL_FILTERS_TO_DOCUMENT.md` - All high + medium priority complete

**Impact:** LLMs now have comprehensive knowledge of list-based filters with exact operators and values.

---

## Why Restart Critique?

**Before v5.2.3:**
- LLMs might have invalidated approaches due to missing filter knowledge
- Uncertain about valid operators (`contains any` vs `is one of`)
- No strategic guidance on Planning constraints (e.g., "Built up areas" is POSITIVE)

**After v5.2.3:**
- Complete filter value lists available
- Exact operators documented
- Strategic use cases and combinations provided
- Common errors and correct examples included

**Result:** Approaches marked INVALID/CONDITIONAL may now be VALID with proper filter knowledge.

---

## Decision Tree: What to Restart

### Scenario 1: Fresh Project (No Approaches Yet)
**Action:** Run full workflow with updated knowledge
```bash
cd projects/[YourProject]/.agents
./RUN_ALL_v5.sh
```
**Result:** Approaches generated with complete filter knowledge from start.

---

### Scenario 2: Existing Project - Approaches INVALID Due to Filter Issues
**Action:** Re-run critique + iteration + synthesis (keep existing generations)
```bash
cd projects/MixedUse-8Storey-2M-v20/.agents

# Step 1: Re-run critique with updated database
./orchestrate_crossvalidation.sh

# Step 2: Check for disagreements (should be fewer now)
cat ../02_VALIDITY_CHECK/DISAGREEMENT_ANALYSIS.md

# Step 3: Run iteration if needed
./orchestrate_technical_iteration.sh

# Step 4: Re-synthesize with new validation results
./orchestrate_synthesis.sh

# Step 5: Check updated validation matrix
cat ../02_VALIDITY_CHECK/FINAL_ValidationMatrix.md
```
**Result:** Existing approaches re-evaluated with proper filter knowledge, potentially upgrading INVALID → VALID.

---

### Scenario 3: Existing Project - Approaches Already VALID
**Action:** Optional re-run to refine strategic guidance
```bash
cd projects/[YourProject]/.agents

# Only if you want updated strategic insights
./orchestrate_crossvalidation.sh
./orchestrate_synthesis.sh
```
**Result:** Approaches remain VALID, but may gain enhanced strategic commentary.

---

### Scenario 4: Full Regeneration (Nuclear Option)
**Action:** Complete restart with updated knowledge
```bash
cd projects/[YourProject]/.agents

# Option A: Backup existing work
cp -r ../01_DIVERGENT_GENERATION ../01_DIVERGENT_GENERATION_BACKUP
cp -r ../02_VALIDITY_CHECK ../02_VALIDITY_CHECK_BACKUP

# Option B: Full regeneration
./RUN_ALL_v5.sh
```
**Result:** Fresh approaches generated with complete filter knowledge, previous work preserved in backups.

---

## Recommended Approach for v20 Project

**Current Status:**
- Project: MixedUse-8Storey-2M-v20
- Phase: Likely has existing approaches from earlier generation
- Database: Just updated with Building use group + other filters

**Recommendation: Scenario 2 (Re-run Critique)**

### Step-by-Step Execution

```bash
# 1. Navigate to project
cd /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v20/.agents

# 2. Verify updated reference materials are present
ls -lh ../00_REQUIREMENTS/AvailableFiltersInSearchLand_ACTUAL.md
ls -lh ../00_REQUIREMENTS/LEARNINGS_DATABASE.md
ls -lh ../00_REQUIREMENTS/CRITICAL_FILTERS_TO_DOCUMENT.md

# 3. Backup existing critique results (optional)
cp -r ../02_VALIDITY_CHECK ../02_VALIDITY_CHECK_PRE_v5.2.3

# 4. Re-run critique with updated knowledge
./orchestrate_crossvalidation.sh

# Wait for completion (~5-10 minutes)

# 5. Check disagreement analysis
cat ../02_VALIDITY_CHECK/DISAGREEMENT_ANALYSIS.md

# 6. Run iteration if disagreements exist
if [ -f "../02_VALIDITY_CHECK/DISAGREEMENT_ANALYSIS.md" ]; then
    ./orchestrate_technical_iteration.sh
fi

# 7. Re-synthesize
./orchestrate_synthesis.sh

# 8. Compare results
echo "=== BEFORE v5.2.3 ==="
cat ../02_VALIDITY_CHECK_PRE_v5.2.3/FINAL_ValidationMatrix.md

echo "=== AFTER v5.2.3 ==="
cat ../02_VALIDITY_CHECK/FINAL_ValidationMatrix.md
```

---

## Expected Improvements

### Filter Validation
**Before:** LLMs might reject approaches using "Planning constraints" or "Building use group" (unknown filters)  
**After:** Approaches using these filters validated correctly

### Operator Syntax
**Before:** Uncertainty about `is one of` vs `contains any`  
**After:** Exact operators documented per filter

### Strategic Guidance
**Before:** No guidance on Planning constraints interpretation  
**After:** Clear guidance (e.g., "Built up areas" = urban context, not a blocker)

### Value Lists
**Before:** LLMs guessing at valid values  
**After:** Complete value lists for all high-priority filters

---

## Quality Checks After Restart

### 1. Validation Matrix Comparison
```bash
# Check if more approaches marked VALID
diff ../02_VALIDITY_CHECK_PRE_v5.2.3/FINAL_ValidationMatrix.md \
     ../02_VALIDITY_CHECK/FINAL_ValidationMatrix.md
```

**Look for:**
- INVALID → VALID upgrades
- CONDITIONAL → VALID upgrades
- Reduced disagreements between LLMs

### 2. Disagreement Reduction
```bash
# Before: Check old disagreements
cat ../02_VALIDITY_CHECK_PRE_v5.2.3/DISAGREEMENT_ANALYSIS.md | grep "DISAGREEMENT:"

# After: Check new disagreements
cat ../02_VALIDITY_CHECK/DISAGREEMENT_ANALYSIS.md | grep "DISAGREEMENT:"
```

**Expected:** Fewer filter-related disagreements, remaining disagreements are strategic (preserved).

### 3. Ready-to-Test Count
```bash
# Count approaches ready for testing
ls ../03_PARALLEL_TESTING/*ReadyToTest.md | wc -l
```

**Expected:** Equal or higher count compared to pre-v5.2.3.

### 4. ExecutiveSummary Update
```bash
# Check updated summary
cat ../ExecutiveSummary.md
```

**Expected:** Updated approach count, validation status, next steps reflect new filter knowledge.

---

## Troubleshooting

### Issue: No change in validation results
**Cause:** Existing approaches didn't use newly documented filters  
**Solution:** This is fine - new knowledge available for future approaches

### Issue: More INVALID approaches after restart
**Cause:** Stricter validation with complete operator knowledge  
**Solution:** Review iteration results - technical fixes should resolve

### Issue: LLM CLI rate limits
**Cause:** Claude CLI often hits rate limits  
**Solution:** Use manual execution mode (see REPEATABLE_PROPERTY_WORKFLOW.md)

### Issue: Disagreements not resolved after iteration
**Cause:** Strategic differences (not technical)  
**Solution:** This is expected - Phase 2 synthesis handles strategic diversity

---

## Manual Execution Alternative

If CLI tools fail, run manually:

### Step 1: Prepare Context
```bash
cd /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v20

# Gather all context files
cat 00_REQUIREMENTS/*.md \
    01_DIVERGENT_GENERATION/*.md \
    ../../FILTER_PATTERNS.md \
    ../../LEARNINGS_DATABASE.md \
    ../../SearchlandContext/AvailableFiltersInSearchLand_ACTUAL.md
```

### Step 2: Get Critique Prompt
```bash
cd .agents
source PROMPTS_CONFIG.sh
echo "$PROMPT_CRITIQUE"
```

### Step 3: Run in Web Interface
- Copy context + prompt to Claude.ai, Gemini, etc.
- Get critique output
- Save to `02_VALIDITY_CHECK/Gemini_Critique.md` (or appropriate LLM)

### Step 4: Continue Workflow
```bash
# After all critiques saved manually
./orchestrate_synthesis.sh
```

---

## Success Indicators

✅ **Critique Complete:**
- 4 new critique files in `02_VALIDITY_CHECK/`
- Disagreement analysis updated
- Fewer filter-related disagreements

✅ **Synthesis Complete:**
- Updated `FINAL_ValidationMatrix.md`
- Updated `ExecutiveSummary.md`
- New/updated `ApproachX_ReadyToTest.md` files

✅ **Knowledge Applied:**
- Approaches reference exact filter values from documentation
- Operators match documented syntax
- Strategic guidance incorporated (e.g., Planning constraints usage)

---

## Next Steps After Restart

1. **Review Updated Validation Matrix**
   - Check for upgraded approaches (INVALID → VALID)
   - Note new strategic insights

2. **Test Ready-to-Test Approaches**
   - Follow Stage 4 workflow (REPEATABLE_PROPERTY_WORKFLOW.md)
   - Validate SearchLand AI parsing with new filter knowledge

3. **Capture New Learnings**
   - Document any remaining issues in LEARNINGS_DATABASE.md
   - Update CHANGELOG.md with restart results if significant

4. **Continue to Stage 5-6**
   - Multi-LLM property analysis
   - Deep research and dossier creation

---

**Version:** v5.2.3  
**Last Updated:** 2025-11-24  
**Status:** Ready for Execution

