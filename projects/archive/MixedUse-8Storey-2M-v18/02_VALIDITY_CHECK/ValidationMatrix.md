# Validation Matrix

**Project:** [PROJECT_NAME]  
**Date:** [DATE]  
**Approaches Reviewed:** [A, B, C, D, E, F]

---

## Validation Summary

| Approach | Gemini | Codex | Claude | Status | Critical Issues |
|----------|--------|-------|--------|--------|-----------------|
| A: [Name] | ✅/❌   | ✅/❌  | ✅/❌   | VALID/INVALID | [None / Issues] |
| B: [Name] | ✅/❌   | ✅/❌  | ✅/❌   | VALID/INVALID | [None / Issues] |
| C: [Name] | ✅/❌   | ✅/❌  | ✅/❌   | VALID/INVALID | [None / Issues] |
| D: [Name] | ✅/❌   | ✅/❌  | ✅/❌   | VALID/INVALID | [None / Issues] |
| E: [Name] | ✅/❌   | ✅/❌  | ✅/❌   | VALID/INVALID | [None / Issues] |
| F: [Name] | ✅/❌   | ✅/❌  | ✅/❌   | VALID/INVALID | [None / Issues] |

---

## Valid Approaches (Ready for Testing)

**[X] approaches passed validation:**

1. **Approach [X]: [Name]**
   - All filters verified in AvailableFiltersInSearchLand_ACTUAL.md
   - Units correct (acres/sqft/metres)
   - Syntax valid per LEARNINGS_DATABASE.md
   - No logical contradictions

2. **Approach [X]: [Name]**
   - [Same checklist]

[Continue for all valid approaches]

---

## Invalid Approaches (Rejected)

**[X] approaches failed validation:**

### Approach [X]: [Name]
**LLM:** [Gemini/Codex/Claude]  
**Fatal Issues:**
- ❌ [Issue 1 - e.g., Uses non-existent filter "Planning Status: Expired"]
- ❌ [Issue 2 - e.g., Uses sqm units instead of acres]
- ❌ [Issue 3]

**Why This Matters:**
[Explanation of why this breaks the approach]

**Documented in:** `RejectedApproaches.md`

---

## Validation Criteria Used

### ✅ PASS Criteria:
1. All filters exist in `AvailableFiltersInSearchLand_ACTUAL.md`
2. Correct units:
   - Area: acres (NOT sqm/sqmt)
   - Building area: sqft (NOT sqm)
   - Height/distance: metres
3. Valid syntax per `LEARNINGS_DATABASE.md`:
   - Proper operators for filter types
   - No unsupported OR logic in single line
   - Date format: YYYY-MM-DD
4. Logically coherent:
   - No self-contradictory filters
   - Filters work together (not mutually exclusive)
5. Structured output format (numbered list, exact filter names)

### ❌ FAIL Criteria:
- Uses non-existent filter
- Wrong units (sqm/sqmt instead of acres/sqft)
- Invalid syntax (e.g., OR in single line where not supported)
- Logical contradiction (e.g., "Height >25m AND Height <12m")
- Prose description instead of structured filter list

---

## Next Steps

### For Valid Approaches:
1. Proceed to Stage 3: Parallel Testing
2. Test in SearchLand AI
3. Document results in `03_PARALLEL_TESTING/Approach[X]_Results.md`

### For Invalid Approaches:
1. Document in `RejectedApproaches.md`
2. Check if learnings should update `LEARNINGS_DATABASE.md`
3. Consider if approach can be salvaged with modifications

---

## Notes

[Any observations from the validation process, common issues across approaches, etc.]

---

**Validated By:** [Gemini + Codex + Claude]  
**Date:** [DATE]  
**Next Stage:** Parallel Testing (Stage 3)

