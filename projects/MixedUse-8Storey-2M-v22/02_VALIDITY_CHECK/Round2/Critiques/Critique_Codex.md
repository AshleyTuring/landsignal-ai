Claude - Approach A: CONDITIONAL  
**Status:** CONDITIONAL  
**Reasoning:** Filters mostly exist but Filter 2 uses unsupported inline OR syntax and Filter 7 is best split into two lines for reliability; business case fits £200k and ROI is plausible if planning succeeds.  
**Technical Issues:**  
- Filter 2 should be `Proposal: contains any [retail, commercial, E - Commercial Business and Service]` (no OR).  
- Filter 7 range should be split into two filters for parsing reliability.  
**Suggested Fixes:**  
- Replace Filter 2 with `contains any` list.  
- Split the acreage band into two filters.

Claude - Approach B: CONDITIONAL  
**Status:** CONDITIONAL  
**Reasoning:** Filters exist/syntax OK; capital is within £200k, but ROI to £2M depends on closing 3–5 sites, not a single deal.  
**Technical Issues:** None material.  
**Suggested Fixes:**  
- Explicitly plan for portfolio volume (3–5 sites) and recycling capital.

Claude - Approach C: CONDITIONAL  
**Status:** CONDITIONAL  
**Reasoning:** Business case fits budget, but prompt has missing/invalid filters.  
**Technical Issues:**  
- “No latest sold date” needs a real filter (e.g., `Latest sold date: is blank` if supported) or replace with `Latest sold date: is before 19xx-01-01`.  
- Filter 3 should be `Applications in the last 5 years: is less than 1`.  
- Filter 9 must be `Planning constraints: contains any [Built up areas]`.  
**Suggested Fixes:**  
- Use supported latest-sold syntax; correct Filters 3 and 9.

Claude - Approach D: CONDITIONAL  
**Status:** CONDITIONAL  
**Reasoning:** Filters are valid, but base case breaches £200k equity and the pro forma shows tight/negative margin unless JV/co-invest or cheaper site is found.  
**Technical Issues:** None.  
**Suggested Fixes:**  
- Lock JV/partner equity or target sub-£1.5M assets; rework finance so total equity ≤£200k and revisit cost/affordable assumptions.

Codex - Approach A: INVALID  
**Status:** INVALID  
**Reasoning:** Prompt is not executable as written.  
**Technical Issues:**  
- `Property type: Mixed Use` is not a valid value (allowed: Detached/Semi-Detached/Terraced/Flat/Commercial).  
- `Use class: contains all [E, C3]` is over-restrictive for single-class titles; use `contains any` or separate filters.  

Codex - Approach B: INVALID  
**Status:** INVALID  
**Reasoning:** Multiple filter/name/unit errors; business case also needs volume.  
**Technical Issues:**  
- `Property type: Residential` not valid.  
- Article 4 should be via `Planning constraints`/percentage, not `Article 4 Direction`.  
- Property floor area unit/filter (`sqft`) not confirmed in Available Filters.

Codex - Approach C: INVALID  
**Status:** INVALID  
**Reasoning:** Key filters don’t exist/are in wrong units.  
**Technical Issues:**  
- `Property type: Mixed Use` invalid.  
- `Title area (sqft)` should be `Title area (acres)`.  
- `Average daily footfall` filter not in the documented filter list.  

Gemini - Approach A: VALID  
**Status:** VALID  
**Reasoning:** All filters exist with correct syntax; capital plan (£65k) is within budget and planning-uplift route is viable, though success depends on planning.  
**Technical Issues (if any):**  
- Consider splitting the acreage band into two filters for parser reliability.  

Gemini - Approach B: CONDITIONAL  
**Status:** CONDITIONAL  
**Reasoning:** Strategy feasible within £200k, but one filter is unverified and ROI to £2M needs volume or bigger schemes.  
**Technical Issues:**  
- Confirm `A building in the title has flat roof` exists; if not, swap to `Roof type: Flat` or manual verification.  
**Suggested Fixes:**  
- Verify/replace flat-roof filter; model deal count/exit needed for £2M target.

Gemini - Approach C: CONDITIONAL  
**Status:** CONDITIONAL  
**Reasoning:** Filters valid; capital fits. Profit per unit is low—£2M requires high deal volume/recycling.  
**Technical Issues:** None.  
**Suggested Fixes:**  
- Set volume target (e.g., 10–15 deals) and secure refurbishment funding lines.

Grok - Approach A: INVALID  
**Status:** INVALID  
**Reasoning:** Prompt uses an invalid property type and mixes PTAL (London-only) with a Slough focus.  
**Technical Issues:**  
- `Property type: Mixed Use` not allowed.  
- PTAL returns nothing outside London; combine with train-distance instead if non-London.  

Grok - Approach B: CONDITIONAL  
**Status:** CONDITIONAL  
**Reasoning:** Filters exist and capital fits; hitting £2M depends on executing multiple small derelict turnarounds.  
**Technical Issues:**  
- Ensure `Use class: does not contain [B2]` is supported; if not, invert with `Use class: contains any [...]` for allowed classes.  
**Suggested Fixes:**  
- Plan portfolio throughput (e.g., 5–8 projects) and validate use-class exclusion syntax.
