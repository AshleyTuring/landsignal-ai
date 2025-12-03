Approaches I'm changing my assessment on:
- Claude - Approach B (Liquidation Arbitrage): Was VALID, now CONDITIONAL because `Ownership type` is a checkbox list that requires `is one of [Company]` (see `Ownership type` operator in `02_VALIDITY_CHECK/Round1/_prompts/iteration_codex_prompt.txt`), so `is equal to Company` may fail to parse.
- Claude - Approach C (Airspace Rights): Was CONDITIONAL, now VALID because `A building in the title has flat roof ✓` is explicitly listed under Building Measurements in `02_VALIDITY_CHECK/Round1/_prompts/iteration_codex_prompt.txt`; remaining items are minor (range split/PTAL scope).
- Codex - Approach A (Slough Precedent): Was VALID, now CONDITIONAL because no `Decision` filter exists in the available-planning section of `02_VALIDITY_CHECK/Round1/_prompts/iteration_codex_prompt.txt`; SearchLand lacks a planning status/decision field.
- Codex - Approach B (C3 to HMO): Was VALID, now CONDITIONAL because `Tenure` is a list filter with operator `is one of` (`02_VALIDITY_CHECK/Round1/_prompts/iteration_codex_prompt.txt`); `is equal to Freehold` is off-spec.
- Codex - Approach C (Unbroken Mixed-Use): Was VALID, now CONDITIONAL because `Property type` values are only Detached/Semi/ Terraced/Flat/Commercial (`02_VALIDITY_CHECK/Round1/_prompts/iteration_codex_prompt.txt`); Mixed Use lives under `Building use group`, so the filter/value pair is invalid.

Approaches I'm maintaining my assessment on:
- Claude - Approach A: Still CONDITIONAL; `Proposal: contains "retail" OR "commercial"` violates the no-inline-OR rule for filter lines noted in `02_VALIDITY_CHECK/Round1/_prompts/iteration_codex_prompt.txt`; use separate `contains` lines.
- Claude - Approach D: Still CONDITIONAL; `Applications in last 5 years` must use a numeric comparator (e.g., `is less than 1`) per the Planning Applications section, and other unconfirmed filters remain.
- Claude - Approach E: Still CONDITIONAL; Article 4 is a dedicated filter (`Article 4` / `% of title subject to Article 4 Directions` appears separately in `02_VALIDITY_CHECK/Round1/_prompts/iteration_codex_prompt.txt`), so `Planning constraints: does not contain [Article 4 Directions]` is mis-specified and HMO licence fields remain undocumented.
- Grok - Approach A (Slough Precedent): Still VALID; precedent-based business case is auto-accepted per user note, and no filter issues surfaced.
- Grok - Approach C: Still VALID; EPC is available (`EPC rating ✓` in `02_VALIDITY_CHECK/Round1/_prompts/iteration_codex_prompt.txt`), and `is one of` generally works for list fields, though `contains any` is safest.

Clarifications:
- `No latest sold date` appears as a supported filter/use-case in `02_VALIDITY_CHECK/Round1/_prompts/iteration_codex_prompt.txt`; treat it as valid rather than fabricating a date workaround.
- Article 4 should be applied via its dedicated filter (or `% of title subject to Article 4 Directions`), not as a Planning Constraints value.
- Text filters don’t support inline boolean (`OR`); use multiple `contains` lines instead of combining terms.
