# Filter Iterations Log

## Iteration 1

### 🔵 Gemini's Initial Design

**Filter 1: Expired Planning Permission**
1. Proposal: contains "mixed-use" AND "residential" AND "retail" AND "storey"
2. Last application submitted: is before 2022-01-19
3. Max number of dwellings applied for: is greater than 15
4. Title area (acres): is greater than 0.2 AND less than 3
5. Building on title is inactive: is equal to Yes

**Filter 2: High-Density Urban Redevelopment**
1. TFL Public Transport Accessibility Level (PTAL): is one of 4, 5, 6a, 6b
2. Developed area percentage: is less than 40
3. Max building height on title (m): is less than 12
4. Title area (acres): is greater than 0.25 AND less than 2
5. Sales listing currently on the market: is equal to Yes
6. Percentage of title covered by Green Belt land: is equal to 0

**Filter 3: Motivated Seller (Low Capital Outlay)**
1. Ownership type: is equal to Company
2. Latest sold date: is before 2019-01-19
3. Building on title is derelict: is equal to Yes
4. Distance to nearest Train Station (m): is less than 1000
5. Title area (acres): is greater than 0.25 AND less than 5
6. Use class: contains "E" OR "Sui Generis"

---

### 🟠 Codex's Critique

**Filter 1 – Expired Planning Permission**
- Missing filter: "Planning status: expired/lapsed" doesn't exist in the actual list, so simply using `last application submitted < 2022-01-19` and proposal keywords cannot guarantee that planning consent has expired. Need another proxy (e.g., Applications in last 5 years = 0) or relabel the filter.

**Filter 2 – High-Density Urban Redevelopment**
- Logic mismatch: calling it "High-Density" while demanding `developed area percentage < 40` and `max building height < 12m` actively filters for low built form; this contradicts the requirement rather than enforcing it.

**Filter 3 – Motivated Seller (Low Capital Outlay)**
- Filter name/value mismatch: `Use class: contains "E" OR "Sui Generis"` is invalid because the SearchLand "Use class" filter expects exact class names (e.g., "E – Commercial, Business and Service" or "Sui Generis").
- Missing key filter: nothing limits purchase price or capex despite the "Low Capital Outlay" requirement. An available metric such as `latest sold price`, `sales listing price`, or `latest price per sqmt` should be included.

---

### 🟣 Claude's Synthesis

Codex identified critical flaws. Here are corrected filters:

**Filter 1: Stalled Mixed-Use Development**
1. Proposal: contains "mixed-use" AND "storey"
2. Last application submitted: is before 2023-01-19
3. Applications in the last 5 years: is equal to 0
4. Title area (acres): is greater than 0.2 AND less than 2
5. Building on title is inactive: is equal to Yes
6. Sales listing currently on the market: is equal to Yes
7. Sales listing price: is less than 500000

**Filter 2: High-Density Redevelopment Opportunity**
1. Max building height on title (m): is greater than 15
2. TFL Public Transport Accessibility Level (PTAL): is one of 4, 5, 6a, 6b
3. Title area (acres): is greater than 0.25 AND less than 2
4. Percentage of title covered by Green Belt land: is equal to 0
5. Developed area percentage: is less than 50
6. Sales listing currently on the market: is equal to Yes

**Filter 3: Motivated Corporate Seller (Low Entry)**
1. Ownership type: is equal to Company
2. Latest sold date: is before 2020-01-19
3. Sales listing price: is less than 300000
4. Distance to nearest Train Station (m): is less than 1000
5. Title area (acres): is greater than 0.2 AND less than 3
6. Building on title is derelict: is equal to Yes OR Building on title is inactive: is equal to Yes

**Changes Made:**
- Filter 1: Added price cap + fixed "expired" workaround with "Applications in last 5 years = 0"
- Filter 2: Changed height to ">15m" for 8-storey target, kept developed % <50 for redevelopment potential
- Filter 3: Added explicit price filter (<£300k for £200k capital + costs), fixed use class issue

**Status:** NEEDS REVIEW - Iteration 2

---

## Iteration 2

### 🔵 Gemini's Review

Claude's synthesis is an improvement, but logical flaws and budget mismatches remain. Changes are required.

1. **Are the corrections valid?** Mostly. Claude correctly identified that "Planning status: expired" does not exist and created a valid workaround using `Last application submitted` and `Applications in the last 5 years`. The invalid `Use class` value was also correctly removed.

