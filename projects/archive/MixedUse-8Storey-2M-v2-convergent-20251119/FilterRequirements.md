# Filter Requirements

## Global Context

**You are an expert UK property analyst and power user of SearchLand.co.uk**

You have been tasked with setting up searchland filters based on user requirements.

### Available Resources:
- `/SearchlandContext/AvailableFiltersInSearchLand_ACTUAL.md` - **USE THIS ONLY** - All REAL filters available in SearchLand
- `/SearchlandContext/PresetFiltersBuiltIntoSearchLand.md` - Pre-configured filters by SearchLand team (learning examples)

### CRITICAL RULES:
1. **Output Format**: Use STRUCTURED LIST FORMAT ONLY (not prose)
   - Example: `1. Title area (acres): is greater than 0.198 AND less than 2.47`
   - NOT: "Look for properties between 8,000-100,000 sqft"
2. **Units**: Use acres/sqft/metres (as shown in ACTUAL filters)
3. **Filter Names**: Use EXACT names from AvailableFiltersInSearchLand_ACTUAL.md
4. **No Assumptions**: If a filter doesn't exist, propose proxy filters

### Search Area Flexibility:
We can easily adjust the search area by local planning authority or by geographic area using their map interface.

---

## Requirement Type

Select either or both:
- [x] **Type 1: Profit & Capital Outlay**
- [x] **Type 2: Similar Planning Applications**

---

## Type 1: Profit & Capital Outlay

**Target Profit:** £2,000,000

**Capital Outlay:** £200,000

**Additional Context:**
- Property type preferences: Mixed-use development opportunities
- Geographic preferences: UK-wide initially
- Risk tolerance: Medium - seeking motivated sellers
- Time horizon: 12-24 months
- Other considerations: Focus on properties with development potential

---

## Type 2: Similar Planning Applications

**Reference Planning Application:**

```
Demolition and construction of an 8-storey mixed-use development comprising 
flexible retail (class E) and residential (Class C3) use with associated communal 
terraces, cycle parking, accessible car parking and waste storage
```

**Additional Context:**
- Geographic area: UK-wide, focusing on urban areas
- Scale preferences (same size, smaller, larger): Same size or larger (8+ storeys)
- Must-have features: Mixed-use (retail + residential), substantial height
- Nice-to-have features: Existing planning approval, motivated sellers
- Exclusions: Properties without development potential

---

## Additional Requirements

**Priority Level:**
- [x] High - Need precise matches
- [ ] Medium - Some flexibility acceptable
- [ ] Low - Exploratory search

**Expected Number of Results:**
- [x] Narrow (10-50 properties)
- [ ] Moderate (50-200 properties)
- [ ] Wide (200+ properties)

**Special Considerations:**
- Targeting properties with £200k capital outlay capability (likely option agreements, vendor finance, or joint ventures)
- Focus on motivation signals (long listing times, expired planning, etc.)
- Seeking substantial upside potential to achieve £2M profit target

---

## Notes

This is v2 of the project, using the corrected System v2.2 which:
- Uses ONLY real filters from AvailableFiltersInSearchLand_ACTUAL.md
- Outputs in STRUCTURED format for direct SearchLand AI input
- Validates through minimum 2 iterations
- Tests immediately in SearchLand interface

Previous attempt (MixedUse-8Storey-2M-20250119) revealed critical issues with:
- Filter units (acres not sqmt)
- Output format (needed structured list)
- Non-existent filters (expired planning status)

