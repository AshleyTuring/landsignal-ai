**Claude – Approach A: CONDITIONAL**  
**Status:** CONDITIONAL  
**Reasoning:** Core filters exist but syntax has OR/Yes issues; ROI plausible; budget fits.  
**Technical Issues:**  
- `Proposal: contains "retail" OR "commercial" OR "Class E"` → OR not supported; must use `contains any […]`.  
- Boolean filters should use `is equal to Yes/No` (items 8,9).  
**Suggested Fixes:**  
- Change filter 2 to `Proposal: contains any ["retail", "commercial", "Class E"]`.  
- Rewrite filters 8-9 as `…: is equal to Yes/No`.  
**Strategic Notes:** Profit case aggressive but directionally feasible with planning uplift.

**Claude – Approach B: CONDITIONAL**  
**Status:** CONDITIONAL  
**Reasoning:** Filters exist and syntax fine; capital within £200k; profit to £2M requires multiple deals and liquidation supply is thin.  
**Technical Issues:** None material.  
**Suggested Fixes:**  
- Note explicitly that target requires 3-5 deals due to per-site profit limits/limited pipeline.  
**Strategic Notes:** Legal/Environmental liabilities in liquidation need early checks.

**Claude – Approach C: CONDITIONAL**  
**Reasoning:** Several syntax omissions; business case OK if corrected.  
**Technical Issues:**  
- `No latest sold date` not valid; use `Latest sold date: is null` (if supported) or filter via “No latest sold date” toggle in UI.  
- Item 9 `Built up areas` missing operator; should be `Planning constraints: contains any [Built up areas]`.  
- Ensure boolean filters use `is equal to` wording.  
**Suggested Fixes:** Apply above corrections.  
**Strategic Notes:** Capital fits; ROI depends on at least one planning win.

**Claude – Approach D: CONDITIONAL**  
**Reasoning:** Filters mostly valid; capital requirement exceeds £200k unless JV; per-site ROI often <£2M.  
**Technical Issues:**  
- Boolean `Sales listing currently on the market` should be `is equal to Yes`.  
- Confirm `Developed area percentage` range parses better as two lines.  
**Suggested Fixes:**  
- Explicitly structure as JV/co-invest with equity ≤£200k and tighten cost assumptions.  
- Split range filters into two lines if parser fails.  
**Strategic Notes:** High London costs/S106 make margin tight.

**Codex – Approach A: CONDITIONAL**  
**Reasoning:** Property type value invalid; otherwise coherent and within budget.  
**Technical Issues:**  
- `Property type: is one of [Mixed Use, Commercial]` invalid; allowed values exclude “Mixed Use”.  
- `Building on title is inactive` filter name/value needs confirmation; if unavailable, drop.  
**Suggested Fixes:**  
- Replace with `Building use group: contains any [Mixed Use]` or drop property type filter.  
- Verify boolean syntax (`is equal to Yes`).  
**Strategic Notes:** Good precedent match for Slough.

**Codex – Approach B: CONDITIONAL**  
**Reasoning:** Multiple filter/name issues; ROI needs volume; still capital-feasible.  
**Technical Issues:**  
- `Property type: is equal to Residential` invalid (allowed: Detached, Semi-Detached, Terraced, Flat, Commercial).  
- `Article 4 Direction` filter/value unverified; reference lists only `Article 4`/percentage variants.  
- Boolean fields should use `is equal to Yes/No`.  
**Suggested Fixes:**  
- Remove/replace property type with `Use class: is equal to C3` alone or add `Building use group` if needed.  
- Check Article 4 exact filter/value in UI; adjust accordingly.  
**Strategic Notes:** HMO yields hit £2M only via many deals over time.

**Codex – Approach C: INVALID**  
**Reasoning:** Multiple critical filter errors (units and names) make prompt unusable.  
**Technical Issues:**  
- `Property type: [Commercial, Mixed Use]` – “Mixed Use” invalid.  
- `Title area (sqft)` filter doesn’t exist; must use acres.  
- `Average daily footfall` wrong name; correct is `Average footfall count passing title daily`.  
- `Lease end date (year)` likely needs full date format.  
**Suggested Fixes:**  
- Use `Building use group: contains any [Mixed Use]`, `Title area (acres): is greater than X AND less than Y`, correct footfall filter name, and specify lease end as date.

**Gemini – Approach A: VALID**  
**Reasoning:** Filters exist, syntax mostly correct; capital/implementation feasible for planning-uplift strategy.  
**Technical Issues:**  
- Ensure boolean `Sales listing currently on the market` uses `is equal to No`.  
**Strategic Notes:** Provide explicit profit calc to evidence £2M path (planning uplift sale).

**Gemini – Approach B: CONDITIONAL**  
**Reasoning:** Concept sound; minor syntax and structural feasibility checks needed.  
**Technical Issues:**  
- Boolean `flat roof` and listing filters should use `is equal to Yes/No`.  
- Consider adding upper bound on title area for consistency.  
**Suggested Fixes:**  
- Rewrite boolean lines with `is equal to`.  
**Strategic Notes:** Structural capacity and rights-of-light need early validation.

**Gemini – Approach C: CONDITIONAL**  
**Reasoning:** Filters valid; capital fits; profit per unit low → needs high volume to reach £2M.  
**Technical Issues:** None.  
**Suggested Fixes:**  
- Note volume requirement explicitly; add buffer for unexpected refurb costs.  
**Strategic Notes:** Good quick-turn tactic; not aligned to 8-storey objective unless used for capital recycling.

**Grok – Approach A: INVALID**  
**Reasoning:** PTAL is London-only, so Slough search returns zero; property type “Mixed Use” invalid.  
**Technical Issues:**  
- Replace `PTAL` with `Distance to nearest Train Station (m)` for Slough.  
- `Property type: contains any [Mixed Use]` invalid; use `Building use group: contains any [Mixed Use]`.  
**Suggested Fixes:** Apply above substitutions; re-run with correct geography filter.

**Grok – Approach B: CONDITIONAL**  
**Reasoning:** Filters mostly valid; capital fits; ROI requires multiple small deals.  
**Technical Issues:**  
- Confirm boolean syntax (`is equal to Yes/No`).  
- `Use class: does not contain [B2 - General industrial]` allowed, but ensure list syntax if multiple.  
**Suggested Fixes:**  
- Clarify volume needed (several sites) to reach £2M; add structural due diligence for derelict assets.