2. **Any logic still flawed?** Yes. Filter 2's logic is now incorrect. To find a "High-Density Redevelopment Opportunity," one must find an *under-developed* site in an area suitable for densification. By changing the filter to `Max building height on title (m): is greater than 15`, Claude is now searching for sites that are *already* developed to a significant height, contradicting the goal of finding a redevelopment opportunity. The original logic of filtering for a low building height was correct.

3. **Price caps appropriate for £200k budget?** No. Filter 3, "Low Entry," has a `Sales listing price: is less than 300000`. This is incompatible with a £200k acquisition budget, as it exceeds the limit before any transaction costs are even considered. The price cap must be at or below the stated budget.

**Gemini's Corrected Filters:**

**Filter 2: High-Density Redevelopment Opportunity**
1. Max building height on title (m): is less than 12
2. TFL Public Transport Accessibility Level (PTAL): is one of 4, 5, 6a, 6b
3. Title area (acres): is greater than 0.25 AND less than 2
4. Percentage of title covered by Green Belt land: is equal to 0
5. Developed area percentage: is less than 50
6. Sales listing currently on the market: is equal to Yes

**Filter 3: Motivated Corporate Seller (Low Entry)**
1. Ownership type: is equal to Company
2. Latest sold date: is before 2020-01-19
3. Sales listing price: is less than 200000
4. Distance to nearest Train Station (m): is less than 1000
5. Title area (acres): is greater than 0.2 AND less than 3
6. Building on title is derelict: is equal to Yes OR Building on title is inactive: is equal to Yes

---

### 🟠 Codex's Review

- **Height logic:** For a "high‑density redevelopment opportunity" you're targeting under-built plots that can be intensified; requiring `max building height < 12 m` keeps the focus on low-rise assets where air rights remain, so Gemini's pushback is correct.
- **Price cap:** The brief specifies a ~£200k entry budget, so enforcing `sales listing price < 200000` is the only way to stay within the capital limit—even if it narrows supply, it's the right constraint.
- **Filter 1:** Claude's stalled mixed-use filter still holds up: combining "mixed-use" + "storey" proposals, `last application < 2023-01-19`, `applications in last 5 years = 0`, inactive building, and an on-market listing under £500k correctly approximates lapsed planning for modestly sized titles.

**Status:** AGREE - filters ready

---

### 🟣 Claude's Final Synthesis

**AGREED - Gemini and Codex are both correct.**

My Filter 2 error was conflating "target outcome" (high-density) with "current state" (already high). For redevelopment, we need LOW current height with HIGH density POTENTIAL (PTAL 4-6b). Gemini caught this perfectly.

My Filter 3 price cap was also wrong - £300k exceeds the £200k budget before costs. Gemini's correction to £200k is the hard limit.

**Final Validated Filters (All 3 LLMs Agree):**

**Filter 1: Stalled Mixed-Use Development**
1. Proposal: contains "mixed-use" AND "storey"
2. Last application submitted: is before 2023-01-19
3. Applications in the last 5 years: is equal to 0
4. Title area (acres): is greater than 0.2 AND less than 2
5. Building on title is inactive: is equal to Yes
6. Sales listing currently on the market: is equal to Yes
7. Sales listing price: is less than 500000

**Filter 2: High-Density Redevelopment Opportunity**
1. Max building height on title (m): is less than 12
2. TFL Public Transport Accessibility Level (PTAL): is one of 4, 5, 6a, 6b
3. Title area (acres): is greater than 0.25 AND less than 2
4. Percentage of title covered by Green Belt land: is equal to 0
5. Developed area percentage: is less than 50
6. Sales listing currently on the market: is equal to Yes

**Filter 3: Motivated Corporate Seller (Low Entry)**
1. Ownership type: is equal to Company
2. Latest sold date: is before 2020-01-19
3. Sales listing price: is less than 200000
4. Distance to nearest Train Station (m): is less than 1000
5. Title area (acres): is greater than 0.2 AND less than 3
6. Building on title is derelict: is equal to Yes OR Building on title is inactive: is equal to Yes

---

## ✅ CONVERGENCE ACHIEVED (Iteration 2)

**Status:** All 3 LLMs agree on these filters
**Date:** 2025-11-19
**Iterations:** 2 (minimum requirement met)

**Key Corrections Made:**
1. Filter 1: Added "Applications in last 5 years = 0" proxy for expired planning
2. Filter 2: Corrected to LOW height (<12m) for redevelopment potential
3. Filter 3: Strict £200k price cap to match budget constraint
4. All filters use exact filter names from AvailableFiltersInSearchLand_ACTUAL.md
5. All units in acres/sqft/metres as per actual system

**Ready for SearchLand AI testing** ✅

---

