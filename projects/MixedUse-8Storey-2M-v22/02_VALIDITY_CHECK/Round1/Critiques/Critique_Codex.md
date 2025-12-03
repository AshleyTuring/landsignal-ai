**Claude - Approach A: CONDITIONAL**  
**Status:** CONDITIONAL  
**Reasoning:** Filters largely exist but syntax risks (line 2 uses `OR` instead of list operator) and range parsing may drop conditions. Capital fits; ROI plausible.  
**Technical Issues:**  
- `Proposal: contains "retail" OR "commercial" OR "Class E"` uses inline OR; SearchLand expects `contains any [...]`.  
- Ranged fields on one line (`Title area: greater than 0.15 AND less than 1.5`) may be partially ignored on complex prompts.  
**Suggested Fixes:**  
- Use `Proposal: contains any [retail, commercial, "Class E"]`.  
- Split ranges into two filters if parsing fails.  
**Strategic Notes:** Price cap £250k on 0.15–1.5 acres may severely limit volume; verify actual availability.

**Claude - Approach B: CONDITIONAL**  
**Status:** CONDITIONAL  
**Reasoning:** Filters exist but operator misuse; business case hits £2M only via multiple deals.  
**Technical Issues:**  
- `Ownership type: is equal to Company` should be `Ownership type: is one of [Company]`.  
- Ranged acres line could be split for parser reliability.  
**Suggested Fixes:**  
- Correct ownership operator.  
- If volume needed, plan for 3–5 sites to reach £2M.

**Claude - Approach C: CONDITIONAL**  
**Status:** CONDITIONAL  
**Reasoning:** Core logic sound, but two filters are malformed.  
**Technical Issues:**  
- `No latest sold date` is not a valid filter; use `Latest sold date: is empty` (if supported) or a very old cutoff date.  
- `Built up areas` lacks operator; should be `Planning constraints: contains any [Built up areas]`.  
**Suggested Fixes:**  
- Replace filter 1 with a supported empty-date condition.  
- Add the planning-constraint operator for “Built up areas.”

**Claude - Approach D: CONDITIONAL**  
**Status:** CONDITIONAL  
**Reasoning:** Filter set valid; however equity need is £225k and profit margins are thin (base case loss, best case £500k).  
**Technical Issues:** None on filters.  
**Suggested Fixes:**  
- Keep equity ≤£200k via JV/partner and target sub-£1.5M acquisitions.  
- Re-run viability with higher-unit counts or lower build/S106 assumptions before proceeding.

**Codex - Approach A: CONDITIONAL**  
**Status:** CONDITIONAL  
**Reasoning:** Targeting is sensible but uses invalid Property type value and overly strict use-class operator.  
**Technical Issues:**  
- Property type only accepts [Detached, Semi-Detached, Terraced, Flat, Commercial]; “Mixed Use” not allowed.  
- Property type uses `contains any/all`, not `is one of`.  
- `Use class: contains all [E, C3]` may fail (most titles have a single class); should be `contains any` or use `Property classification`/`Building use group` for mixed use.  
**Suggested Fixes:**  
- Set `Property type: contains any [Commercial]` and rely on Use class/Proposal for mixed-use intent.  
- Change use class operator to `contains any [E - Commercial Business and Service, C3 - Dwellinghouses]`.  

**Codex - Approach B: CONDITIONAL**  
**Status:** CONDITIONAL  
**Reasoning:** Filter logic mostly fits HMO play, but Property type value invalid and Article 4 filter availability must be confirmed; profit to £2M requires volume beyond stated capital.  
**Technical Issues:**  
- Property type “Residential” not in allowed set; use `Property type: contains any [Flat, Terraced, Detached, Semi-Detached]` or drop it.  
- Ensure Article 4 filter name matches platform (`Article 4 Direction: does not contain [C4/HMO]`).  
**Suggested Fixes:**  
- Correct property type filter.  
- Explicitly plan leverage/volume to reach £2M.

**Codex - Approach C: INVALID**  
**Status:** INVALID  
**Reasoning:** Multiple filter/unit errors make the prompt non-executable.  
**Technical Issues:**  
- Property type “Mixed Use” not a valid value.  
- `Title area (sqft)` filter does not exist; title area is only in acres.  
- Operator `is one of` not supported on Property type; should be `contains any`.  
- Unclear support for `Lease end date (year)` and `Average daily footfall`; need confirmed filter names.  
**Suggested Fixes:**  
- Replace property type with `contains any [Commercial]` plus Use class filters.  
- Convert size to `Title area (acres)` or use `Property floor area (sqft)`.  
- Verify lease/footfall filter names before re-running.

**Gemini - Approach A: CONDITIONAL**  
**Status:** CONDITIONAL  
**Reasoning:** Filters valid; capital plan hinges on winning options because no price cap is set—could surface unaffordable sites.  
**Technical Issues:**  
- Range line could be split if parser drops part (`Title area` with AND).  
**Suggested Fixes:**  
- Add price or valuation constraint, or explicitly state option-structure assumptions in the prompt.  
- Split range if parsing fails.

**Gemini - Approach B: VALID**  
**Status:** VALID  
**Reasoning:** All filters exist with correct syntax and units; capital within £200k; implementation feasible via airspace rights.  
**Technical Issues:** None noted.  
**Strategic Notes:** Need structural due diligence to confirm roof load capacity.

**Gemini - Approach C: CONDITIONAL**  
**Status:** CONDITIONAL  
**Reasoning:** Filters appear valid; business case hits £2M only with high-volume repeats, which £200k capital cannot fund without leverage.  
**Technical Issues:** None identified.  
**Suggested Fixes:**  
- Add financing/volume plan (e.g., bridge + recycle) and target deal count needed for £2M.

**Grok - Approach A: INVALID**  
**Status:** INVALID  
**Reasoning:** Two critical issues: Property type value invalid and PTAL is London-only yet strategy targets Slough/nearby (outside TfL), so the filter will return zero/non-target results.  
**Technical Issues:**  
- Property type cannot include “Mixed Use”; use `Property type: contains any [Commercial]` or drop it.  
- Replace PTAL with `Distance to nearest Train Station (m)` for non-London areas.  
**Suggested Fixes:**  
- Correct filters as above; re-run with geography that matches PTAL or drop PTAL.

**Grok - Approach B: CONDITIONAL**  
**Status:** CONDITIONAL  
**Reasoning:** Filters and units are valid; capital per deal fits £200k, but reaching £2M requires multiple sequential deals and financing not addressed.  
**Technical Issues:** None on syntax.  
**Suggested Fixes:**  
- Add funding/throughput plan (e.g., staged purchases or options) to scale to required profit.
