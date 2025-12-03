### Claude - Approach A: CONDITIONAL
**Status:** CONDITIONAL  
**Reasoning:** Filters mostly align with the brief and capital/ROI are plausible, but one of the required exclusions cannot be implemented in SearchLand as written.

**Technical Issues (if any):**
- `NOT: Flood zone 3` is not an actual filter. Flood-risk exclusions must be expressed via the coverage/area metrics listed in the verified filter set (02_VALIDITY_CHECK/critique_context.txt:81; 01_DIVERGENT_GENERATION/shared_context.txt:3628).

**Suggested Fixes (if CONDITIONAL):**
- Replace the invalid clause with `Percentage of title covered by Flood Zone 3: is equal to 0` (or the “area not covered” equivalent) so that the search can run.
- Keep the rest of the structure as-is once the filter is corrected; ROI and capital logic already line up with the £2M/£200k brief.

**Strategic Notes (optional):**
- Strong combination of liquidation pressure and lapsed consents should keep motivation high once the syntax is fixed.

---

### Claude - Approach B: CONDITIONAL
**Status:** CONDITIONAL  
**Reasoning:** Targeting PTAL-backed flat roofs with lease expiries is coherent, but both the exclusion syntax and the top-end capital draw exceed project constraints.

**Technical Issues (if any):**
- `NOT: Conservation area, Listed building(s) in plot` cannot be parsed; only the specific coverage/distance filters are available (02_VALIDITY_CHECK/critique_context.txt:149; 01_DIVERGENT_GENERATION/shared_context.txt:3626 and 01_DIVERGENT_GENERATION/shared_context.txt:3632).
- The capital line item allows spend up to £210k, which breaches the £200k limit this project set (02_VALIDITY_CHECK/critique_context.txt:205).

**Suggested Fixes (if CONDITIONAL):**
- Swap the invalid `NOT` clause for `Percentage of title covered by Conservation Areas: is equal to 0` plus `Area of title within 50m of a Listed Building (acres): is equal to 0`.
- Trim or defer at least £10k of the planning/legal stack (e.g., vendor-funded surveys or staged option payments) so the high case still fits within £200k.

**Strategic Notes (optional):**
- Lease expiries plus PTAL effectively target the policy support window once the syntax/budget issues are resolved.

---

### Claude - Approach C: CONDITIONAL
**Status:** CONDITIONAL  
**Reasoning:** The regulatory-pressure concept is sound, but two filters are formatted in ways SearchLand cannot execute.

**Technical Issues (if any):**
- `Less than 1 application in last 5 years: Yes` is not a valid field; the platform exposes `Applications in the last 5 years` which needs an explicit numeric comparison (02_VALIDITY_CHECK/critique_context.txt:230; 01_DIVERGENT_GENERATION/shared_context.txt:3581).
- `NOT: Article 4 directions` is not supported; you must reference `Article 4` or its percentage coverage field instead (02_VALIDITY_CHECK/critique_context.txt:231; 01_DIVERGENT_GENERATION/shared_context.txt:3637).

**Suggested Fixes (if CONDITIONAL):**
- Rewrite the activity filter as `Applications in the last 5 years: is less than 1`.
- Replace the Article 4 exclusion with `Article 4: is equal to No` or `Percentage of title subject to Article 4 Directions: is equal to 0`.

**Strategic Notes (optional):**
- Once the filters work, the three-pronged motivation (HMO licence, EPC, precedent) remains a high-leverage play.

---

### Codex - Approach A: CONDITIONAL
**Status:** CONDITIONAL  
**Reasoning:** The stalled-consent search logic is implementable, but the write-up never shows how the scheme delivers the £2M profit requirement, leaving the business case unproven.

**Technical Issues (if any):**
- The section outlines filters and process only (02_VALIDITY_CHECK/critique_context.txt:327) and does not include any GDV/exit comparison or residual that demonstrates a >£2M target uplift.

**Suggested Fixes (if CONDITIONAL):**
- Add a simple residual or precedent sale calculation (units x £/sqft minus build/refresh costs) showing that reviving and trading one of these consents can realistically clear £2M.

**Strategic Notes (optional):**
- Recycling stalled consents is inherently efficient once ROI evidence is documented.

---

### Codex - Approach B: CONDITIONAL
**Status:** CONDITIONAL  
**Reasoning:** The airspace retail stack concept fits the mandate, but the SearchLand syntax is incorrect and the ROI story is absent.

**Technical Issues (if any):**
- `Use class: is E OR E(a) OR E(b) OR E(g)(i)` is invalid—the platform expects the `is one of` syntax shown in the filter reference (02_VALIDITY_CHECK/critique_context.txt:367; 01_DIVERGENT_GENERATION/shared_context.txt:810).
- No profitability or exit evidence is provided for this pathway (02_VALIDITY_CHECK/critique_context.txt:360).

**Suggested Fixes (if CONDITIONAL):**
- Reformat the use-class line as `Use class: is one of E, E(a), E(b), E(g)(i)`.
- Add an outline showing how many units or sqft you can stack on these roofs and the resulting margin to prove the £2M target is attainable.

**Strategic Notes (optional):**
- High-footfall London corridors are sensible once the prompt syntax and ROI are clarified.

---

### Codex - Approach C: CONDITIONAL
**Status:** CONDITIONAL  
**Reasoning:** Motivated high-street reinvention is appealing, but the same syntax/ROI gaps recur.

**Technical Issues (if any):**
- `Use class: is B2 OR B8 OR E OR E(g)(iii)` needs the `is one of` structure to run (02_VALIDITY_CHECK/critique_context.txt:409; 01_DIVERGENT_GENERATION/shared_context.txt:810).
- There is no calculation showing how the JV/option structure generates the £2M profit target (02_VALIDITY_CHECK/critique_context.txt:395).

