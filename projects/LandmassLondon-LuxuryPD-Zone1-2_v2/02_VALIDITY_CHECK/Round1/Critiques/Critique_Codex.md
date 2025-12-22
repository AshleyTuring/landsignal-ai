**Claude – Approach A:** VALID  
**Reasoning:** Uses existing MA preset; filters (price £5m–£60m, liquidation/administration, 10k–100k sqft, freehold) are syntactically sound and match strategy/budget; units correct; PD route viable.  
**Technical Issues:** None spotted.  
**Suggested Fixes:** n/a  
**Strategic Notes:** Ensure MA constraints (noise/parking/daylight) checked in feasibility.

**Claude – Approach B:** CONDITIONAL  
**Reasoning:** Airspace preset + low height/old hold/low EPC/strong PTAL fits airspace strategy and budget; units correct. Key risk is filter naming: “Max building height on title (m)” must match available field; otherwise prompt may be ignored.  
**Technical Issues:** Possible mismatch on height filter name; PTAL values require London context.  
**Suggested Fixes:** Use exact field label as in AvailableFiltersInSearchLand_ACTUAL.md (e.g., `Max building height (m)` if that’s the canonical name); confirm PTAL filter availability in the chosen LPA list.  
**Strategic Notes:** Add structural-capacity screen early.

**Claude – Approach C:** CONDITIONAL  
**Reasoning:** Lease-expiry + footfall preset aligns; PTAL/height/freehold filters are coherent. Missing explicit MA/Use Class filter, so PD/resi viability not guaranteed; conservation/listed exclusions help but not sufficient.  
**Technical Issues:** None on syntax; viability risk due to missing MA/use-class constraint.  
**Suggested Fixes:** Add `Use class: contains any [E - Commercial Business and Service]` (or relevant class) plus MA eligibility check if required.  
**Strategic Notes:** Consider vacancy window (e.g., lease ending <6–12 months) for motivation.

**Claude – Approach D:** VALID  
**Reasoning:** MA-eligible office preset plus EPC D–G, long-hold date, PTAL 4–6b, and constraint exclusions; syntax and units correct; budget and PD path consistent.  
**Technical Issues:** None spotted.  
**Suggested Fixes:** n/a  
**Strategic Notes:** Keep Flood Zone 2 tolerance decision explicit per scheme.

**Claude – Approach E:** CONDITIONAL  
**Reasoning:** Grey Belt preset + commercial use + <1km station + liquidation + 0.5–3 acres matches strategy/budget; units fine. Planning risk in GB is high; relies on “previously developed” exception and liquidation motivation.  
**Technical Issues:** None on syntax; ensure “Use class: contains any” is supported for this preset.  
**Suggested Fixes:** Add `Planning constraints: does not contain [SSSI, Ancient Woodland, Flood Zone 3]` and include % hardstanding/previously developed verification in workflow.  
**Strategic Notes:** Pre-app mandatory; model longer timelines/affordable housing.

**Codex – Approach A:** CONDITIONAL  
**Reasoning:** MA preset with size, price £10m–£60m, EPC E–G, liquidation/administration, unbroken freehold aligns to PD distress strategy and capital. Syntax risks on price and company status labels.  
**Technical Issues:**  
- `Sales listing price: is between …` may not be a valid operator (should use two conditions).  
- `Company status: Administration` likely needs exact value `In Administration`.  
- Confirm exact field name `Number of leaseholds on the freehold`.  
**Suggested Fixes:**  
- Use `Sales listing price: is greater than 10000000 AND less than 60000000`.  
- Set `Company status: is one of [Liquidation, In Administration]`.  
- Verify leasehold-count field name matches AvailableFiltersInSearchLand_ACTUAL.md.

**Codex – Approach B:** CONDITIONAL  
**Reasoning:** Airspace preset with low height, unbroken freehold, price £5m–£20m aligns; units fine. Same operator/field-name risks as Approach A.  
**Technical Issues:**  
- `Sales listing price: is between …` operator may be invalid.  
- Height field likely `Max building height on title (m)` (verify).  
- Confirm leasehold-count field name.  
**Suggested Fixes:** Use two price bounds; ensure correct height and leasehold field labels.

**Codex – Approach C:** CONDITIONAL  
**Reasoning:** Lease-expiry preset; targets E(b)/E use, lease cliff, size, price; suits capital. Missing explicit PD eligibility and uses potentially invalid use-class values/operators.  
**Technical Issues:**  
- Use class values should use full labels (e.g., `E(b) - Sale of food and drink`, `E - Commercial Business and Service`) with `contains any`.  
- `Sales listing price: is between …` operator risk.  
- No MA/ZA eligibility filter; may surface protected uses.  
**Suggested Fixes:**  
- Replace use-class line with `Use class: contains any [E(b) - Sale of food and drink, E - Commercial Business and Service]`.  
- Use price bounds with > and <.  
- Add `Property classification: does not contain [C3]` or MA-eligibility constraint if targeting PD.  
- Optionally add constraint exclusions (e.g., `Planning constraints: does not contain [Conservation Area, Flood Zone 3]`) for deliverability.

Residual risks across all approaches: need confirmation of exact filter names from `AvailableFiltersInSearchLand_ACTUAL.md`; ensure London PTAL-only filters are paired with LPA filters; and model MEES/EPC upgrade costs in ROI to maintain stated margins.
