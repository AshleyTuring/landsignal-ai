---

# VALIDATION SUMMARY

## Overall Results

| Approach | Strategic Angle | Validation | Issues | Assessment |
|----------|----------------|------------|--------|------------|
| 1. Urban Site Replication | Precedent | PASS | 1 Minor | ✅ VALID |
| 2. London PTAL-Based | Precedent | PASS | 1 Minor | ✅ VALID |
| 3. Motivated Commercial | Precedent | PASS | 1 Minor | ✅ VALID |
| 4. Lease Expiry + EPC | Regulation | PASS | 1 Minor | ✅ VALID |
| 5. Airspace Development | Structural | PASS | 1 Minor | ✅ VALID |
| 6. Stalled Planning | Structural | CONDITIONAL | 1 Major | ⚠️ CONDITIONAL |
| 7. Corporate Liquidation | Behavioral | PASS | 0 | ✅ VALID |
| 8. Combined Motivation | Behavioral | PASS | 0 | ✅ VALID |
| 9. Emerging Allocations | Challenge | PASS | 1 Minor | ✅ VALID |
| 10. Strategic Land | Challenge | CONDITIONAL | 2 Minor | ⚠️ CONDITIONAL |

## Key Fixes Required Before Testing

### Recurring Issue (Approaches 1-5):
**"Freehold tenure"** → Change to: `Tenure: is equal to Freehold`

### Approach 6 - Major Fix:
Add: `Tenure: is equal to Freehold` (filter 8)

### Approaches 9 & 10 - Verify:
Check exact "Ownership type" dropdown value - may be "Private" not "Private owner"

## Capital Feasibility Check (£200k)

All approaches pass capital feasibility:
- **Approaches 7, 3:** Direct purchase viable at distressed pricing
- **Approaches 5, 6:** Airspace rights/option agreements £50k-£150k
- **Approaches 4, 8:** Option agreements £10k-£50k
- **Approaches 9, 10:** Strategic options £5k-£50k + promotion costs

## Recommended Testing Priority

1. **Approach 7** - Corporate Liquidation (0 issues, strongest signal)
2. **Approach 5** - Airspace Development (1 minor fix)
3. **Approach 8** - Combined Motivation (0 issues)
4. **Approach 4** - Lease Expiry + EPC (1 minor fix)
5. **Approach 3** - Motivated Commercial (1 minor fix)

Then proceed with remaining approaches after initial testing validates filter behavior.