**Suggested Fixes (if CONDITIONAL):**
- Rewrite the use-class filter as `Use class: is one of B2, B8, E, E(g)(iii)`.
- Include either a precedent GDV uplift (traffic-linked rents + added storeys) or a residual that demonstrates the stated profit ambition.

**Strategic Notes (optional):**
- Portfolio disposals with derelict stock should stay in scope once the prompt and economics are tightened.

---

### Gemini - Approach A: CONDITIONAL
**Status:** CONDITIONAL  
**Reasoning:** The search profile suits the brief, but the capital plan underestimates planning costs and the ROI story is missing.

**Technical Issues (if any):**
- Only £5k is earmarked for “initial planning & design reports” despite 8-storey applications elsewhere in the same pack needing £40k-£60k of professional spend (02_VALIDITY_CHECK/critique_context.txt:484 vs. 02_VALIDITY_CHECK/critique_context.txt:200). This makes the capital plan non-credible.
- No exit/profit calculation is provided for the option exercise (02_VALIDITY_CHECK/critique_context.txt:435).

**Suggested Fixes (if CONDITIONAL):**
- Rebase the budget to include at least £40k-£60k for architecture, planning consultancy, and fees, even if staged.
- Add a simple residual (e.g., 40 units × £X margin) showing the >£2M upside once planning is secured.

**Strategic Notes (optional):**
- Off-market low-rise stock near transport remains a useful channel once the numbers are realistic.

---

### Gemini - Approach B: CONDITIONAL
**Status:** CONDITIONAL  
**Reasoning:** Filters are technically valid, but the approach never demonstrates that stacking airspace will reach the £2M target.

**Technical Issues (if any):**
- The entire section (02_VALIDITY_CHECK/critique_context.txt:488) omits GDV, unit counts, or any ROI evidence, so the business case cannot be validated.

**Suggested Fixes (if CONDITIONAL):**
- Add a London PTAL case study quantifying the additional floorspace, build cost, and likely disposal value to confirm a >£2M margin.

**Strategic Notes (optional):**
- Freehold-only airspace deals are attractive once profitability is proven.

---

### Gemini - Approach C: INVALID
**Status:** INVALID  
**Reasoning:** The plan assumes the whole £200k can buy a 0.2–2 acre derelict mixed-use site outright, leaving no funding for planning or enabling work, and it still omits any ROI maths.

**Technical Issues (if any):**
- The capital plan spends £170k on acquisition plus £30k on fees/holding, with zero allowance for the surveys, architects, or planning fees needed for an 8-storey consent (02_VALIDITY_CHECK/critique_context.txt:582). That makes implementation impossible within budget.
- No profit or exit projection is offered for the strategy (02_VALIDITY_CHECK/critique_context.txt:538).

**Strategic Notes (optional):**
- Reframe this as an option/JV (instead of an outright purchase) with staged spend and explicit residuals if you want it back on the table.

---

### Grok - Approach A: CONDITIONAL
**Status:** CONDITIONAL  
**Reasoning:** The idea of piggybacking on recent approvals is solid, but SearchLand cannot filter by planning decision status, so the automation claim is overstated and ROI is still missing.

**Technical Issues (if any):**
- SearchLand has no “planning status = approved” filter, so the prompt cannot guarantee you’re only seeing approvals; the plan needs a manual check phase (02_VALIDITY_CHECK/critique_context.txt:609; 01_DIVERGENT_GENERATION/shared_context.txt:3587).
- There is no quantified profitability path in this section (02_VALIDITY_CHECK/critique_context.txt:592).

**Suggested Fixes (if CONDITIONAL):**
- Explicitly add a manual validation step (e.g., download decisions) after running the keyword search.
- Provide a precedent sale/option uplift that demonstrates the >£2M target.

**Strategic Notes (optional):**
- Still a good framework for “precedent-led” outreach once validation and ROI are added.

---

### Grok - Approach B: CONDITIONAL
**Status:** CONDITIONAL  
**Reasoning:** The airspace filters are precise, yet the narrative never proves the capital stack results in a £2M profit.

**Technical Issues (if any):**
- The section lays out filters and implementation only (02_VALIDITY_CHECK/critique_context.txt:632) with no GDV/ROI evidence tied to the £2M requirement.

**Suggested Fixes (if CONDITIONAL):**
- Provide an example (e.g., add 4 storeys of 20 units × £100k margin) to validate the target profit.

**Strategic Notes (optional):**
- Broadening beyond London via transport proxies could keep funnel sizes healthy once ROI is documented.

---

### Grok - Approach C: CONDITIONAL
**Status:** CONDITIONAL  
**Reasoning:** Long-held derelict corporate assets in liquidation match the mandate, but profitability is again undocumented.

**Technical Issues (if any):**
- The write-up (02_VALIDITY_CHECK/critique_context.txt:672) describes filters, rationale, and process but never quantifies how the £80k-£120k control spend becomes a £2M profit.

**Suggested Fixes (if CONDITIONAL):**
- Include a sample valuation uplift (e.g., acquisition discount vs. post-planning exit) to evidence ROI, and ensure any remediation/planning costs are accounted for.

**Strategic Notes (optional):**
- Combining liquidation and dereliction is powerful once the economic model is explicit.

---

**Next steps:** Once each team updates its filter syntax, capital allocation, and ROI evidence per the notes above, rerun the SearchLand prompts to confirm they execute cleanly and document at least one £2M+ residual per approach.
