# Stage 4: SearchLand AI Validation Log

**Project:** MixedUse-8Storey-2M-v20  
**Date Started:** 2025-11-24

---

## Approach A: High-Density Precedent Replication

### SearchLand AI Parsing - [Date]

**Screenshot:** `Screenshots/ApproachA_SearchLandOutput.jpg`

**Intended Filters (From Approach A):**
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

**Validation Results:**

| Filter # | Intended | Actual (from screenshot) | Status | Issue |
|----------|----------|--------------------------|--------|-------|
| 1 | Proposal: contains "Approved" OR "Permission Granted" | [Fill from screenshot] | ✅/❌ | [Issue or OK] |
| 2 | Proposal: contains "Mixed Use" OR "mixed-use" | [Fill from screenshot] | ✅/❌ | [Issue or OK] |
| 3 | Proposal: contains "storey" OR "storeys" | [Fill from screenshot] | ✅/❌ | [Issue or OK] |
| 4 | Max building height (m): > 18 | [Fill from screenshot] | ✅/❌ | [Issue or OK] |
| 5 | Title area (acres): > 0.1 AND < 0.6 | [Fill from screenshot] | ✅/❌ | [Issue or OK] |
| 6 | Distance to Train Station (m): < 800 | [Fill from screenshot] | ✅/❌ | [Issue or OK] |
| 7 | PTAL: is one of 3,4,5,6a,6b | [Fill from screenshot] | ✅/❌ | [Issue or OK] |
| 8 | Planning constraints: does not contain [...] | [Fill from screenshot] | ✅/❌ | [Issue or OK] |
| 9 | Applications in last 5 years: < 3 | [Fill from screenshot] | ✅/❌ | [Issue or OK] |
| 10 | Building inactive OR derelict | [Fill from screenshot] | ✅/❌ | [Issue or OK] |

**Summary:**
- ✅ Filters Created Correctly: [X/10]
- ❌ Filters with Issues: [X/10]

**Issues Found:**
- [List any issues and proposed fixes]

**Updated for LEARNINGS_DATABASE.md:**
- [Any universal learnings to capture]

---

### Search Results - [Date]

**Result Count by Geography:**
- [City 1]: [X] properties
- [City 2]: [X] properties
- [City 3]: [X] properties
- **TOTAL:** [X] properties

---

### Visual Exclusions - [Date]

**Properties Excluded (Screenshot Review):**

| Property Address | Screenshot | Reason for Exclusion |
|------------------|------------|---------------------|
| [Address] | `Screenshots/ApproachA_Property_[Name].jpg` | Too small / Wrong type / Flood zone |
| [Address] | `Screenshots/ApproachA_Property_[Name].jpg` | [Reason] |

**Summary:**
- Initial results: [X]
- After visual exclusion: [Y]
- Exclusion rate: [Z]%

---

### Properties Advancing to Stage 5

**Shortlisted Properties (After Visual Screening):**

| # | Property Address | Screenshot | Notes |
|---|------------------|------------|-------|
| 1 | [Full Address, Postcode] | `Screenshots/ApproachA_Property_[Name].jpg` | [Brief notes] |
| 2 | [Full Address, Postcode] | `Screenshots/ApproachA_Property_[Name].jpg` | [Brief notes] |
| 3 | [Full Address, Postcode] | `Screenshots/ApproachA_Property_[Name].jpg` | [Brief notes] |

---

## Approach B: Distressed Company Mixed-Use

### SearchLand AI Parsing - [Date]

**Screenshot:** `Screenshots/ApproachB_SearchLandOutput.jpg`

**Intended Filters (From Approach B):**
```
1. Ownership type: is one of Company
2. Company status: is one of Liquidation, In Administration
3. Use class: contains any [E - Commercial Business and Service, Mixed Use]
4. Building on title is derelict: Yes
5. Distance to nearest Train Station (m): is less than 1200
6. Title area (acres): is greater than 0.1 AND less than 0.7
7. Sales listing currently on the market: Yes
8. Sales listing price: is less than £400,000
9. Applications in last 5 years: is less than 2
10. Planning constraints: does not contain [Conservation Area]
```

**Validation Results:**

| Filter # | Intended | Actual (from screenshot) | Status | Issue |
|----------|----------|--------------------------|--------|-------|
| 1 | Ownership type: is one of Company | [Fill from screenshot] | ✅/❌ | [Issue or OK] |
| 2 | Company status: Liquidation, Administration | [Fill from screenshot] | ✅/❌ | [Issue or OK] |
| 3 | Use class: contains any [E, Mixed Use] | [Fill from screenshot] | ✅/❌ | [Issue or OK] |
| 4 | Building derelict: Yes | [Fill from screenshot] | ✅/❌ | [Issue or OK] |
| 5 | Distance to Train Station (m): < 1200 | [Fill from screenshot] | ✅/❌ | [Issue or OK] |
| 6 | Title area (acres): > 0.1 AND < 0.7 | [Fill from screenshot] | ✅/❌ | [Issue or OK] |
| 7 | Sales listing on market: Yes | [Fill from screenshot] | ✅/❌ | [Issue or OK] |
| 8 | Sales listing price: < £400k | [Fill from screenshot] | ✅/❌ | [Issue or OK] |
| 9 | Applications in last 5 years: < 2 | [Fill from screenshot] | ✅/❌ | [Issue or OK] |
| 10 | Planning constraints: does not contain [CA] | [Fill from screenshot] | ✅/❌ | [Issue or OK] |

**Summary:**
- ✅ Filters Created Correctly: [X/10]
- ❌ Filters with Issues: [X/10]

---

### Search Results - [Date]

**Result Count by Geography:**
- [City 1]: [X] properties
- [City 2]: [X] properties
- **TOTAL:** [X] properties

---

[Continue same format for Approaches C, D, E...]

---

## Stage 4 Summary

**Approaches Tested:** [X/5]  
**Total Properties Identified:** [X]  
**Properties After Visual Exclusion:** [Y]  
**Advancing to Stage 5:** [Z]

**Key Learnings:**
- [Learning 1]
- [Learning 2]

**Updates for LEARNINGS_DATABASE.md:**
- [Universal insight 1]
- [Universal insight 2]

---

**Status:** In Progress  
**Last Updated:** [Date]

