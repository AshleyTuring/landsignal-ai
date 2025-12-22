### Claude - Approach A: CONDITIONAL
**Status:** CONDITIONAL  
**Reasoning:** Uses valid filters but has syntax errors and capital/ROI assumptions that exceed the £200k budget.

**Technical Issues:**
- `Freehold tenure` should be `Tenure: is one of [Freehold]`.
- `NOT: Use class contains [...]` is invalid; should be `Use class: does not contain [C3 - Dwellinghouses]`.

**Suggested Fixes:**
- Fix filter syntax as above.
- Add finance plan or reduce scope to keep total spend within £200k; rework the £150k purchase/£50k conversion profit example (costs look too low for 3,000 sqft and 4 flats).

**Strategic Notes (optional):**
- Consider adding a price cap or yield/profit screen to avoid >£200k assets.

---

### Claude - Approach B: CONDITIONAL
**Status:** CONDITIONAL  
**Reasoning:** Filters largely exist; operator on derelict flag is likely wrong; capital and conversion costs exceed £200k without finance.

**Technical Issues:**
- `Building on title is derelict: does not equal Yes` — boolean filter normally expects `is equal to Yes/No`.
- Capital stack (£160k-£260k) and £100k-£150k conversion exceed cash budget.

**Suggested Fixes:**
- Use `Building on title is derelict: is equal to No` (or drop the line).
- Make finance route explicit (bridge/JV) or narrow to barns requiring <£100k conversion to stay within £200k.

**Strategic Notes (optional):**
- Check Class Q cap (465 sqm / 3 dwellings) on size filter; current 1,500-6,000 sqft breaches the 465 sqm limit at the top end.

---

### Claude - Approach C: CONDITIONAL
**Status:** CONDITIONAL  
**Reasoning:** Filters exist but minor naming and cost/scope gaps; relies on heavy development finance beyond £200k.

**Technical Issues:**
- Use the exact boolean field name `A building in the title has flat roof: Yes`.
- No price or rights-cost filter; search may surface full freeholds far above budget.

**Suggested Fixes:**
- Add a cost/price screen (e.g., sales listing price cap or smaller title area/floor area) or explicitly plan for airspace-rights-only acquisition.
- Keep finance assumptions explicit (dev finance for £600k-£800k build).

**Strategic Notes (optional):**
- Mixed-use filter `Use class contains any [E...]` + `contains all [C3]` is fine for mixed use; keep.

---

### Claude - Approach D: CONDITIONAL
**Status:** CONDITIONAL  
**Reasoning:** Core filters exist but Article 4 line is wrong and total project spend exceeds £200k without stated finance.

**Technical Issues:**
- `Planning constraints: does not contain [Article 4 Direction - HMO]` is not a planning constraint value; Article 4 is a separate filter (`Article 4` or `% of title subject to Article 4 Directions`).
- Total costs £217k-£286k exceed the £200k capital headline.

**Suggested Fixes:**
- Replace Article 4 line with `Article 4: does not contain [Article 4]` or omit if unavailable in constraints.
- Clarify leverage (mortgage/bridge) or trim scope to fit £200k.

**Strategic Notes (optional):**
- Consider adding `Number of leaseholds on the freehold: <1` to avoid surprises.

---

### Codex - Approach A: CONDITIONAL
**Status:** CONDITIONAL  
**Reasoning:** Filters exist but preset call may not be a supported filter; no price cap so results may breach budget.

**Technical Issues:**
- `Preset: equals Class MA eligible commercial sites` may not be a valid filter name in the AI syntax.
- Use class values should use full labels (e.g., `E - Commercial Business and Service`) for reliability.

**Suggested Fixes:**
- If presets aren’t callable, rebuild with explicit filters (use class E, Brentwood LPA) then refine.
- Add a price/sales listing cap or floor-area cap to stay within £200k targets.

**Strategic Notes (optional):**
- Consider adding `Sales listing currently on the market: Yes/No` depending on acquisition route.

---

### Codex - Approach B: CONDITIONAL
**Status:** CONDITIONAL  
**Reasoning:** Good HMO refinement, but Article 4 filter name and preset call are likely unsupported; pricing realism uncertain.

**Technical Issues:**
- `Preset: equals Run down homes` may not parse as a filter.
- `Article 4 HMO: does not contain Article 4` is not in the available list; Article 4 is a standalone filter.
- No explicit price cap; 2,000+ sqft Brentwood houses may exceed £200k.

