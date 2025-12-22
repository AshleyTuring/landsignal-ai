Claude - Approach A: CONDITIONAL  
**Status:** CONDITIONAL  
**Reasoning:** Capital can fit if phased (£160k upfront) but the prompt will not run as written and the cost/uplift assumptions are aggressive.  
**Technical Issues:** `Freehold tenure` missing operator (`Tenure: is one of [Freehold]`); `NOT: Use class contains [C3]` should be `Use class: does not contain [C3 - Dwellinghouses]`.  
**Suggested Fixes:** Correct operators; sanity-check build cost (£30k-£50k for 2–4 flats is low) and include financing plan if total spend exceeds £200k.  
**Strategic Notes:** Strong PDR focus; keep size/price caps but add evidence-based £/sqft conversion costs.

Claude - Approach B: CONDITIONAL  
**Status:** CONDITIONAL  
**Reasoning:** Deal works with bridging/JV, but filter naming and Class Q size cap issues block execution.  
**Technical Issues:** `Agricultural Land Grade` not a valid field (should be `Agricultural land classification`); `Building on title is derelict: does not equal Yes` should use `is equal to No`; upper size bound 6,000 sqft exceeds 465 sqm Class Q cap.  
**Suggested Fixes:** Rename filters, tighten max developed area to ≤5,000 sqft, and state financing for £100k-£150k conversion.  
**Strategic Notes:** Good PD play; add 10-year ag-use check and structural suitability filter.

Claude - Approach C: CONDITIONAL  
**Status:** CONDITIONAL  
**Reasoning:** Business case relies on development finance (standard), but two filters are misnamed so the search fails.  
**Technical Issues:** `Building has flat roof` should be `A building in the title has flat roof`; `Addresses` should be `Number of addresses`.  
**Suggested Fixes:** Rename filters; keep finance note explicit for £600k-£800k build.  
**Strategic Notes:** Viable airspace path with low upfront cash; planning risk remains material.

Claude - Approach D: CONDITIONAL  
**Status:** CONDITIONAL  
**Reasoning:** HMO plan depends on refinancing; Article 4 exclusion is misapplied.  
**Technical Issues:** `Planning constraints: does not contain [Article 4 Direction - HMO]` is invalid—use `Article 4: does not contain [Article 4]` or `% of title subject to Article 4 Directions: is equal to 0`.  
**Suggested Fixes:** Correct Article 4 filter/value; show cashflow/refi sensitivities given £217k-£286k total per unit.  
**Strategic Notes:** Operationally intensive; ensure local licensing standards are budgeted.

Codex - Approach A: INVALID  
**Status:** INVALID  
**Reasoning:** Non-existent geography filter prevents execution; ROI not demonstrated.  
**Technical Issues:** `Local planning authority: is Brentwood` does not exist; height filter should be `Max building height on title (m)`; no ROI worked example.  
**Suggested Fixes:** Anchor geography via polygon or `Neighbouring Local Planning Authorities of: contains Brentwood`; correct height field; add profit math.

Codex - Approach B: INVALID  
**Status:** INVALID  
**Reasoning:** Multiple non-existent filters make the prompt un-runnable.  
**Technical Issues:** `Local planning authority`, `Addresses`, and `Article 4 HMO` are not valid fields; Article 4 must use the dedicated filter; geography filter missing.  
**Suggested Fixes:** Replace with valid fields (`Number of addresses`, `Article 4`), add proper geography anchor, and confirm capital stack for a £250k+ asset.

Gemini - Approach A: CONDITIONAL  
**Status:** CONDITIONAL  
**Reasoning:** Filter stack likely over-constrains volume; one boolean syntax error.  
**Technical Issues:** `Sales listing currently on the market: Yes` must be `is equal to Yes`.  
**Suggested Fixes:** Fix boolean syntax; consider relaxing price/area/on-market stack to avoid near-zero results; ensure Use class values match canonical names (e.g., “Financial services”).  
**Strategic Notes:** On-market focus limits arbitrage; may need off-market or higher cap.

Gemini - Approach B: INVALID  
**Status:** INVALID  
**Reasoning:** Boolean and applications filters are malformed, so the search won’t parse.  
**Technical Issues:** `Sales listing currently on the market: No` needs `is equal to No`; `Less than 1 application in last 5 years` must be `Applications in last 5 years: is less than 1`.  
**Suggested Fixes:** Correct syntax; keep lease-end window and ownership filters; validate price cap vs. build costs.

Grok - Approach A: CONDITIONAL  
**Status:** CONDITIONAL  
**Reasoning:** No price cap risks >£200k assets; potential Use class value typos.  
**Technical Issues:** Use class values should match canonical labels (e.g., “Financial services” not “Financial constants”); absence of a price filter weakens capital fit.  
**Suggested Fixes:** Add `Sales listing price` or comparable affordability filter; correct Use class labels.  
**Strategic Notes:** Good PD base; add building size/price discipline.

Grok - Approach B: CONDITIONAL  
**Status:** CONDITIONAL  
**Reasoning:** Technically parsable, but no affordability guard and build costs may exceed £200k.  
**Technical Issues:** None critical beyond missing price/cost controls.  
**Suggested Fixes:** Add price/valuation cap and simple capex assumption; confirm Use class suffices for intended infill.  
**Strategic Notes:** Garden infill viable; ensure planning precedent is checked.

Grok - Approach C: CONDITIONAL  
**Status:** CONDITIONAL  
**Reasoning:** Core idea sound, but one filter name is invalid.  
**Technical Issues:** `Hardstanding percentage` should be `Percentage of title covered by hard standings`.  
**Suggested Fixes:** Rename filter; add price cap and clarify planning route for Green Belt exceptions.  
**Strategic Notes:** Niche green-belt workaround; higher planning risk needs allowance.

Natural next steps: 1) Correct filter names/operators, 2) add price/capex caps where missing to ensure £200k feasibility, 3) rerun searches to confirm result counts, 4) plug in realistic £/sqft build costs and ROI illustrations.
