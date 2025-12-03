# Critical Filters Needing Documentation

**Purpose:** List-based filters that LLMs frequently use and need exact value lists

**Status:** 🔴 HIGH PRIORITY - These cause the most validation errors

---

## ✅ COMPLETED - HIGH PRIORITY

1. **Use class** ✅ - All 34 values documented
2. **Ownership type** ✅ - All 5 values documented (Corporate, Council, Housing Association, Company, Private owner)
3. **Property type** ✅ - All 5 values documented (Detached, Semi-Detached, Terraced, Flat, Commercial)
4. **Tenure** ✅ - All 5 values documented (Leasehold, Freehold, Pending first registration, Caution against first registration, Rentcharge)
5. **Property classification** ✅ - All ~500+ values documented across 24 major categories
6. **PTAL** ✅ - All 9 values documented (0 (Worst), 1a, 1b, 2, 3, 4, 5, 6a, 6b (Best))
7. **Planning constraints** ✅ - All 34 values documented (Green Belt, Conservation Area, Flood Zones, SSSI, Housing Zones, Opportunity Areas, etc.)

## ✅ COMPLETED - MEDIUM PRIORITY

8. **Building use group** ✅ - All 17 values documented (Mixed Use, Commercial Activity: Retail, Residential Accommodation, etc.)

---

## 🎉 ALL HIGH + MEDIUM PRIORITY FILTERS COMPLETED!

---

## 🟡 MEDIUM PRIORITY

### 6. Building use group
**Why Critical:** Related to Use class, potential for confusion
**Current Status:** ❌ Not documented
**Provide HTML for:** Building use group filter

### 7. VOA property description
**Why Critical:** May have predefined values
**Current Status:** ❌ Unknown if list-based or free text
**Provide HTML for:** VOA property description filter

### 8. Planning decision
**Why Critical:** Approved/Refused/Pending options
**Current Status:** ❌ Not documented
**Expected Values:** Approved, Refused, Pending, Withdrawn, etc.
**Provide HTML for:** Planning decision filter

---

## 🟢 LOW PRIORITY (Less Common)

### 9. Listed building grade
**Expected Values:** I, II*, II, etc.
**Provide HTML for:** Listed building grade filter

### 10. Conservation area designation
**Provide HTML for:** Conservation area filter

---

## How to Provide HTML

For each filter above, please provide the HTML from SearchLand's UI showing:
1. The operator dropdown (e.g., "contains any", "is one of", "does not contain")
2. The checkbox list of available values

**Example format (like you provided for Use class and Ownership type):**
```html
<div class="MuiPaper-root MuiPaper-elevation...">
  <!-- Operator section -->
  <p>contains any</p> or <p>is one of</p>
  
  <!-- Value checkboxes -->
  <li>Value 1</li>
  <li>Value 2</li>
  ...
</div>
```

---

## Priority Order for Documentation:

1. **Property type** (HIGHEST - used in 90%+ of approaches)
2. **Tenure** (HIGH - common motivation filter)
3. **Property classification** (HIGH - confusion with Use class)
4. **Planning constraints** (HIGH - common exclusions)
5. **PTAL** (MEDIUM - urban searches)
6. Rest as you have time

---

**Once you provide the HTML, I will:**
1. Extract the exact values
2. Update `AvailableFiltersInSearchLand_ACTUAL.md`
3. Add examples to `LEARNINGS_DATABASE.md`
4. Update `FILTER_PATTERNS.md`
5. Update v20 project with corrected references

