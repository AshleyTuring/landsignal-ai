---

# VALIDATION SUMMARY

## Overall Results

| Approach | Validation | Key Issue |
|----------|------------|-----------|
| 1. Urban Site Replication | CONDITIONAL | Tenure syntax |
| 2. London PTAL-Based | CONDITIONAL | Tenure syntax |
| 3. Motivated Commercial | CONDITIONAL | Tenure syntax |
| 4. Lease Expiry + EPC | CONDITIONAL | Tenure syntax |
| 5. Airspace Development | CONDITIONAL | Tenure syntax |
| 6. Stalled Planning | CONDITIONAL | Missing tenure |
| 7. Corporate Liquidation | **VALID** | Minor (add tenure) |
| 8. Combined Motivation | **VALID** | Minor (add tenure) |
| 9. Emerging Allocations | CONDITIONAL | Enum values unverified |
| 10. Strategic Land | CONDITIONAL | Ownership type value |

## Critical Fixes Required

### Recurring Issue: "Freehold tenure" Syntax
**Affects:** Approaches 1, 2, 3, 4, 5

**Problem:** "Freehold tenure" is not valid filter syntax

**Fix:** Change to: `Tenure: is equal to Freehold`

### Enum Value Verification Needed
**Affects:** Approaches 9, 10

**Problem:** "Private owner" should likely be "Private individual"

**Fix:** Verify exact values in SearchLand dropdown before testing

### PTAL/Site Allocation Values
**Affects:** Approaches 2, 9

**Problem:** Need to confirm exact enum values accepted by SearchLand

**Fix:** Check dropdown options in SearchLand interface

## Ready to Test (After Fixes)

**Immediately ready:**
- Approach 7: Corporate Liquidation/Distress ✅
- Approach 8: Combined Motivation Signals ✅

**Ready after tenure syntax fix:**
- Approaches 1, 2, 3, 4, 5

**Ready after enum verification:**
- Approaches 9, 10

## Capital Feasibility Check

All approaches pass £200k capital test:
- Liquidation sales can be acquired <£200k distressed
- Option agreements £10k-£150k entry
- Airspace rights £50k-£150k
- Strategic options £5k-£50k

No capital feasibility issues identified.