**Suggested Fixes:**
- If presets unsupported, restate filters manually (Use class C3, EPC E-G, etc.).
- Replace Article 4 line with `Article 4: does not contain [Article 4]` or drop if unavailable.
- Add price/valuation screen to keep within capital.

**Strategic Notes (optional):**
- Tenure filter is missing; add `Tenure: is one of [Freehold]` to avoid leaseholds.

---

### Gemini - Approach A: CONDITIONAL
**Status:** CONDITIONAL  
**Reasoning:** Filter set is coherent but use class values are misnamed; price cap may zero out Brentwood supply; conversion budget light.

**Technical Issues:**
- Use class labels use “constants” (typos); should match official names (e.g., `E(c)(i) - Financial services`, `E(c)(ii) - Professional services`, `E(c)(iii) - Other commercial services`).
- Small floor area + £35k conversion for up to 2,000 sqft is likely understated.

**Suggested Fixes:**
- Correct use class labels; keep `Use class: does not contain [C3]`.
- Validate availability under £150k; if none, lift cap slightly or use profit/yield screen instead.
- Increase/phase conversion allowance to realistic £60k-£80k for 1k-2k sqft.

**Strategic Notes (optional):**
- On-market focus is fine; consider adding `Sales listing status: Available/Under Offer` to control deal stage.

---

### Gemini - Approach B: CONDITIONAL
**Status:** CONDITIONAL  
**Reasoning:** Conceptually sound off‑market MA play, but syntax and capital controls need tightening.

**Technical Issues:**
- “Less than 1 application in last 5 years” should be `Applications in last 5 years: is less than 1`.
- No price cap; may surface assets above £200k.
- Conversion budget (£58k for up to 2,500 sqft) likely low.

**Suggested Fixes:**
- Fix the applications operator.
- Add a price/profit cap (e.g., `Sales listing price <£200k` or floor area cap aligned to budget).
- Increase conversion allowance or plan for finance.

**Strategic Notes (optional):**
- Keep `Sales listing currently on the market: No` for off-market angle.

---

### Grok - Approach A: CONDITIONAL
**Status:** CONDITIONAL  
**Reasoning:** Filters valid, but uses title area instead of floor area for MA, lacks price control, and use class labels have typos.

**Technical Issues:**
- MA viability depends on floor area (sqm limit), not title acres; current 0.05-0.5 ac may misfilter.
- Use class labels use “constants” typos; should match official names.
- No price cap → may exceed £200k.

**Suggested Fixes:**
- Replace title area with `Property floor area (sqft)` within MA limits.
- Correct use class labels.
- Add price or profit/yield screen to enforce capital feasibility.

**Strategic Notes (optional):**
- Consider `Sales listing currently on the market: No` if targeting off-market.

---

### Grok - Approach B: CONDITIONAL
**Status:** CONDITIONAL  
**Reasoning:** Infill logic ok but missing tenure/price controls; capital feasibility unclear.

**Technical Issues:**
- No tenure filter; leaseholds may slip in.
- No price cap; 0.1-0.5 ac gardens in Brentwood likely exceed £200k.
- `Use class: contains all [C3]` works but `contains any` is clearer for a single value.

**Suggested Fixes:**
- Add `Tenure: is one of [Freehold]`.
- Add price/valuation or plot-size cap aligned to £200k (or plan for finance).
- Consider adding `Applications in last 5 years: <1` if targeting passive owners.

**Strategic Notes (optional):**
- Developed area % <30 is a good proxy; keep.

---

### Grok - Approach C: CONDITIONAL
**Status:** CONDITIONAL  
**Reasoning:** Technical filters exist, but planning risk is high and no capital screen; costs likely exceed £200k without finance.

**Technical Issues:**
- No price/cost cap; Green Belt sites with hardstanding can still be expensive.
- Planning risk (full planning, not PDR) not costed; build budgets (£75k-£150k) plus acquisition may exceed £200k.

**Suggested Fixes:**
- Add a price/profit filter or smaller floor/title bounds to fit budget.
- Make planning risk mitigation explicit (pre-app, policy precedents) and include finance if total >£200k.

**Strategic Notes (optional):**
- Hardstanding >25% + Green Belt flag is valid for “previously developed” angle; keep.
