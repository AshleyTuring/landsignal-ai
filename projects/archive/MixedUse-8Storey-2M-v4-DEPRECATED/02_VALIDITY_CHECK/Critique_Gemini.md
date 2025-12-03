---

# VALIDATION SUMMARY

## Overall Results

| Approach | Strategic Angle | Validation | Status |
|----------|----------------|------------|--------|
| 1. Urban Site Replication | Precedent | PASS | VALID |
| 2. London PTAL-Based | Precedent | PASS | VALID |
| 3. Motivated Commercial | Precedent | PASS | VALID |
| 4. Lease Expiry + EPC | Regulation | PASS | VALID |
| 5. Airspace Development | Structural | PASS | CONDITIONAL |
| 6. Stalled Planning Option | Structural | **FAIL** | **INVALID** |
| 7. Corporate Liquidation | Behavioral | PASS | VALID |
| 8. Combined Motivation | Behavioral | PASS | VALID |
| 9. Fresh Emerging Allocations | Challenge | PASS | CONDITIONAL |
| 10. Strategic Land Promotion | Challenge | **FAIL** | **INVALID** |

---

## Critical Issues Requiring Revision

### Approach 6: Stalled Planning Option Play
**Issue:** Missing `Tenure: is equal to Freehold` filter - critical for option agreement strategy

**Revised Filters:**
```
1. Title area (acres): is greater than 0.25 AND less than 3
2. Proposal: contains "storey"
3. Max number of dwellings applied for: is greater than 10
4. Last application submitted: is before 2022-01-01
5. Building on title is inactive: is equal to Yes
6. Distance to nearest Train Station (m): is less than 1000
7. Percentage of title covered by Flood Zone 3: is equal to 0
8. Tenure: is equal to Freehold  ← ADDED
```

### Approach 10: Strategic Land Promotion
**Issue:** `Applications in the last 5 years: is equal to 0` is CRITICAL - will return near-zero results

**Revised Filters:**
```
1. Title area (acres): is greater than 1 AND less than 10
2. Developed area percentage: is less than 5
3. Distance to nearest adopted settlement boundary (m): is less than 500  ← CHANGED from 200m
4. Applications in the last 5 years: is less than 2  ← CHANGED from = 0
5. Ownership type: is one of Private owner
6. Percentage of title covered by Flood Zone 3: is equal to 0
7. Percentage of plot un-constrained: is greater than 75
```

---

## Conditional Approaches - Minor Fixes Needed

### Approach 5: Airspace Development
**Add:** `Title area (acres): is greater than 0.1 AND less than 1`

### Approach 9: Fresh Emerging Allocations
**Verify:** Exact enum values in SearchLand for "Site allocation type" and "Ownership type: Private owner"

---

## Recurring Minor Issue

All approaches 1-4, 6 use "Freehold tenure" shorthand. For clarity, ensure consistent syntax:
```
Tenure: is equal to Freehold
```

---

## Testing Priority Recommendation (Updated)

Based on technical validation:

1. **Approach 7** - Corporate Liquidation (VALID, strongest motivation)
2. **Approach 5** - Airspace Development (CONDITIONAL, add area filter)
3. **Approach 4** - Lease Expiry + EPC (VALID)
4. **Approach 3** - Motivated Commercial (VALID)
5. **Approach 6** - Stalled Planning (**REVISED** - add tenure)
6. **Approach 1** - Urban Site Replication (VALID)
7. **Approach 8** - Combined Motivation (VALID)
8. **Approach 2** - London PTAL (VALID, London-only)
9. **Approach 9** - Fresh Allocations (CONDITIONAL, verify enums)
10. **Approach 10** - Strategic Land (**REVISED** - fix applications filter)
